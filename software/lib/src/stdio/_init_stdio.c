#include <stdio.h>
#include <syscall.h>

struct _file * stdin;
struct _file * stdout;
struct _file * stderr;

/* init std FILE's (called from crt0) */
void _init_stdio(){
    stdin = fdopen(STDIN_FILENO, "r");
    stdout = fdopen(STDOUT_FILENO, "w");
    stderr = fdopen(STDERR_FILENO, "w");

    /* setup modes */
    setvbuf(stdin, NULL, _IOLBF, 0);
    setvbuf(stdout, NULL, _IOLBF, 0);
    setvbuf(stderr, NULL, _IONBF, 0);
}

/* close stdio (flush all buffers) */
void _close_stdio(){
    for(int i = 0; i < FOPEN_MAX; i++){
        if(_open_files[i] != NULL){
            fclose(_open_files[i]);
        }
    }
}