#include <stdio.h>

int main() {
    int multiplier = 2;
    unsigned long long value = 1;
    unsigned long long next_value = value * multiplier;
    while (next_value / value == multiplier) {
        value = next_value;
        next_value = value * ++multiplier;
    }
    printf("answer (max available value, which factorial avoids byte overflow) = %d\n", multiplier - 1);
    return 0;
}
