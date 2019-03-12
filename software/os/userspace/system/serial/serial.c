#include <stdint.h>
#include <stdio.h>
#include "../syscall_lib/syscall.h"
#include <inout.h>
#include <stddef.h>
#include <string.h>

#include "serial.h"

/* file descriptor for serial dev */
int serial_fd;

/* serial dev buffer */
uint8_t in_buffer[BUF_SIZE];
/* index in buffer */
uint16_t in_buf_index;

/* file buffer */
uint8_t file_write_buf[512];
uint16_t file_write_buf_pos;

/* read and write data to serial port */

/* read in a whole buffer */
void _read_buf(){
    if(read(serial_fd, in_buffer, BUF_SIZE) != BUF_SIZE){
        /* abort */
        test_syscall("serial read failure",0,0,0);
    }

    /* write out buf to confirm we got it */
    if(write(serial_fd, in_buffer, BUF_SIZE) != BUF_SIZE){
        /* abort */
        test_syscall("serial write failure",0,0,0);
    }

    in_buf_index = 0;
}

uint8_t _read_byte(){
    if(in_buf_index >= BUF_SIZE){
        _read_buf();
    }
    return in_buffer[in_buf_index++];
}

uint16_t _read_word(){
    return _read_byte() + (_read_byte() << 8);
}

void _read_bytes(uint16_t bytes, uint8_t * buf){
    while(bytes--){
        *(buf++) = _read_byte();
    }
}

void _read_file(struct file * file){
    _read_bytes(FILE_NAME_LEN, file->name);

    file->bytes = _read_word();
    file->is_dir = _read_byte();
    file->is_executable = _read_byte();
    file->dev_num = _read_word();
    file->minor_num = _read_word();
    file->parent_dir = _read_word();
}

/**
 * SCP Program to recive files and directories over the serial port */

struct file files[MAX_FILES];
uint16_t num_files = 0;

void read_files(){
    /* read number of files */
    num_files = _read_word();
    /* read in file headers */
    for(uint16_t i = 0; i < num_files; i++){
        _read_file(&files[i]);
    }
}

/* write to a file buffer */
void file_buf_write(uint16_t fd, uint8_t c){
    if(file_write_buf_pos >= 512){
        if(write(fd, file_write_buf, file_write_buf_pos) != file_write_buf_pos){
            test_syscall("error writing\n");
        }
        file_write_buf_pos = 0;
    }
    file_write_buf[file_write_buf_pos++] = c;
}
/* close buf and write out */
void file_buf_close(uint16_t fd){
    if(write(fd, file_write_buf, file_write_buf_pos) != file_write_buf_pos){
        test_syscall("error writing\n");
    }
}

/* find all files with a given parent index and parent path */
void proc_files(uint16_t parent, char * parent_path){
    uint8_t path[128];
    memset(path, 0, 128);
    for(uint16_t i = 0; i < num_files; i++){
        if(files[i].parent_dir == parent){
            /* construct path */
            strcpy(path, parent_path);
            uint8_t * ptr = path + strlen(path);
            *(ptr++) = '/';
            strcpy(ptr, files[i].name);
            /* handle regular files */
            if(!files[i].is_dir){
                /* create file */
                int fd = creat(path);
                if(fd == -1){
                    test_syscall("error making file\n");
                }
                /* TODO: chmod on exec files */
                /* read in file */
                test_syscall(path);
                test_syscall(" |");
                uint8_t pprogress = 0;
                uint8_t progress = 0;
                file_write_buf_pos = 0;
                for(uint16_t ind=0;ind<files[i].bytes;ind++){
                    progress = (ind<<4)/files[i].bytes;
                    if(progress != pprogress){
                        test_syscall("#");
                    }
                    uint8_t res = _read_byte();
                    /* write bytes into file */
                    file_buf_write(fd, res);
                    pprogress = progress;
                }
                file_buf_close(fd);
                close(fd);
            } else {
                /* create folder */
                if(mkdir(path) == -1){
                    test_syscall("error making dir\n");
                }
                /* recursive find */
                proc_files(i, path);
            }
        }
    }
}

int main(){
    struct termios tio;
    /* open serial port */
    serial_fd = open("/dev/serial0", O_RDWR);
    /* make sure it is open */
    if(serial_fd == -1){
        test_syscall("serial open failure\n");
        while(1);
    }
    /* set it to raw mode */
    tio.flags = TERMIOS_RAW;
    ioctl(serial_fd, TCSETA, (uint8_t *)&tio);
    /* init buffer */
    _read_buf();
    /* Read files */
    read_files();
    /* process files, and write to disk */
    proc_files(0, ".");

    exit(1);
}

