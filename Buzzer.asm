.cseg
prBuzzerInit:
		initPr 2,0,varBuzzerStTime0,varBuzzerStTime1

prBuzzerLoad:
		loadPr varBuzzerSystem,prBuzzerInit

prBuzzerInc:
		incPr varBuzzerSystem,prBuzzerIncEt,varBuzzerCurTime0,varBuzzerCurTime1

prBuzzerTimeCheck:
		timeCheckPr varBuzzerSystem,prBuzzerTimeCheckEt,varBuzzerStTime0,varBuzzerStTime1,varBuzzerCurTime0,varBuzzerCurTime1

prBuzzerUnload:
		clr temp
		sts varBuzzerDurationCurTime2, temp
		sts varBuzzerDurationCurTime1, temp
		sts varBuzzerDurationCurTime0, temp
		cbi PORTC, 1
		unloadPr varBuzzerSystem,varBuzzerCurTime0,varBuzzerCurTime1


prBuzzerFunc:
		FuncPr varBuzzerSystem,prBuzzerFuncEt
		LDI temp,0
		STS varBuzzerCurTime0,temp
		STS varBuzzerCurTime1,temp
		LDS prTemp0, varBuzzerSystem
		andi prTemp0, 0b11111101
		STS varBuzzerSystem, prTemp0	
			
		in temp, PORTC
		andi temp, 0b00000010
		cpi temp, 0b00000010
		breq prBuzzerFuncLowLevel		
		sbi PORTC, 1
		rjmp IncBuzzerDuration
prBuzzerFuncLowLevel:
		cbi PORTC, 1

IncBuzzerDuration:		
		ldi prTemp0, 1
		clr prTemp1

		lds temp, varBuzzerDurationCurTime0
		add temp, prTemp0
		sts varBuzzerDurationCurTime0, temp

		lds temp, varBuzzerDurationCurTime1
		adc temp, prTemp1
		sts varBuzzerDurationCurTime1, temp	

CheckBuzzerDuration:
		lds temp, varBuzzerDurationCurTime0
		lds prTemp0, varBuzzerDurationEndTime0
		cp temp, prTemp0
		brne prBuzzerFuncEt

		lds temp, varBuzzerDurationCurTime1
		lds prTemp0, varBuzzerDurationEndTime1
		cp temp, prTemp0
		brne prBuzzerFuncEt		

StopBuzzer:		
		rcall prBuzzerUnload		
prBuzzerFuncEt:		
		reti
