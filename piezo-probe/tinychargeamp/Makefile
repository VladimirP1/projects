TARG=amp
CC = avr-gcc
OBJCOPY = avr-objcopy
SRCS= main.c 
 
OBJS = $(SRCS:.c=.o)
 
MCU=attiny13
 
CFLAGS = -mmcu=$(MCU) -Wall -flto -Os -lm -DF_CPU=9600000
LDFLAGS = -mmcu=$(MCU)  -Wall -flto -Os   
 
all: $(TARG)
 
$(TARG): $(OBJS)
	$(CC) $(LDFLAGS) -o $@.elf  $(OBJS) -lm
	$(OBJCOPY) -O binary -R .eeprom -R .nwram  $@.elf $@.bin
	$(OBJCOPY) -O ihex -R .eeprom -R .nwram  $@.elf $@.hex
 
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<;
 
clean:
	rm -f *.elf *.bin *.hex  $(OBJS) *.map

.PHONY: flash

flash: $(TARG)
	avrdude -u -B30 -cjtag2dw -pt13 -Uflash:w:$<.hex:i
