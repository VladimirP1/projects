	.file	"main.c"
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.comm	mid,2,1
.global	pwm_init
	.type	pwm_init, @function
pwm_init:
	push r28
	push r29
	in r28,__SP_L__
	clr r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	ldi r24,lo8(55)
	ldi r25,0
	movw r30,r24
	ld r18,Z
	ldi r24,lo8(55)
	ldi r25,0
	ori r18,lo8(3)
	movw r30,r24
	st Z,r18
	ldi r24,lo8(79)
	ldi r25,0
	ldi r18,lo8(-93)
	movw r30,r24
	st Z,r18
	ldi r24,lo8(86)
	ldi r25,0
	movw r30,r24
	st Z,__zero_reg__
	ldi r24,lo8(73)
	ldi r25,0
	movw r30,r24
	st Z,__zero_reg__
	ldi r24,lo8(83)
	ldi r25,0
	ldi r18,lo8(3)
	movw r30,r24
	st Z,r18
	nop
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	pwm_init, .-pwm_init
.global	init
	.type	init, @function
init:
	push r28
	push r29
	in r28,__SP_L__
	clr r29
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	rcall pwm_init
	nop
/* epilogue start */
	pop r29
	pop r28
	ret
	.size	init, .-init
.global	__mulsf3
.global	__ltsf2
.global	__gtsf2
.global	__fixunssfsi
.global	calibrate
	.type	calibrate, @function
calibrate:
	push r28
	push r29
	in r28,__SP_L__
	clr r29
	subi r28,lo8(-(-38))
	out __SP_L__,r28
/* prologue: function */
/* frame size = 38 */
/* stack size = 40 */
.L__stack_usage = 40
	ldi r24,0
	ldi r25,0
	ldi r26,lo8(-56)
	ldi r27,lo8(66)
	std Y+5,r24
	std Y+6,r25
	std Y+7,r26
	std Y+8,r27
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(122)
	ldi r21,lo8(67)
	ldd r22,Y+5
	ldd r23,Y+6
	ldd r24,Y+7
	ldd r25,Y+8
	rcall __mulsf3
	std Y+23,r22
	std Y+24,r23
	std Y+25,r24
	std Y+26,r25
	ldd r24,Y+23
	ldd r25,Y+24
	ldd r26,Y+25
	ldd r27,Y+26
	std Y+9,r24
	std Y+10,r25
	std Y+11,r26
	std Y+12,r27
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-128)
	ldi r21,lo8(63)
	ldd r22,Y+9
	ldd r23,Y+10
	ldd r24,Y+11
	ldd r25,Y+12
	rcall __ltsf2
	tst r24
	brge .L19
	ldi r24,lo8(1)
	ldi r25,0
	std Y+14,r25
	std Y+13,r24
	rjmp .L6
.L19:
	ldi r18,0
	ldi r19,lo8(-1)
	ldi r20,lo8(127)
	ldi r21,lo8(71)
	ldd r22,Y+9
	ldd r23,Y+10
	ldd r24,Y+11
	ldd r25,Y+12
	rcall __gtsf2
	cp __zero_reg__,r24
	brge .L20
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(32)
	ldi r21,lo8(65)
	ldd r22,Y+5
	ldd r23,Y+6
	ldd r24,Y+7
	ldd r25,Y+8
	rcall __mulsf3
	std Y+27,r22
	std Y+28,r23
	std Y+29,r24
	std Y+30,r25
	ldd r24,Y+27
	ldd r25,Y+28
	ldd r26,Y+29
	ldd r27,Y+30
	std Y+19,r24
	std Y+20,r25
	std Y+21,r26
	std Y+22,r27
	ldd r22,Y+19
	ldd r23,Y+20
	ldd r24,Y+21
	ldd r25,Y+22
	rcall __fixunssfsi
	std Y+31,r22
	std Y+32,r23
	std Y+33,r24
	std Y+34,r25
	ldd r26,Y+31
	ldd r27,Y+32
	std Y+14,r27
	std Y+13,r26
	rjmp .L9
.L10:
	ldi r24,lo8(25)
	ldi r25,0
	std Y+16,r25
	std Y+15,r24
	ldd r24,Y+15
	ldd r25,Y+16
