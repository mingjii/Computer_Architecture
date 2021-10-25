#include <stdio.h>

int hammingDistance(int x, int y)
{
    // XOR operation will output 1 if two bit are different.
    int cmpResult = x ^ y;

    // Counting the bits of the compared result.
    int dis = 0;
    while (cmpResult)
    {
        if (cmpResult & 1)
        {
            ++dis; // If the right most bit is 1, result value + 1
        }
        cmpResult >>= 1; // Shift right one bit on every loop.
    }
    return dis;
}

int main()
{
    int x = 1, y = 4;
    printf("The Hamming Distance is %d\n", hammingDistance(x, y));
    return 0;
}