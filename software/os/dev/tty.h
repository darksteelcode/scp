int _tty_ioctl(int minor,int req_code,uint8_t *val,struct inode *f);
int _tty_close(int minor,struct inode *f);
int _tty_open(int minor,struct inode *f);
int _tty_read(int minor, uint8_t *buf, size_t bytes, uint8_t *eof,struct inode *f);
int _tty_write(int minor, uint8_t *buf, size_t bytes, uint8_t *eof,struct inode *f);
