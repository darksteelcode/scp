#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

//Opcode definitions
#include "opcodes.c"

#define WARNINGS

//cpu state structure
struct cpu {
    //Primary Registers
    uint16_t reg_a;
    uint16_t reg_b;
    //Program Counter
    uint16_t reg_pc;
    //Stack pointer
    uint16_t reg_sp;
    //Machine privilage level (0=sys, 1=usr)
    uint8_t reg_priv;
    //MMU memory map (higest bit is ignored on each entry)
    /* mmu layout
     * -- Virtual Memory Addr to Physical --
     * The high 5 bits of an addr are the page, low 11 addr in that page (2k pages)
     * The PTB register is added to the high 5 bits, and used as addr in page table
     * -- MMU Table Layout --
     * 2k pages, 128k total memory
     * 2^11 Entries on the table, each being composed of {(1 bit - page enabled),(6 bits - page(of 64 physical pages))}
     * Each process can access 2^5 pages - proc 0 (kenel) is entries 0-31, proc 1 entries 32-63, proc 2 64-47
     * Therefore, the high 6 bits of entry addr is the proc, the low 5 bits the page*/
    //Page Table Base (PTB) register (only low 11 bytes used)
    uint16_t reg_ptb;
    uint8_t mmu_table[2048];
    //physical memory (128 k)
    uint8_t memory[131072];
};

//Read from machine memory
uint8_t cpu_read_mem(struct cpu * cpu, uint16_t addr){
    uint16_t high_addr, low_addr;
    //Get low addr from addr
    low_addr = addr & 0x7ff;
    high_addr = (addr & 0xf800) >> 11;
    //get real high_addr through mmu_table
    high_addr = cpu->mmu_table[(cpu->reg_priv ? cpu->reg_ptb : 0) + high_addr];
    return cpu->memory[(high_addr << 11) + low_addr];
}

//Write to machine memory
uint8_t cpu_write_mem(struct cpu * cpu, uint16_t addr, uint8_t val){
    uint16_t high_addr, low_addr;
    //Get low addr from addr
    low_addr = addr & 0x7ff;
    high_addr = (addr & 0xf800) >> 11;
    //get real high_addr through mmu_table
    high_addr = cpu->mmu_table[(cpu->reg_priv ? cpu->reg_ptb : 0) + high_addr];
    cpu->memory[(high_addr << 11) + low_addr] = val;
}

//Load and cpu's memory from a binary file (writes directly to physical memory, not based on mmu)
//Used to write startup memory
void cpu_init_mem(struct cpu * cpu, char * file_path){
    FILE * fp;
    uint16_t addr;
    size_t n_read;

    uint8_t buf[256];

    fp = fopen(file_path, "r");
    if(fp == NULL){
        printf("No such file: %s\n", file_path);
        exit(1);
    }
    addr = 0;
    
    do{
        n_read = fread(buf, 1, 256, fp);
        memcpy(cpu->memory + addr, buf, n_read);
        addr += 256;
    } while(n_read == 256);
}

//Init the cpu state to that of scp on power on
void cpu_init(struct cpu * cpu){
    //Create mmu_table (only first proc's addr space is inited)
    for(uint16_t i = 0; i < 32; i++){
        cpu->mmu_table[i] = i;
    }
}

