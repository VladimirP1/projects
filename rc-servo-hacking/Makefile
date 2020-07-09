TARG=srv
CC = avr-gcc
OBJCOPY = avr-objcopy
SRCS= main.c 
 
OBJS = $(SRCS:.c=.o)
 
MCU=attiny13a
 
CFLAGS = -mmcu=$(MCU) -std=gnu11 -Os -flto -g -Wall -lm -DF_CPU=9600000
LDFLAGS = -mmcu=$(MCU) -Os -flto -g -Wall 
 
all: $(TARG)
 
$(TARG): $(OBJS)
	$(CC) $(LDFLAGS) -o $@.elf  $(OBJS) -lm
	$(OBJCOPY) -O binary -R .eeprom -R .nwram  $@.elf $@.bin
	$(OBJCOPY) -O ihex -R .eeprom -R .nwram  $@.elf $@.hex
 
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<;
 
clean:
	rm -f *.elf *.bin *.hex  $(OBJS) *.map

.PHONY: flash fuse size

flash: $(TARG)
	#avrdude -u -B30 -cjtag2dw -pt13 -Uflash:w:$<.hex:i
	/home/vladimir/TrashDir/dwire-debug/dwdebug l $<.bin , qr

fuse:
	avrdude -cstk500hvsp -P/dev/ttyACM0 -pt13 -U lfuse:w:0xfa:m -U hfuse:w:0xe2:m

size: $(TARG)
	avr-size $<.elf
