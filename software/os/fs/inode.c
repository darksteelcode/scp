#include "include/defs.h"
#include "fs/incl.h"
#include "lib/incl.h"

//TODO: put last allocd inode in superblock for fast new inode alloc

//Inode table
struct inode inode_table[INODE_TABLE_ENTRIES];

/* alloc a free inode from the table - don't adjust refs
 * returns (struct inode *) */

inode_alloc(){
    uint16_t i;
    for(i = 0; i < INODE_TABLE_ENTRIES; ++i){
#ifndef INODE_TABLE_KEEP_OPEN
            if(inode_table[i].refs == 0)
#endif
#ifdef INODE_TABLE_KEEP_OPEN
            if(inode_table[i].blks == 0)
#endif
        {
            return inode_table + i;
        }
    }
#ifdef INODE_TABLE_KEEP_OPEN

    for(i = 0; i < INODE_TABLE_ENTRIES; ++i){
        if(!inode_table[i].refs){
            if(inode_table[i].blks){
                inode_force_put(inode_table + i);
            }
            return inode_table+i;
        }
    }

#endif
    panic(PANIC_INODE_TABLE_FULL);
}

/* load a disk_inode from disk into the inode pointer, in-core values are left
 * returns (none) */

inode_load(struct inode * in, uint16_t inum){
    uint16_t blk_num, offset;
    //don't load if inum is higher than number of inodes
    if(inum >= superblk.num_inodes){
        panic(PANIC_INODE_NUMBER_TOO_HIGH);
    }
    //figure out what disk blk the inode is on
    blk_num = INODE_TABLE_ADDR + (inum>>INODES_PER_BLK_EXP);
    offset = (inum & INODES_PER_BLK_MASK) * sizeof(struct disk_inode);
    //read in block with inode
    disk_read(blk_num, fs_global_buf);
    //read in inode from blk
    memcpy(in, fs_global_buf+offset, sizeof(struct disk_inode));
}

/* write a disk_inode to disk - just copies values, no other processing
 * returns (none) */

inode_write(struct inode * in, uint16_t inum){
    uint16_t blk_num, offset;
    //don't load if inum is higher than number of inodes
    if(inum >= superblk.num_inodes){
        panic(PANIC_INODE_NUMBER_TOO_HIGH);
    }
    //figure out what disk blk the inode is on
    blk_num = INODE_TABLE_ADDR + (inum>>INODES_PER_BLK_EXP);
    offset = (inum & INODES_PER_BLK_MASK) * sizeof(struct disk_inode);
    //read in block with inode
    disk_read(blk_num, fs_global_buf);
    //copy inode to buffer
    memcpy(fs_global_buf+offset, in, sizeof(struct disk_inode));
    //write out
    disk_write(blk_num, fs_global_buf);
}

/* gets an inode in the inode table for a specified inum, loading in a new one
 * if nessesary, setting in-core values
 * returns (struct inode *) - the inode, or NULL on failure */

inode_get(uint16_t inum){
    uint16_t i;
    struct inode * res;
    //check if it is already loaded
    for(i = 0; i < INODE_TABLE_ENTRIES; ++i){
        //Make sure the entry has at least 1 ref, or else inode 0 will be falsly
        //returned on any free entry
#ifndef INODE_TABLE_KEEP_OPEN
         if(inode_table[i].inum == inum && inode_table[i].refs)
#endif
#ifdef INODE_TABLE_KEEP_OPEN
         if(inode_table[i].inum == inum && inode_table[i].blks)
#endif
        {
            //inc refs
            ++inode_table[i].refs;
            return inode_table + i;
        }
    }
    //get a new inode
    res = inode_alloc();
    //read in data
    inode_load(res, inum);
    //if the inode is not marked as in use, return failure
    if(!(res->in_use)){
        return NULL;
    }
    //set refs
    res->refs = 1;
    //set inum
    res->inum = inum;
    //load block list
    res->blks = balloc_get(res->disk_blk, &(res->num_blks));
    //if blks is null, the disk_blk is an invalid block
    if(res->blks == NULL){
        //probably due to an inum of 0 or 1
        inode_put(res);
        return NULL;
        //panic(PANIC_INODE_REFS_BAD_BLOCK);
    }
    return res;
}