/* #APP */
 ;  105 "/usr/avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+16,r25
	std Y+15,r24
	nop
	ldd r24,Y+13
	ldd r25,Y+14
	sbiw r24,1
	std Y+14,r25
	std Y+13,r24
.L9:
	ldd r24,Y+13
	ldd r25,Y+14
	or r24,r25
	brne .L10
	rjmp .L11
.L20:
	ldd r22,Y+9
	ldd r23,Y+10
	ldd r24,Y+11
	ldd r25,Y+12
	rcall __fixunssfsi
	std Y+35,r22
	std Y+36,r23
	std Y+37,r24
	std Y+38,r25
	ldd r24,Y+35
	ldd r25,Y+36
	std Y+14,r25
	std Y+13,r24
.L6:
	ldd r24,Y+13
	ldd r25,Y+14
	std Y+18,r25
	std Y+17,r24
	ldd r24,Y+17
	ldd r25,Y+18
/* #APP */
 ;  105 "/usr/avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+18,r25
	std Y+17,r24
	nop
.L11:
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
	rjmp .L12
.L13:
	rcall rc_read
	ldd r24,Y+1
	ldd r25,Y+2
	adiw r24,1
	std Y+2,r25
	std Y+1,r24
.L12:
	ldd r24,Y+1
	ldd r25,Y+2
	cpi r24,100
	cpc r25,__zero_reg__
	brlt .L13
	rcall rc_read
	lsr r25
	ror r24
	std Y+4,r25
	std Y+3,r24
	ldd r24,Y+3
	ldd r25,Y+4
	cpi r24,53
	sbci r25,8
	brlo .L14
	ldi r24,lo8(52)
	ldi r25,lo8(8)
	std Y+4,r25
	std Y+3,r24
.L14:
	ldd r24,Y+3
	ldd r25,Y+4
	cpi r24,-124
	sbci r25,3
	brsh .L15
	ldi r24,lo8(-124)
	ldi r25,lo8(3)
	std Y+4,r25
	std Y+3,r24
.L15:
	ldi r22,lo8(-36)
	ldi r23,lo8(5)
	ldi r24,lo8(4)
	ldi r25,0
	rcall eeprom_write_word
.L16:
	rjmp .L16
	.size	calibrate, .-calibrate
.global	rc_read
	.type	rc_read, @function
rc_read:
	push r28
	push r29
	in r28,__SP_L__
	clr r29
	subi r28,lo8(-(-4))
	out __SP_L__,r28
/* prologue: function */
/* frame size = 4 */
/* stack size = 6 */
.L__stack_usage = 6
	std Y+4,__zero_reg__
	std Y+3,__zero_reg__
	ldi r24,lo8(1)
	std Y+1,r24
	std Y+2,__zero_reg__
	movw r18,r28
	subi r18,-3
	sbci r19,-1
	movw r24,r28
	adiw r24,3
	adiw r24,1
	movw r30,r18
	ld r21,Z
	movw r30,r24
	ld r20,Z
	ldd r22,Y+1
	ldd r23,Y+2
/* #APP */
 ;  42 "main.c" 1
	     ldi r21, 0 
     ldi r20, 0 
     wait1: 
        sbis 22, 2 
        rjmp wait1 
    wait0: 
        add r21, r22 ; 1 
        adc r20, r23 ; 1 
        sbic 22, 2 ; 1 
        rjmp wait0 ; 2 
        ; total: 5 cycles. 5/9.6M = 0,52 us
     
 ;  0 "" 2
/* #NOAPP */
	movw r30,r18
	st Z,r21
	movw r30,r24
	st Z,r20
	ldd r24,Y+3
	ldd r25,Y+4
/* epilogue start */
	subi r28,lo8(-(4))
	out __SP_L__,r28
	pop r29
	pop r28
	ret
	.size	rc_read, .-rc_read
.global	main
	.type	main, @function
main:
	push r28
	push r29
	in r28,__SP_L__
	clr r29
	subi r28,lo8(-(-108))
	out __SP_L__,r28
