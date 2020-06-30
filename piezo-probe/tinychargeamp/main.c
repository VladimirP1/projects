#include <avr/io.h>
#include <avr/power.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/delay.h>

#define led(x) {DDRB=(DDRB&~2)|(((x)!=0)<<1);}

void pwm_init() {
    DDRB |= 1;
    TCCR0A = (1 << COM0A1) | (1 << WGM01) | (1 << WGM00);
    OCR0A = 28;
    TCCR0B=(1<<CS00);
}

void init() {
    _delay_ms(1000);
    //DDRB = (1<<1); // led pin: output 
    ADMUX = (1 << REFS0) | (1 << MUX1) | (1 << MUX0);
    ADCSRA = (1 << ADEN) | (1 << ADIE) | (1 << ADPS1) | (1 << ADPS2) | (1 << ADPS0);
    ADCSRB = (1 << ADTS1) | (1 << ADTS0);
    MCUCR = (1 << SE) | (1 << SM0); // sleep: adc noise reduction
    sleep_bod_disable();
    sei();
    pwm_init();
}

void noise_reduce() {
    power_timer0_disable();
    DDRB &= ~1;
    PORTB &= ~1;
    
}

void noise_reduce_return() {
    DDRB |= 1;
    power_timer0_enable();
}

ISR(ADC_vect) {
    noise_reduce_return();
}


int32_t adc_read0() {
    noise_reduce();
    _delay_us(100);
    sleep_cpu();
    noise_reduce_return();
    return ADC;
}

int32_t measure_offset() {
    uint8_t old_mux = ADMUX;
    ADMUX = (1 << REFS0) | (1 << MUX1);
    adc_read0();
    _delay_us(100);
    long ret = adc_read0();
    ADMUX = old_mux;
    adc_read0();
    _delay_ms(1);
    return ret;
}



int main() {
    init();
    adc_read0();
    _delay_us(100);
    long average = measure_offset() << 5; // 15 bits (0 .. 32767) 
    long integral = 0;
    while (1) {
        long reading = adc_read0() << 5; // 15 bits (0 .. 32767)
        long rate = average - reading;
        integral =- integral / 10;
        integral += rate;
        
        
        //led(integral > 2000);
        if (integral > 6000) {
            led(1);
            _delay_ms(1);
            led(0);
            average = measure_offset() << 5;
        }
        
    }
}
