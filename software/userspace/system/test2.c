#include <stdio.h>
#include <unistd.h>

unsigned char *args[] = {"mkdir", "test_dir1", "test_dir2", NULL};

unsigned char *args2[] = {"ls", "dev", "fsakdj", ".", NULL};

unsigned char *args3[] = {"cat", "fsdfdsa", "-", "test2", NULL};

int main(){
    printf("test2\n");
    uint8_t ret_val;
    if(fork() == 0){
        execv("ls", args2);
        perror("test2 exec failed: ");
    }
    wait(NULL);
    if(fork() == 0){
        execv("cat", args3);
        perror("test2 exec failed: ");
    }
}