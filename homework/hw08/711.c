#include <stdio.h>
#include <time.h>

int main()
{
    static int array[10000][100000];
    clock_t start, end;
    start = clock();
    double t1, t2;
    for (int i = 0; i < 10000; ++i)
    {
        for (int j = 0; j < 100000; ++j)
        {
            array[i][j] = 2 * array[i][j];
        }
    }
    end = clock();
    t1 = end - start;
    printf("the cost of for-row is %d\n", end - start);

    start = clock();
    for (int i = 0; i < 100000; ++i)
    {
        for (int j = 0; j < 10000; ++j)
        {
            array[j][i] = 2 * array[j][i];
        }
    }
    end = clock();

    t2 = end - start;
    printf("the cost of for-col is %d\n", end - start);

    printf("the ratio is %f", t1 / t2);

    return 0;
}