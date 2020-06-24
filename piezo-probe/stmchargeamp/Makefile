TARG=amp
CC = sdcc
OBJCOPY = stm8-objcopy
SRCS= main.c 
 
OBJS = $(SRCS:.c=.rel)
 
MCU=attiny13
 
CFLAGS = -mstm8 --opt-code-size 
LDFLAGS = -mstm8  --out-fmt-elf --opt-code-size
 
all: $(TARG)
 
$(TARG): $(OBJS)
	$(CC) $(LDFLAGS) -o $@.elf  $(OBJS) -lm
	$(OBJCOPY) -O binary -R .eeprom -R .nwram  $@.elf $@.bin
	$(OBJCOPY) -O ihex -R .eeprom -R .nwram  $@.elf $@.hex
 
%.rel: %.c
	$(CC) $(CFLAGS) -c -o $@ $<;

clean:
	rm -f *.elf *.bin *.hex  $(OBJS) *.map *.lk *.asm *.lst *.sym *.cdb *.rst

.PHONY: flash

flash: $(TARG)
	stm8flash -cstlinkv2 -pstm8s003f3 -s flash -w $<.bin -b 8192