//run a cpu cycle
void cpu_cycle(struct cpu * cpu){
    uint8_t opcode;
    uint8_t val8;
    uint16_t val16;
    uint8_t pc_inc;

    pc_inc = 1;

    //fetch the opcode
    opcode = cpu_read_mem(cpu, cpu->reg_pc);
    //fetch the values after the opcode
    val8 = cpu_read_mem(cpu, cpu->reg_pc+1);
    val16 = (val8 << 8) + cpu_read_mem(cpu, cpu->reg_pc+2);
    
    //giant switch for opcodes (seperate out?)
    switch(opcode){
    case NOP:
        break;
    case LBIA:
        cpu->reg_a = val8;
        break;
    case LBIB:
        cpu->reg_b = val8;
        break;
    case LWIA:
        cpu->reg_a = val16;
        break;
    case LWIB:
        cpu->reg_b = val16;
        break;

    case LBPA:
        cpu->reg_a = cpu_read_mem(cpu, cpu->reg_a);
        break;
    case LBPB:
        cpu->reg_b = cpu_read_mem(cpu, cpu->reg_a);
        break;
    case LWPA:
        cpu->reg_a = cpu_read_mem(cpu, cpu->reg_a) + (cpu_read_mem(cpu, cpu->reg_a+1) << 8);
        break;
    case LWPB:
        cpu->reg_b = cpu_read_mem(cpu, cpu->reg_a) + (cpu_read_mem(cpu, cpu->reg_a+1) << 8);
        break;

    case LBQA:
        cpu->reg_a = cpu_read_mem(cpu, cpu->reg_b);
        break;
    case LBQB:
        cpu->reg_b = cpu_read_mem(cpu, cpu->reg_b);
        break;
    case LWQA:
        cpu->reg_a = cpu_read_mem(cpu, cpu->reg_b) + (cpu_read_mem(cpu, cpu->reg_b+1)<<8);
        break;
    case LWQB:
        cpu->reg_b = cpu_read_mem(cpu, cpu->reg_b) + (cpu_read_mem(cpu, cpu->reg_b+1)<<8);
        break;
    
    case LBMA:
        cpu->reg_a = cpu_read_mem(cpu, val16);
        break;
    case LBMB:
        cpu->reg_b = cpu_read_mem(cpu, val16);
        break;
    case LWMA:
        cpu->reg_a = cpu_read_mem(cpu, val16) + (cpu_read_mem(cpu, val16 + 1));
        break;
    case LWMB:
        cpu->reg_b = cpu_read_mem(cpu, val16) + (cpu_read_mem(cpu, val16 + 1));
        break;
    
    case SBPB:
        cpu_write_mem(cpu, cpu->reg_a, (uint8_t)cpu->reg_b);
        break;
    case SBQA:
        cpu_write_mem(cpu, cpu->reg_b, (uint8_t)cpu->reg_a);
        break;
    case SWPB:
        cpu_write_mem(cpu, cpu->reg_a, (uint8_t)cpu->reg_b);
        cpu_write_mem(cpu, cpu->reg_a+1, (uint8_t)((cpu->reg_b)<<8));
        break;
    case SWQA:
        cpu_write_mem(cpu, cpu->reg_b, (uint8_t)cpu->reg_a);
        cpu_write_mem(cpu, cpu->reg_b+1, (uint8_t)((cpu->reg_a)<<8));
        break;

    case SBMA:
        cpu_write_mem(cpu, val16, (uint8_t)cpu->reg_a);
        break;
    case SBMB:
        cpu_write_mem(cpu, val16, (uint8_t)cpu->reg_b);
        break;
    case SWMA:
        cpu_write_mem(cpu, val16, (uint8_t)cpu->reg_a);
        cpu_write_mem(cpu, val16+1, (uint8_t)((cpu->reg_a)<<8));
        break;
    case SWMB:
        cpu_write_mem(cpu, val16, (uint8_t)cpu->reg_b);
        cpu_write_mem(cpu, val16+1, (uint8_t)((cpu->reg_b)<<8));
        break;
    
    case AADD:
        cpu->reg_a = cpu->reg_b + cpu->reg_a;
        break;
    case ASUB:
        cpu->reg_a = cpu->reg_b - cpu->reg_a;
        break;
    case AMUL:
        cpu->reg_a = cpu->reg_b * cpu->reg_a;
        break;
    case ABOR:
        cpu->reg_a = cpu->reg_b | cpu->reg_a;
        break;
    case ABXR:
        cpu->reg_a = cpu->reg_b ^ cpu->reg_a;
        break;
    case ABND:
        cpu->reg_a = cpu->reg_b & cpu->reg_a;
        break;
    case ASSR:
        cpu->reg_a = (int16_t)cpu->reg_b >> (int16_t)cpu->reg_a;
        break;
    case ASHR:
        cpu->reg_a = (uint16_t)cpu->reg_b >> (uint16_t)cpu->reg_a;
        break;
    case ASHL:
        cpu->reg_a = (uint16_t)cpu->reg_b << (uint16_t)cpu->reg_a;
        break;
    case ANEG:
        cpu->reg_a = -(cpu->reg_a);
        break;
    case ALNG:
        cpu->reg_a = !(cpu->reg_a);
        break;
    case ABNG:
        cpu->reg_a = ~(cpu->reg_a);
        break;
    case ACLV:
        cpu->reg_a = (cpu->reg_a) ? 1 : 0;
        break;
    case AEQU:
        cpu->reg_a = cpu->reg_b == cpu->reg_a;
        break;
    case ANEQ:
        cpu->reg_a = cpu->reg_b != cpu->reg_a;
        break;
    case ASLT:
        cpu->reg_a = (int16_t)cpu->reg_b < (int16_t)cpu->reg_a;
        break;
    case AULT:
        cpu->reg_a = cpu->reg_b < cpu->reg_a;
        break;
    case ASLE:
        cpu->reg_a = (int16_t)cpu->reg_b <= (int16_t)cpu->reg_a;
        break;
    case AULE:
        cpu->reg_a = cpu->reg_b <= cpu->reg_a;
        break;
    case ASEX:
        cpu->reg_a = (cpu->reg_a & 0x80) ? (cpu->reg_a | 0xff00) : (cpu->reg_a & 0x00ff);
        break;
    case AAEB:
        cpu->reg_a = cpu->reg_b;
        break;

    case JMP:
        cpu->reg_pc = val16;
        pc_inc = 0;
        break;
    case JPNZ:
        if(cpu->reg_a){
            cpu->reg_pc = val16;
            pc_inc = 0;
        }
        break;
    case JPZ:
        if(!(cpu->reg_a)){
            cpu->reg_pc = val16;
            pc_inc = 0;
        }
        break;
    
    case INCA:
        cpu->reg_a++;
        break;
    case INCB:
        cpu->reg_b++;
        break;
    case DECA:
        cpu->reg_a--;
        break;
    case DECB:
        cpu->reg_b--;
        break;
    
    case XSWP:
        //use val16 as a temp
        val16 = cpu->reg_a;
        cpu->reg_a = cpu->reg_b;
        cpu->reg_b = val16;
        break;
    
    case MDSP:
        cpu->reg_sp += val16;
        break;
    case MASP:
        cpu->reg_sp = cpu->reg_a;
        break;
    case MSPA:
        cpu->reg_a = cpu->reg_sp + val16;
        break;

    case PSHA:
        cpu_write_mem(cpu, cpu->reg_sp--, (uint8_t)((cpu->reg_a)>>8));
        cpu_write_mem(cpu, cpu->reg_sp--, (uint8_t)(cpu->reg_a));
        break;
    case PSHB:
        cpu_write_mem(cpu, cpu->reg_sp--, (uint8_t)((cpu->reg_b)>>8));
        cpu_write_mem(cpu, cpu->reg_sp--, (uint8_t)(cpu->reg_b));
        break;
    case POPA:
        cpu->reg_sp++;
        cpu->reg_a = cpu_read_mem(cpu, cpu->reg_sp++);
        cpu->reg_a += cpu_read_mem(cpu, cpu->reg_sp)<<8;
        break;
    case POPB:
        cpu->reg_sp++;
        cpu->reg_b = cpu_read_mem(cpu, cpu->reg_sp++);
        cpu->reg_b += cpu_read_mem(cpu, cpu->reg_sp)<<8;
        break;

    default:
#ifdef WARNINGS
        printf("Warning: Unrecognized opcode: %u|\n", opcode);
#endif
        break;
    }
    //increment the pc to the next instruction
    if(pc_inc){
        cpu->reg_pc += CMD_LENS[opcode]+1;
    }
    printf("%u\n", cpu->reg_pc);

}

//run the cpu
void cpu_run(struct cpu * cpu){
    while(1){
        cpu_cycle(cpu);
    }
}

struct cpu c;

int main(int argc, char ** argv){
    if(argc != 2){
        printf("Usage: scpemu [bin file]\n");
        exit(1);
    }
    cpu_init(&c);
    cpu_init_mem(&c, argv[1]);
    cpu_run(&c);
}