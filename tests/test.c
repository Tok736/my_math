#include <stdio.h>

#include "my_math.h"
#include "../c_tests/include/c_tests.h"

TEST(arithmetic_tests, plus) {
    int a = 1, b = 2;
    EXPECT(sum(a, b) == 3);
}

int main() {
    run_all_c_tests();

    return 0;
}