/* prologue: function */
/* frame size = 108 */
/* stack size = 110 */
.L__stack_usage = 110
	rcall init
	ldi r24,0
	ldi r25,0
	ldi r26,lo8(122)
	ldi r27,lo8(68)
	std Y+7,r24
	std Y+8,r25
	std Y+9,r26
	std Y+10,r27
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(122)
	ldi r21,lo8(67)
	ldd r22,Y+7
	ldd r23,Y+8
	ldd r24,Y+9
	ldd r25,Y+10
	rcall __mulsf3
	adiw r28,61-60
	std Y+60,r22
	std Y+61,r23
	std Y+62,r24
	std Y+63,r25
	sbiw r28,61-60
	adiw r28,61-60
	ldd r24,Y+60
	ldd r25,Y+61
	ldd r26,Y+62
	ldd r27,Y+63
	sbiw r28,61-60
	std Y+11,r24
	std Y+12,r25
	std Y+13,r26
	std Y+14,r27
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-128)
	ldi r21,lo8(63)
	ldd r22,Y+11
	ldd r23,Y+12
	ldd r24,Y+13
	ldd r25,Y+14
	rcall __ltsf2
	tst r24
	brge .L69
	ldi r24,lo8(1)
	ldi r25,0
	std Y+16,r25
	std Y+15,r24
	rjmp .L26
.L69:
	ldi r18,0
	ldi r19,lo8(-1)
	ldi r20,lo8(127)
	ldi r21,lo8(71)
	ldd r22,Y+11
	ldd r23,Y+12
	ldd r24,Y+13
	ldd r25,Y+14
	rcall __gtsf2
	cp __zero_reg__,r24
	brlt .+2
	rjmp .L70
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(32)
	ldi r21,lo8(65)
	ldd r22,Y+7
	ldd r23,Y+8
	ldd r24,Y+9
	ldd r25,Y+10
	rcall __mulsf3
	adiw r28,65-60
	std Y+60,r22
	std Y+61,r23
	std Y+62,r24
	std Y+63,r25
	sbiw r28,65-60
	adiw r28,65-60
	ldd r24,Y+60
	ldd r25,Y+61
	ldd r26,Y+62
	ldd r27,Y+63
	sbiw r28,65-60
	std Y+49,r24
	std Y+50,r25
	std Y+51,r26
	std Y+52,r27
	ldd r22,Y+49
	ldd r23,Y+50
	ldd r24,Y+51
	ldd r25,Y+52
	rcall __fixunssfsi
	adiw r28,69-60
	std Y+60,r22
	std Y+61,r23
	std Y+62,r24
	std Y+63,r25
	sbiw r28,69-60
	adiw r28,69-62
	ldd r26,Y+62
	ldd r27,Y+63
	sbiw r28,69-62
	std Y+16,r27
	std Y+15,r26
	rjmp .L29
.L30:
	ldi r24,lo8(25)
	ldi r25,0
	std Y+18,r25
	std Y+17,r24
	ldd r24,Y+17
	ldd r25,Y+18
/* #APP */
 ;  105 "/usr/avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+18,r25
	std Y+17,r24
	nop
	ldd r24,Y+15
	ldd r25,Y+16
	sbiw r24,1
	std Y+16,r25
	std Y+15,r24
.L29:
	ldd r24,Y+15
	ldd r25,Y+16
	or r24,r25
	brne .L30
	rjmp .L31
.L70:
	ldd r22,Y+11
	ldd r23,Y+12
	ldd r24,Y+13
	ldd r25,Y+14
	rcall __fixunssfsi
	adiw r28,73-60
	std Y+60,r22
	std Y+61,r23
	std Y+62,r24
	std Y+63,r25
	sbiw r28,73-60
	adiw r28,73-62
	ldd r30,Y+62
	ldd r31,Y+63
	sbiw r28,73-62
	std Y+16,r31
	std Y+15,r30
.L26:
	ldd r24,Y+15
	ldd r25,Y+16
	std Y+20,r25
	std Y+19,r24
	ldd r24,Y+19
	ldd r25,Y+20
/* #APP */
 ;  105 "/usr/avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+20,r25
	std Y+19,r24
	nop
.L31:
	ldi r24,lo8(-36)
	ldi r25,lo8(5)
	sts mid+1,r25
	sts mid,r24
	std Y+2,__zero_reg__
	std Y+1,__zero_reg__
	rjmp .L32
