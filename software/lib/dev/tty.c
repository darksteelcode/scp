/**
 * Device driver for the vga text output and ps2 keyboard input
 * together, they make up the main teletype terminal
 * Edward Wawrzynek
 */

#include "dev.h"

#include <inout.h>
#include <stdint.h>

/* tty device structure */
struct _tty_dev {
    /* x position */
    uint8_t pos_x;
    /* y position */
    uint8_t pos_y;
};

/* only one tty is supported right now - other ttys will probably need different drivers */
struct _tty_dev tty;

/* scroll the text on the screen */
static void tty_scroll(){
    int i, val;
    /* move text up */
    for(i = 0; i < 1920; i++){
        outp(5, i+80);
        val = inp(_text_data_port);
        outp(5, i);
        outp(6, val);
    }
    /* clear last line */
    for(i = 1920; i < 2000; i++){
        outp(5, i);
        outp(6, '\0');
    }
}

/* write out a char */
static int tty_putc(char c){

    if(tty.pos_x >= 80){
        tty.pos_x = 0;
        tty.pos_y++;
    }
    if(tty.pos_y >= 25){
        tty_scroll();
        tty.pos_y = 24;
        tty.pos_x = 0;
    }

    if(c == '\n'){
        tty.pos_x = 0;
        tty.pos_y++;

        if(tty.pos_y >= 25){
            tty_scroll();
            tty.pos_y = 24;
            tty.pos_x = 0;
        }
    } else if (c == '\t'){
        if(!(tty.pos_x & 0x7)){tty.pos_x++;}
        while(tty.pos_x & 0x7){
            tty.pos_x++;
        }
    }
    else {
        outp(5, (tty.pos_y * 80) + tty.pos_x);
        outp(6, c);

        tty.pos_x++;
    }
    return 0;
}

/* read in a char from the txt input */
int tty_getc(){
    int inWaiting = inp(_key_in_waiting_port);
    if(inWaiting){
        uint16_t res = inp(_key_data_in_port);
        outp(7, 1);
        /* check for release */
        if(!(res & 0xff00)){
            return res;
        }
    }

    /* not eof, just blocking */
    return -2;
}

/* open a tty - only allow openning a single tty */
int _tty_open(int minor){
    if(minor)
        return 1;

    tty.pos_x = 0;
    tty.pos_y = 0;
    return 0;
}

/* close the tty */
int _tty_close(int minor){
    return 0;
}

/* write - just call tty_putc */
gen_write_from_putc(_tty_write, tty_putc)

gen_read_from_getc(_tty_read, tty_getc)

/* write wrapper */
void write(int (*func)(int, uint8_t *, size_t, uint8_t *), char *msg, size_t bytes){
    uint8_t eof;
    func(0, msg, bytes, &eof);
}

/* read wrapper */
void read(int (*func)(int, uint8_t *, size_t, uint8_t *), char *msg, size_t bytes){
    uint8_t eof;
    int size;

    do{
        size = func(0, msg, bytes, &eof);
        if(eof){
            return;
        }
        msg += size;
        bytes -= size;
    } while(bytes);
}

char *msg = "hello, world!";

char buf[200];

int main(){
    uint8_t b;
    uint8_t eof = 65;
    uint8_t a;
    /*_tty_write(0, msg, 13, &eof);*/
    write(_tty_write, "hello, world! This is a test", 28);
    while(1){
        read(_tty_read, buf, 1);
        write(_tty_write, buf, 1);
    }
}