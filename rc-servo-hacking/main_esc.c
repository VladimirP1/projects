#include <avr/io.h>
#include <avr/power.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <avr/eeprom.h>
#include <util/delay.h>

uint16_t rc_read();
void calibrate();
int16_t  mid;

void pwm_init() {
    DDRB |= 3;
    TCCR0A = (1 << COM0A1) | (1 << COM0B1) | (1 << WGM01) | (1 << WGM00);
    OCR0A = 0;
    OCR0B = 0;
    TCCR0B = (1<<CS01) | (1 << CS00);
}

void init() {
    pwm_init();
    //calibrate();
}

void calibrate() {
    _delay_ms(100);
    uint16_t x = rc_read();
    if (x > 3000) x = 3000;
    if (x < 0) x = 0;
    eeprom_write_word(4, x);
}

uint16_t rc_read() {
    uint16_t loops = 0;
    const uint8_t one = 1;
    const uint8_t zero = 0;
    while (PINB & (1 << 2));
    while(!(PINB & (1 << 2)));
    asm volatile(" \
    fix: \n\
        inc %[loopshi] ; 1 \n\
        rjmp fixret ; 2 \n\
    wait0: \n\
        inc %[loopslo] ; 1 \n\
        tst %[loopslo] ; 1 \n\
        breq fix ; 1/2 \n\
    fixret: \n\
        sbic %[pinb], 2 ; 1/2 \n\
        rjmp wait0 ; 2 \n\
        nop \n\
    " 
    : [loopslo] "+d" (*((uint8_t*)&loops)), [loopshi] "+d" (*(((uint8_t*)&loops) + 1))
    : [pinb] "I" (_SFR_IO_ADDR(PINB)), [one] "r" (one), [zero] "r" (zero)
    :);
    return ((uint32_t)loops) * 62 / 100;
}



int main() {
    init();
    mid = eeprom_read_word(4);
    
    while(1) {
        int16_t us = rc_read() - mid;
        if (us < -500) us = -500;
        if (us > 500) us = 500;
        if (us < 0) {
            OCR0A = -us / 2;
            OCR0B = 0;
        } else {
            OCR0B = us / 2;
            OCR0A = 0;
        }
        _delay_ms(10);
        /*OCR0A = 255;
        _delay_ms(20);
        OCR0A = 0;
        _delay_ms(100);*/
    }
    
    
}