.L47:
	rcall rc_read
	lsr r25
	ror r24
	lds r18,mid
	lds r19,mid+1
	sub r24,r18
	sbc r25,r19
	std Y+4,r25
	std Y+3,r24
	ldd r24,Y+3
	ldd r25,Y+4
	cpi r24,12
	sbci r25,-2
	brge .L33
	ldi r24,lo8(12)
	ldi r25,lo8(-2)
	std Y+4,r25
	std Y+3,r24
.L33:
	ldd r24,Y+3
	ldd r25,Y+4
	cpi r24,-11
	sbci r25,1
	brlt .L34
	ldi r24,lo8(-12)
	ldi r25,lo8(1)
	std Y+4,r25
	std Y+3,r24
.L34:
	ldd r24,Y+3
	ldd r25,Y+4
	tst r25
	brge .L35
	ldd r24,Y+3
	ldd r25,Y+4
	neg r25
	neg r24
	sbc r25,__zero_reg__
	tst r25
	brge .L36
	adiw r24,7
.L36:
	asr r25
	ror r24
	asr r25
	ror r24
	asr r25
	ror r24
	movw r18,r24
	ldi r24,lo8(86)
	ldi r25,0
	movw r26,r24
	st X,r18
	ldi r24,lo8(73)
	ldi r25,0
	movw r30,r24
	st Z,__zero_reg__
	rjmp .L37
.L35:
	ldd r24,Y+3
	ldd r25,Y+4
	tst r25
	brge .L38
	adiw r24,7
.L38:
	asr r25
	ror r24
	asr r25
	ror r24
	asr r25
	ror r24
	movw r18,r24
	ldi r24,lo8(73)
	ldi r25,0
	movw r26,r24
	st X,r18
	ldi r24,lo8(86)
	ldi r25,0
	movw r30,r24
	st Z,__zero_reg__
.L37:
	ldi r24,0
	ldi r25,0
	ldi r26,lo8(-128)
	ldi r27,lo8(63)
	std Y+21,r24
	std Y+22,r25
	std Y+23,r26
	std Y+24,r27
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(122)
	ldi r21,lo8(67)
	ldd r22,Y+21
	ldd r23,Y+22
	ldd r24,Y+23
	ldd r25,Y+24
	rcall __mulsf3
	adiw r28,77-60
	std Y+60,r22
	std Y+61,r23
	std Y+62,r24
	std Y+63,r25
	sbiw r28,77-60
	adiw r28,77-60
	ldd r24,Y+60
	ldd r25,Y+61
	ldd r26,Y+62
	ldd r27,Y+63
	sbiw r28,77-60
	std Y+25,r24
	std Y+26,r25
	std Y+27,r26
	std Y+28,r27
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-128)
	ldi r21,lo8(63)
	ldd r22,Y+25
	ldd r23,Y+26
	ldd r24,Y+27
	ldd r25,Y+28
	rcall __ltsf2
	tst r24
	brge .L71
	ldi r24,lo8(1)
	ldi r25,0
	std Y+30,r25
	std Y+29,r24
	rjmp .L41
.L71:
	ldi r18,0
	ldi r19,lo8(-1)
	ldi r20,lo8(127)
	ldi r21,lo8(71)
	ldd r22,Y+25
	ldd r23,Y+26
	ldd r24,Y+27
	ldd r25,Y+28
	rcall __gtsf2
	cp __zero_reg__,r24
	brlt .+2
	rjmp .L72
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(32)
	ldi r21,lo8(65)
	ldd r22,Y+21
	ldd r23,Y+22
	ldd r24,Y+23
	ldd r25,Y+24
	rcall __mulsf3
	adiw r28,81-60
	std Y+60,r22
	std Y+61,r23
	std Y+62,r24
	std Y+63,r25
	sbiw r28,81-60
	adiw r28,81-60
	ldd r24,Y+60
	ldd r25,Y+61
	ldd r26,Y+62
	ldd r27,Y+63
	sbiw r28,81-60
	std Y+53,r24
	std Y+54,r25
	std Y+55,r26
	std Y+56,r27
	ldd r22,Y+53
	ldd r23,Y+54
	ldd r24,Y+55
	ldd r25,Y+56
	rcall __fixunssfsi
	adiw r28,85-60
	std Y+60,r22
	std Y+61,r23
	std Y+62,r24
	std Y+63,r25
	sbiw r28,85-60
	adiw r28,85-62
	ldd r26,Y+62
	ldd r27,Y+63
	sbiw r28,85-62
	std Y+30,r27
	std Y+29,r26
	rjmp .L44
