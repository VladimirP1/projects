#include <avr/eeprom.h>
#include <avr/io.h>
#include <avr/power.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/delay.h>

#define led(x) {DDRB=(DDRB&~2)|(((x)!=0)<<1);}

void beep() {
    DDRB |= (1 << 3);
    for (unsigned int x = 0; x < 100; ++x) {
        PORTB ^= (1 << 3);
        _delay_us(500);
    }
    DDRB &= ~(1 << 3);
    _delay_ms(10);
}

void long_beep() {
    for (short i = 0; i < 20; ++i) {
        beep();
    }
}

void pwm_init() {
    DDRB |= 1;
    TCCR0A = (1 << COM0A1) | (1 << WGM01) | (1 << WGM00);
    OCR0A = 28;
    TCCR0B=(1<<CS00);
}

void init() {
    ADMUX = (1 << REFS0) | (1 << MUX1) | (1 << MUX0);
    ADCSRA = (1 << ADEN) | (1 << ADIE) | (1 << ADPS1) | (1 << ADPS2) | (1 << ADPS0);
    ADCSRB = (1 << ADTS1) | (1 << ADTS0);
    MCUCR = (1 << SE) | (1 << SM0); // sleep: adc noise reduction
    sei();
    pwm_init();
    _delay_ms(1000);
    beep();
    _delay_ms(20);
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

EMPTY_INTERRUPT(ADC_vect);


long adc_read0() {
    noise_reduce();
    _delay_us(100);
    sleep_cpu();
    noise_reduce_return();
    return ADC;
}

long measure_offset() {
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
    long thresold = 9000;
    unsigned short decay = 3;

    unsigned int mode_ticks = 4000;
    unsigned short mode = 0;
    unsigned short press_cnt = 0;
    unsigned short menu = 0;
    unsigned short menu_val = 0;
    while (1) {
        long reading = adc_read0() << 5; // 15 bits (0 .. 32767)
        long rate = average - reading;
        integral =- integral >> decay;
        integral += rate;
        
        if (integral > thresold) {
            led(1);
            _delay_ms(1);
            led(0);
            if (mode_ticks && (mode == 1)) {
                menu = (menu ? (menu+1) : 1) & 3;
                for (short i = 0; i < menu; ++i) {
                    beep();
                    _delay_ms(200);
                }
                mode_ticks = 8000;
            }
            if (mode_ticks && (mode == 2) && menu) {
                menu_val = (menu_val ? (menu_val + 1) : 1) & 7;
                for (short i = 0; i < menu_val; ++i) {
                    beep();
                    beep();
                    beep();
                    _delay_ms(200);
                }
                eeprom_write_byte((uint8_t*) menu, menu_val);
                mode_ticks = 8000;
            }
            if (mode_ticks && (mode == 0)) {
                _delay_ms(10);
                beep();
                mode_ticks = 4000;
                ++press_cnt;
                if (press_cnt == 3) {
                    long_beep();
                    menu = 0;
                    mode_ticks = 8000;
                    mode = 1;
                }
            }
            //if (!mode_ticks) {
            //    beep();
            //}
            average = measure_offset() << 5;
        }
        
        if (mode_ticks == 1) {
            switch(mode) {
                case 1:
                    mode = 2;
                    mode_ticks = 16000;
                    break;
                case 0:
                case 2:
                    thresold = eeprom_read_byte((uint8_t*) 1) * 3000;
                    decay = eeprom_read_byte((uint8_t*) 2);
                    break;
            }
        }
        mode_ticks -= (mode_ticks > 0);
    }
}
