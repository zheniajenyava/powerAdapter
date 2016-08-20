.cseg
prSmallPwmInit:
setPrCurTime3 0,0,0 , varSmallPwmCurTime0,varSmallPwmCurTime1, varSmallPwmCurTime2
;initPr3 prTemp0,prTemp1,prTemp2, varSmallPwmStTime0,varSmallPwmStTime1,varSmallPwmStTime2

prSmallPwmLoad:
loadPr varSmallPwmSystem,prSmallPwmInit

prSmallPwmInc:
incPr3 varSmallPwmSystem,prSmallPwmIncEt,varSmallPwmCurTime0,varSmallPwmCurTime1,varSmallPwmCurTime2

prSmallPwmTimeCheck:
timeCheckPr3 varSmallPwmSystem,prSmallPwmTimeCheckEt,varSmallPwmStTime0,varSmallPwmStTime1,varSmallPwmStTime2,varSmallPwmCurTime0,varSmallPwmCurTime1,varSmallPwmCurTime2

prSmallPwmUnload:
unloadPr3 varSmallPwmSystem,varSmallPwmCurTime0,varSmallPwmCurTime1,varSmallPwmCurTime2

prSmallPwmFunc:

FuncPr varSmallPwmSystem,prSmallPwmFuncEt
		LDI temp,0
		STS varSmallPwmCurTime0,temp
		STS varSmallPwmCurTime1,temp
		STS varSmallPwmCurTime2,temp
		ldi prTemp0, 0x01
		STS varSmallPwmSystem, prTemp0


		lds prTemp0, varSmallPwmState
		andi prTemp0, 0b10000000
		cpi prTemp0, 0b10000000
		breq prSmallPwmTryOff
		lds prTemp0, varSmallPwmOn
		ldi prTemp3, 0b00001000		
		ldi prTemp4, 0b00100000
		rjmp prSmallPwmDoOffOn
prSmallPwmTryOff:
		lds prTemp0, varSmallPwmOff
		ldi prTemp3, 0b00000000		
		ldi prTemp4, 0b00000000
prSmallPwmDoOffOn:
		lds prTemp1, varSmallPwmCurOnOff
		cp prTemp1, prTemp0
		brne prSmallPwmFuncIncCurOnOff
		rcall revertPower
		clr temp
		sts varSmallPwmCurOnOff, temp
		lds temp, varSmallPwmState
		ldi prTemp0, 0b10000000
		eor temp, prTemp0
		sts varSmallPwmState, temp
		rjmp prSmallPwmFuncEt

prSmallPwmFuncIncCurOnOff:
		lds prTemp1, varSmallPwmCurOnOff
		inc prTemp1
		sts varSmallPwmCurOnOff, prTemp1
prSmallPwmFuncEt:
		reti
