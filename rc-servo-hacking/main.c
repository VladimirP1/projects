#include <avr/io.h>
#include <avr/power.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/delay.h>

#define CHAN_OUTPUT 3
#define CHAN_INPUT 1


void init() {
    DDRB = 1;
    PORTB = 0;
    DIDR0 = (1 << 2) | (1 << 3);
    _delay_ms(1000);
    ADMUX = (1 << REFS0) | (1 << MUX1) | (1 << MUX0);
    ADCSRA = (1 << ADEN) | (1 << ADPS1);
    
}

int32_t adc_read() {
    ADCSRA |= (1 << ADSC) | (1 << ADIF);
    while (!(ADCSRA & (1 << ADIF)));
    return ADC;
}

void adc_channel(uint8_t x) {
    ADMUX = (1 << REFS0) | x;
}




int main() {
    init();
    uint16_t target_volt = 512;
    uint16_t limit = 10000;
    while (1) {
        for(uint16_t j = 1000; j--;) {
            if (adc_read() < target_volt) {
                PORTB = 1;
                _delay_us(12);
                PORTB = 0;
                _delay_us(1);
            }
            if (limit) {
                --limit;
                _delay_us(50);
            }
        }
    }
}
