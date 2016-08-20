.include "Macros.asm"
.include "m8def.inc"
.def temp = R16
.def prTemp0 = R17
.def prTemp1 = R18
.def prTemp2 = R19
.def prTemp3 = R20
.def prTemp4 = R21
.def servprTemp0 = R22
.def servprTemp1 = R23
.def servprTemp2 = R24
.def servprTemp3 = R25
.def servprTemp4 = R26
.def servprTemp5 = R27
.def servprTemp6 = R28
.def servprTemp7 = R29
.cseg
.org 0
		rjmp Reset
		rjmp INT_0
		rjmp INT_1
		rjmp Timer1_capt1
		rjmp ANA_COMP
		rjmp Timer1_OVF1
		rjmp TIMER1_OC1A
		rjmp UART_RX
		rjmp TIMER1_OVER
		rjmp TIMER0_OVER
		rjmp ANA_COMP
INT_0:
INT_1:
Timer1_capt1:
Timer1_comp1:
TIMER1_OVER:
Timer0_OVF0:
Timer1_OVF1:
UART_RX:
		reti
ANA_COMP:
		cbi PORTB, 3
		clr temp
		out TCCR2, temp
		cbi PORTB, 3
		out TCNT2, temp
		rcall prSmallPwmUnload
		cbi PORTB, 3
		sts varPowerOff, temp

		reti
TIMER1_OC1A:
		rcall EnRun10Hz	
		reti
TIMER0_OVER:
		rcall EnRun
		reti
RESET:

RAM_Flush:	
		LDI	ZL,Low(SRAM_START)
		LDI	ZH,High(SRAM_START)
		CLR	R16
Flush:		
		ST 	Z+,R16
		CPI	ZH,High(RAMEND+1)
		BRNE	Flush 
		CPI	ZL,Low(RAMEND+1)
		BRNE	Flush 
		CLR	ZL
		CLR	ZH
		LDI	ZL, 30
		CLR	ZH
		DEC	ZL
		ST	Z, ZH
		BRNE	PC-2

		ldi temp,1
		sts positionMenu, temp


		LDI R16,Low(RAMEND)
		OUT SPL,R16
		LDI R16,High(RAMEND)
		OUT SPH,R16
		clr temp
		out TCNT1H, temp
		out TCNT1L, temp
		ldi temp, high(18750)
		out OCR1AH, temp
		ldi temp, low(18750)
		out OCR1AL, temp
		ldi temp,0b00001011 ; /64		
		out TCCR1B, temp

		ldi R16,0
		out TCNT0,R16
		ldi R16, 0b00000010
		out TCCR0, R16
		ldi R16,0b00010001
		out TIMSK, R16

		ldi temp,0b00001101
		out DDRB,temp
		ldi temp,0b00111010
		out PORTB,  temp

		ldi temp, 0b00111111
		out DDRD,temp
		ldi temp, 0b00111111
		out PORTD,temp

		ldi temp, 0b11111111
		out DDRC, temp
		ldi temp, 0b11111101
		out PORTC,  temp		

		; comporator
		ldi temp, 0b00001010	; 1 -> 0
		out ACSR, temp

		ldi temp, 0b00000000
		out ADMUX, temp
		ldi temp, 0b10100111
		out ADCSR, temp
		
		rcall prButton3Load
		rcall prButton2Load
		rcall prButton1Load
		rcall prDisplayLoad
		rcall prRealClockLoad
		rcall prBuzzerLoad
		sei
		ldi temp, 1
		sts varPowerOff, temp
		rcall Run

.include "SramVar.asm"
.include "Button1.asm"
.include "Button2.asm"
.include "Button3.asm"
.include "Display.asm"
.include "Function.asm"
.include "SmallPwm.asm"
.include "BlinkDisplay.asm"
.include "Clock.asm"
.include "RealClock.asm"
.include "Controller.asm"
.include "Buzzer.asm"

