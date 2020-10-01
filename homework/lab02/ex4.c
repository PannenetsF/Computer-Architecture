#include <stdio.h>
#include <inttypes.h>

int main()
{

    unsigned a = 0x7f7fffffu;
    float* ap = (float*)(&a);
    unsigned b = 0x7effffffu;
    float* bp = (float*)(&b);
    unsigned c = 0xfeffffffu;
    float* cp = (float*)(&c);
    printf("%f\n%f\n%f\n%f\n%f\n", (*ap), *bp, *cp, (*ap + *bp + *cp), (*ap + *cp + *bp));
}