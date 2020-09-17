#include <stdio.h>

int str2int(char * str) {
    const char ascii_0 = '0';
    const char ascii_9 = '9';
    const int digit = 10;
    int ret = 0;

    while(1) {
        char now = *str;
        if (now != '\0') {
            if (now <= ascii_9 & now >= ascii_0) {
                ret *= 10;
                ret += now - ascii_0;
            }
            else {
                return -1;
            }
        }else {
            return ret;
        }
        str++;
    }
} 

int main()
{
    int hello;
    char *str = "12-3";
    printf("%d %d %d\n", str2int(str), '0', '9');
    return 0;
}