.L45:
	ldi r24,lo8(25)
	ldi r25,0
	std Y+32,r25
	std Y+31,r24
	ldd r24,Y+31
	ldd r25,Y+32
/* #APP */
 ;  105 "/usr/avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+32,r25
	std Y+31,r24
	nop
	ldd r24,Y+29
	ldd r25,Y+30
	sbiw r24,1
	std Y+30,r25
	std Y+29,r24
.L44:
	ldd r24,Y+29
	ldd r25,Y+30
	or r24,r25
	brne .L45
	rjmp .L46
.L72:
	ldd r22,Y+25
	ldd r23,Y+26
	ldd r24,Y+27
	ldd r25,Y+28
	rcall __fixunssfsi
	adiw r28,89-60
	std Y+60,r22
	std Y+61,r23
	std Y+62,r24
	std Y+63,r25
	sbiw r28,89-60
	adiw r28,89-62
	ldd r30,Y+62
	ldd r31,Y+63
	sbiw r28,89-62
	std Y+30,r31
	std Y+29,r30
.L41:
	ldd r24,Y+29
	ldd r25,Y+30
	std Y+34,r25
	std Y+33,r24
	ldd r24,Y+33
	ldd r25,Y+34
/* #APP */
 ;  105 "/usr/avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+34,r25
	std Y+33,r24
	nop
.L46:
	ldd r24,Y+1
	ldd r25,Y+2
	adiw r24,1
	std Y+2,r25
	std Y+1,r24
.L32:
	ldd r24,Y+1
	ldd r25,Y+2
	cpi r24,100
	cpc r25,__zero_reg__
	brge .+2
	rjmp .L47
	rcall rc_read
	lsr r25
	ror r24
	sts mid+1,r25
	sts mid,r24
.L62:
	rcall rc_read
	lsr r25
	ror r24
	lds r18,mid
	lds r19,mid+1
	sub r24,r18
	sbc r25,r19
	std Y+6,r25
	std Y+5,r24
	ldd r24,Y+5
	ldd r25,Y+6
	cpi r24,12
	sbci r25,-2
	brge .L48
	ldi r24,lo8(12)
	ldi r25,lo8(-2)
	std Y+6,r25
	std Y+5,r24
.L48:
	ldd r24,Y+5
	ldd r25,Y+6
	cpi r24,-11
	sbci r25,1
	brlt .L49
	ldi r24,lo8(-12)
	ldi r25,lo8(1)
	std Y+6,r25
	std Y+5,r24
.L49:
	ldd r24,Y+5
	ldd r25,Y+6
	tst r25
	brge .L50
	ldd r24,Y+5
	ldd r25,Y+6
	neg r25
	neg r24
	sbc r25,__zero_reg__
	tst r25
	brge .L51
	adiw r24,7
.L51:
	asr r25
	ror r24
	asr r25
	ror r24
	asr r25
	ror r24
	movw r18,r24
	ldi r24,lo8(86)
	ldi r25,0
	movw r26,r24
	st X,r18
	ldi r24,lo8(73)
	ldi r25,0
	movw r30,r24
	st Z,__zero_reg__
	rjmp .L52
.L50:
	ldd r24,Y+5
	ldd r25,Y+6
	tst r25
	brge .L53
	adiw r24,7
.L53:
	asr r25
	ror r24
	asr r25
	ror r24
	asr r25
	ror r24
	movw r18,r24
	ldi r24,lo8(73)
	ldi r25,0
	movw r26,r24
	st X,r18
	ldi r24,lo8(86)
	ldi r25,0
	movw r30,r24
	st Z,__zero_reg__
