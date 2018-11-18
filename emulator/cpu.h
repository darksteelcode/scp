#include <cstdint>
#include "io/io.h"

class CPU {
    public:
    /* regfile */
    uint16_t regs[16];
    /* program counter */
    uint16_t pc;
    /* system privilage reg */
    uint8_t priv_lv;
    /* page table base reg*/
    uint16_t ptb;
    /* flags reg */
    uint8_t flags;
    /* the memory managment unit page table
        128 pages (256k memory) * 32 pages (64k) per process */
    uint8_t page_table[4096];
    /* the machine's memory - some will be device mapped memory*/
    uint8_t mem[262144];

    /* the instruction register - the last loaded instruction */
    uint16_t instr_reg;
    /* the imeddiate register - last loaded immediate */
    uint16_t imd_reg;

    /* the machine's io subsystem */
    IO io;

    private:
    /* get the real physical addr in memory from a 16bit addr */
    uint32_t hard_addr(uint16_t addr);
    /* read from memory */
    uint8_t read_byte(uint16_t addr);
    uint16_t read_word(uint16_t addr);
    /* write to memory */
    void write_byte(uint16_t addr, uint8_t val);
    void write_word(uint16_t addr, uint16_t val);

    /* preform an alu operation on two operands */
    uint16_t alu(uint8_t opcode, uint16_t a, uint16_t b);
    /* compare a and b, and set flags appropriatley */
    void alu_cmp(uint16_t a, uint16_t b);
    /* sign extend a value */
    uint16_t sign_extend(uint16_t val);

    /* execute an instruction */
    void execute(uint16_t instr, uint16_t imd);


    public:
    /* init the machine to startup state (not counting memory), or io */
    void reset();
    /* start up the machine's io */
    void init_io(char * serial_port);
    /* update the machine's io */
    void update_io();
    /* read a binary file into memory */
    void read_file(const char * path);
    /* run a single cpu instruction cycle */
    void run_instr();
};