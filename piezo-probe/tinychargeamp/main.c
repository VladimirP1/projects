#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define SHRT {PORTB|=(1<<3);_delay_ms(200);PORTB&=~(1<<3);}
#define LNG {PORTB|=(1<<3);_delay_ms(1000);PORTB&=~(1<<3);}

/*void out(int x) {
    LNG
    _delay_ms(500);
    while(x) {
        for (int i = (x%10) + 1; i--;) {
            SHRT
            _delay_ms(200);
        }
        x/=10;
        _delay_ms(1000);
    }
    _delay_ms(1000);
}

ISR(ADC_vect) {
    int x = ADC;
    //out(x);
    TIFR0=(1<<OCF0A);
    
    if (x == 0) {
        PORTB |= 1<<3;
    } else {
        PORTB&=~(1<<3);
    }
}*/


void init() {
    _delay_ms(1000);
    DDRB = (1<<3);
    PORTB |= (1<<3);
    ADMUX = (1 << REFS0) | (1 << MUX1);
    ADCSRA = (1 << ADEN); // | (1 << ADIE) | (1 << ADATE);
    ADCSRB = (1 << ADTS1) | (1 << ADTS0);
    //sei();
    OCR0A = 239; // 5khz
    TCNT0 = 0;
    TCCR0A = (1 << WGM01);
    TCCR0B = (1 << CS01);
}

int32_t adc_read0() {
    ADCSRA |= (1 << ADIF) | (1 << ADSC);
    while (!(ADCSRA & (1 << ADIF)));
    return ADC;
}

int32_t adc_read() {
    int32_t ret = 0;
    for (int i = 0; i < 120; ++i) {
        ret += adc_read0();
    }
    return ret/120;
    
}

int main() {
    init();
    int32_t integral = 0;
    int32_t average = 0;
    int debounce = 0;
    while (1) {
        int32_t reading = adc_read() * 100000 / 1024;
        average = (reading * 1 + average * 999) / 1000;
        integral = integral * 900 / 1000;
        integral += reading - average;
        ++debounce;
        if (integral < 100) debounce=0;
        if (debounce > 10) {
            PORTB |= (1 << 3);
            _delay_us(1000);
            PORTB &= ~(1 << 3);
            DDRB |= (1 << 4);
            _delay_us(1000);
            DDRB &= ~(1 << 4);
            integral = 0;
            debounce = 0;
            _delay_ms(10);
            average = adc_read();
            _delay_us(10);
        }
        //_delay_us(10);
    }
}
