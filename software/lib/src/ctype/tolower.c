#include <ctype.h>

int tolower(int c) {
    return((c >= 'A' && c <= 'Z') ? c + 32: c);
}