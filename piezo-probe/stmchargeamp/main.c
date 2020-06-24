#include "stm8.h"

int main() {
    PB_DDR = PB_CR1 = PB_CR2 = (1 << 5);
    while(1) {
        
    }
}
