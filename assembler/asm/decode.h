/* This file was automatically generated.  Do not edit! */
void check_instr(struct instr *instr);
void line_into_instr(struct instr *instr);
void read_in_arg(char *buf);
int hex2int(char ch);
struct instr_encoding *get_instr_entry(char *name);
uint8_t read_good_line();
uint8_t read_line();
void blanks();
uint8_t is_whitespace(char c);
