/* This file was automatically generated.  Do not edit! */
void write_word(uint16_t val);
void write_byte(uint8_t val);
void set_seg(uint8_t seg);
void create_segs(uint8_t do_head,uint8_t do_pages);
extern uint16_t seg_pos[4];
extern uint8_t cur_seg;
extern uint16_t in_segs_start[MAX_FILES][4];
extern uint16_t seg_start[4];
extern uint16_t seg_size[4];
void raw_output_word(uint16_t word);
void raw_output_byte(uint8_t val);
void read_in_headers();
void error(char *msg);
extern FILE *out_file;
extern int cur_in_obj;
extern struct obj_file in_objs[MAX_FILES];