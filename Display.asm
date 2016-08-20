.cseg
prDisplayInit:
initPr 1,0,varDisplayStTime0,varDisplayStTime1
prDisplayIsLoad:
		ldi temp, 1
		sts varSegmentDisplay, temp
		isLoadPr varDisplaySystem,prDisplayInitEt

prDisplayLoad:
		loadPr varDisplaySystem,prDisplayInit

prDisplayInc:
		incPr varDisplaySystem,prDisplayIncEt,varDisplayCurTime0,varDisplayCurTime1

prDisplayTimeCheck:
		timeCheckPr varDisplaySystem,prDisplayTimeCheckEt,varDisplayStTime0,varDisplayStTime1,varDisplayCurTime0,varDisplayCurTime1

prDisplayUnload:
		reti

prDisplayFunc:
		FuncPr varDisplaySystem,prDisplayFuncEt
		rjmp prDisplayFuncNext0
prDisplayFuncEt:
		rjmp prDisplayFuncNext1
prDisplayFuncNext0:
		LDI temp,0
		STS varDisplayCurTime0,temp
		STS varDisplayCurTime1,temp
		LDS prTemp0, varDisplaySystem
		andi prTemp0, 0b11111101
		STS varDisplaySystem, prTemp0
		in prTemp3, PORTC
		andi prTemp3, 0b11000011
		out PORTC, prTemp3
		lds prTemp0, varSegmentDisplay
		cpi prTemp0, 1
		breq s1
		cpi prTemp0, 2
		breq s2
		cpi prTemp0, 3
		breq s3
		cpi prTemp0, 4
		breq s4
s1:

		ori prTemp3, 0b00010000
		lds prTemp0, varProcessDataDigit2D
		lds prTemp1, varProcessDataDigit2B
		rjmp outPortB
s2:
		ori prTemp3, 0b00001000
		lds prTemp0, varProcessDataDigit3D
		lds prTemp1, varProcessDataDigit3B
		rjmp outPortB
s3:
		ori prTemp3, 0b00000100
		lds prTemp0, varProcessDataDigit4D
		lds prTemp1, varProcessDataDigit4B
		rjmp outPortB
s4:
		ori prTemp3, 0b00100000
		lds prTemp0, varProcessDataDigit1D
		lds prTemp1, varProcessDataDigit1B
		clr prTemp4
		sts varSegmentDisplay, prTemp4
outPortB:
		lds prTemp4,varSegmentDisplay
		inc prTemp4
		sts varSegmentDisplay, prTemp4

		in prTemp4, PORTB
		andi prTemp4, 0b11111010
		or prTemp4, prTemp1
		lds temp, varBlinkDisplayFlags		
		and temp, prTemp3
		eor prTemp3, temp
		out PORTD, prTemp0
		out PORTB, prTemp4
		out PORTC, prTemp3

prDisplayFuncNext1:
		sei
		reti
