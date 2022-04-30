#include "stdio.h"

int main(int argc, char **argv) {
    const char *s = "Hello.\n";
    while (*s) putchar(*s++);
    while(1);

    return 0;
}