.L52:
	ldi r24,0
	ldi r25,0
	ldi r26,lo8(-128)
	ldi r27,lo8(63)
	std Y+35,r24
	std Y+36,r25
	std Y+37,r26
	std Y+38,r27
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(122)
	ldi r21,lo8(67)
	ldd r22,Y+35
	ldd r23,Y+36
	ldd r24,Y+37
	ldd r25,Y+38
	rcall __mulsf3
	adiw r28,93-60
	std Y+60,r22
	std Y+61,r23
	std Y+62,r24
	std Y+63,r25
	sbiw r28,93-60
	adiw r28,93-60
	ldd r24,Y+60
	ldd r25,Y+61
	ldd r26,Y+62
	ldd r27,Y+63
	sbiw r28,93-60
	std Y+39,r24
	std Y+40,r25
	std Y+41,r26
	std Y+42,r27
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(-128)
	ldi r21,lo8(63)
	ldd r22,Y+39
	ldd r23,Y+40
	ldd r24,Y+41
	ldd r25,Y+42
	rcall __ltsf2
	tst r24
	brge .L73
	ldi r24,lo8(1)
	ldi r25,0
	std Y+44,r25
	std Y+43,r24
	rjmp .L56
.L73:
	ldi r18,0
	ldi r19,lo8(-1)
	ldi r20,lo8(127)
	ldi r21,lo8(71)
	ldd r22,Y+39
	ldd r23,Y+40
	ldd r24,Y+41
	ldd r25,Y+42
	rcall __gtsf2
	cp __zero_reg__,r24
	brlt .+2
	rjmp .L74
	ldi r18,0
	ldi r19,0
	ldi r20,lo8(32)
	ldi r21,lo8(65)
	ldd r22,Y+35
	ldd r23,Y+36
	ldd r24,Y+37
	ldd r25,Y+38
	rcall __mulsf3
	adiw r28,97-60
	std Y+60,r22
	std Y+61,r23
	std Y+62,r24
	std Y+63,r25
	sbiw r28,97-60
	adiw r28,97-60
	ldd r24,Y+60
	ldd r25,Y+61
	ldd r26,Y+62
	ldd r27,Y+63
	sbiw r28,97-60
	std Y+57,r24
	std Y+58,r25
	std Y+59,r26
	std Y+60,r27
	ldd r22,Y+57
	ldd r23,Y+58
	ldd r24,Y+59
	ldd r25,Y+60
	rcall __fixunssfsi
	adiw r28,101-60
	std Y+60,r22
	std Y+61,r23
	std Y+62,r24
	std Y+63,r25
	sbiw r28,101-60
	adiw r28,101-62
	ldd r26,Y+62
	ldd r27,Y+63
	sbiw r28,101-62
	std Y+44,r27
	std Y+43,r26
	rjmp .L59
.L60:
	ldi r24,lo8(25)
	ldi r25,0
	std Y+46,r25
	std Y+45,r24
	ldd r24,Y+45
	ldd r25,Y+46
/* #APP */
 ;  105 "/usr/avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+46,r25
	std Y+45,r24
	nop
	ldd r24,Y+43
	ldd r25,Y+44
	sbiw r24,1
	std Y+44,r25
	std Y+43,r24
.L59:
	ldd r24,Y+43
	ldd r25,Y+44
	or r24,r25
	brne .L60
	rjmp .L61
.L74:
	ldd r22,Y+39
	ldd r23,Y+40
	ldd r24,Y+41
	ldd r25,Y+42
	rcall __fixunssfsi
	adiw r28,105-60
	std Y+60,r22
	std Y+61,r23
	std Y+62,r24
	std Y+63,r25
	sbiw r28,105-60
	adiw r28,105-62
	ldd r30,Y+62
	ldd r31,Y+63
	sbiw r28,105-62
	std Y+44,r31
	std Y+43,r30
.L56:
	ldd r24,Y+43
	ldd r25,Y+44
	std Y+48,r25
	std Y+47,r24
	ldd r24,Y+47
	ldd r25,Y+48
/* #APP */
 ;  105 "/usr/avr/include/util/delay_basic.h" 1
	1: sbiw r24,1
	brne 1b
 ;  0 "" 2
/* #NOAPP */
	std Y+48,r25
	std Y+47,r24
	nop
.L61:
	rjmp .L62
	.size	main, .-main
	.ident	"GCC: (Fedora 9.2.0-1.fc31) 9.2.0"
.global __do_clear_bss
