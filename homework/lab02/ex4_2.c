#include <stdio.h>

int main()
{
    float b = 16777216.000000;
    float c = b;
    float a = 2.1;
    int* ap = (int*)(&a);

    printf("%x\n%f\n%f\n", *ap, (a+b)+c, a+(b+c));
    return 0;
}