#define NOP  0
#define LBIA 1
#define LBIB 2
#define LWIA 3
#define LWIB 4
#define LBPA 5
#define LBPB 6
#define LWPA 7
#define LWPB 8
#define LBQA 9
#define LBQB 10
#define LWQA 11
#define LWQB 12
#define LBMA 13
#define LBMB 14
#define LWMA 15
#define LWMB 16
#define SBPB 17
#define SWPB 18
#define SBQA 19
#define SWQA 20
#define SBMA 21
#define SBMB 22
#define SWMA 23
#define SWMB 24
#define AADD 25
#define ASUB 26
#define AMUL 27
#define ABOR 28
#define ABXR 29
#define ABND 30
#define ASSR 31
#define ASHR 32
#define ASHL 33
#define ANEG 34
#define ALNG 35
#define ABNG 36
#define ACLV 37
#define AEQU 38
#define ANEQ 39
#define ASLT 40
#define AULT 41
#define ASLE 42
#define AULE 43
#define ASEX 44
#define AAEB 45

#define JMP  46
#define JPNZ 47
#define JPZ  48
#define INCA 49
#define INCB 50
#define DECA 51
#define DECB 52
#define XSWP 53
#define MDSP 54
#define MASP 55
#define MSPA 56
#define PSHA 57
#define PSHB 58
#define POPA 59
#define POPB 60
#define CALL 61
#define RET  62
#define OUTA 63
#define INA  64
#define JMPA 65
#define APTB 66
#define PRVU 67
#define PRVS 68
#define MMUS 69
#define BSPA 70
#define BDSP 71
#define BSPL 72
uint8_t CMD_LENS[256] = {0,  1,  1,  2,  2,  0,  0,  0,  0,  0,  0,  0,  0,  2,  2,  2,  2,  0,  0,  0,  0,  2,  2,  2,  2,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  2,  2,  2,  0,  0,  0,  0,  0,  2,  0,  2,  0,  0,  0,  0,  2,  0,  0,  0,  0,  0,  0,  0,  0,  1,  1,  1, };