/* releases an inode, and, if its ref count is zero, deallocates its blk list,
 * writes it to disk, and frees the in-core copy for future use
 * returns (none) */

inode_put(struct inode * in){
    //dec references
    --in->refs;
    //if the inode is no longer referenced, free it
//don't do this if entries are kept open
#ifndef INODE_TABLE_KEEP_OPEN
    if(!in->refs){
        inode_force_put(in);
    }
#endif
}

/* releases an inode, regardless of its refs count - shouldn't be called directly
 * returns (none) */

inode_force_put(struct inode * in){
    //only write if the inode is referencing an inode other than the 0 inode
    //0 inode shouldn't be changed directly, and unloaded inodes have inum set to zero anyway
    if(in->inum){
        kfree(in->blks);
        //mark blocks as null for use with INODE_TABLE_KEEP_OPEN
        in->blks = NULL;
        inode_write(in, in->inum);
    }
}

/* release all inodes
 * returns none */

inode_put_all(){
    uint16_t i;
    for(i = 0; i < INODE_TABLE_ENTRIES; ++i){
        inode_force_put(inode_table+i);
    }
}

/* adds a block to an in-core inode - this writes the new list to disk to stop
 * balloc_alloc() from returning the block twice.
 * returns (none) - the new blk number should be accessed through the blks list */

inode_add_blk(struct inode * ind){
    //The old size alloc'd
    uint16_t old_size;
    uint16_t *i;
    //figure out the current size
    //TODO:kindof inefficient to do search, mabye this should be in struct inode
    old_size = 0;
    i = ind->blks;
    do{++old_size;} while(*(i++));
    //realloc
    ind->blks = krealloc(ind->blks, (old_size+1)<<1);
    //set the new blk
    (ind->blks)[old_size-1] = balloc_alloc();
    //set last item as zero
    (ind->blks)[old_size] = 0;
    //inc number of blks
    ++ind->num_blks;
    //write to disk to mark block as used
    balloc_put(ind->blks);
}

/* truncate an inode, setting its size to zero, freeing its blocks, assigning
 * it a first starting block, and setting num_blks
 * returns (none) */

inode_truncate(struct inode * ind){
    uint16_t blks[2];
    uint16_t *i;
    //set size
    ind->size = 0;
    //free blks
    balloc_free(ind->disk_blk);
    //add a block
    ind->disk_blk = balloc_alloc();
    blks[0] = ind->disk_blk;
    blks[1] = 0;
    balloc_put(blks);
    kfree(ind->blks);
    ind->blks = balloc_get(ind->disk_blk, &(ind->num_blks));
}

/* creates a new inode on disk, init'ing its in_use, disk_blk, links, and size
 * properties, and setting its dev_num and flags from args. Sets links to 1
 * this function assumes that any inode with in_use clear doesn't have any blks
 * or other resources allocated to it
 * returns (uint16_t) - the inum of the new inode */

inode_new(uint16_t dev_num, uint8_t flags){
    uint16_t i;
    struct inode ind;
    uint16_t blks[2];
    //search the disk for a free inode, using inode_load
    //TODO:this is VERY INEFFICIENT
    for(i = 0; i < superblk.num_inodes; ++i){
        inode_load(&ind, i);
        if(!ind.in_use){
            //This inode is good
            //mark it as in_use
            ind.in_use = 1;
            //clear other properties, setting links to 1
            ind.links = 1;
            ind.size = 0;
            //set args
            ind.dev_num = dev_num;
            ind.flags = flags;
            //init a block
            ind.disk_blk = balloc_alloc();
            //write block as in use
            blks[0] = ind.disk_blk;
            blks[1] = 0;
            balloc_put(blks);
            //write inode to disk
            inode_write(&ind, i);
            //return inum
            return i;
        }
    }
    //no free inodes
    panic(PANIC_NO_FREE_INODES);
}

/* deletes an inode from disk, clearing its in_use flag, setting its links to 0,
 * and freeing all of the blocks alloc'd to it. This function deletes the inode
 * regardless of if it is being used
 * returns (none) */

inode_delete(uint16_t inum){
    struct inode ind;
    //load inode
    inode_load(&ind, inum);
    //clear some values
    ind.links = 0;
    ind.size = 0;
    ind.in_use = 0;
    //free blks
    balloc_free(ind.disk_blk);
    //write to disk
    inode_write(&ind, inum);

}