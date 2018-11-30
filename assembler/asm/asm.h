#ifndef _ASMH
#define _ASMH

#include <stdint.h>
#include <stdio.h>

#include "defs.h"
/* describes the encoding of an instruction */
enum arg_type {end_arg, reg, alu, cnst, label, cond};

struct instr_encoding {
  char * name;
  uint8_t opcode;
  enum arg_type types[MAX_ARGS];
  char * encoding;
  /* which field to use as immediate - 0=no immediate (opcode can't be immediate) */
  uint8_t imd_field;
};

#define num_instructions sizeof(instructions)/sizeof(struct instr_encoding)

/* an argument to a struct instr */
struct arg {
  /* if the arg is used */
  uint8_t in_use;
  /* the arg (not including offsets) */
  char str[ARG_LEN];
  /* the arg's value (calculated by atoi - for labels, etc, this is zero) */
  uint16_t val;
  /* if arg could be a reg, this is the reg number (0-15) */
  uint8_t is_reg;
  uint8_t reg;
  /* if the arg could be an alu, this is the alu op number */
  uint8_t is_alu;
  uint8_t alu_op;
  /* if the arg could be a condition code, this is the code */
  uint8_t is_cond;
  uint8_t cond_code;
  /* the offset (calculated from +x) */
  uint16_t offset;
};

/* a struct representing an instruction from the asm */
struct instr {
  /* name */
  char name[CMD_NAME_SIZE];
  /* the opcode of the instruction, or -1 if the instruction isn't a direct asm instr */
  int opcode;
  /* encoding entry, or NULL if not a direct asm instr */
  struct instr_encoding *encoding;
  /* if true, instruction is a label (name holds the name of the label) */
  uint8_t is_label;
  /* if true, instruction is directive (name holds name WITH . in it) */
  uint8_t is_dir;
  /* arguments */
  struct arg args[MAX_ARGS];
};

/* currently read in line */
extern char line[LINE_SIZE];
extern int lptr;

extern char * alu_ops[16];
struct instr_encoding instructions[64];

/* debug file */
extern FILE * debug_file;
extern uint8_t do_debug;

/* label desription */
struct label {
  char name[LABEL_SIZE];
  /* module number, or -1 for not a global label */
  int16_t module;
  /* the address of the label */
  uint16_t addr;
};

#endif