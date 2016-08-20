.cseg
prBuzzerInit:
		initPr 2,2,varBuzzerStTime0,varBuzzerStTime1

prBuzzerLoad:
		loadPr varBuzzerSystem,prBuzzerInit

prBuzzerInc:
		incPr varBuzzerSystem,prBuzzerIncEt,varBuzzerCurTime0,varBuzzerCurTime1

prBuzzerTimeCheck:
		timeCheckPr varBuzzerSystem,prBuzzerTimeCheckEt,varBuzzerStTime0,varBuzzerStTime1,varBuzzerCurTime0,varBuzzerCurTime1

prBuzzerUnload:		
		unloadPr varBuzzerSystem,varBuzzerCurTime0,varBuzzerCurTime1


prBuzzerFunc:
		FuncPr varBuzzerSystem,prBuzzerFuncRet
		LDI temp,0
		STS varBuzzerCurTime0,temp
		STS varBuzzerCurTime1,temp
		in temp, PORTC
		andi temp, 0b00000010
		cpi temp, 0b00000010
		breq prBuzzerFuncLowLevel		
		sbi PORTC, 1
		rjmp prBuzzerFuncRet
prBuzzerFuncLowLevel:
		cbi PORTC, 1
prBuzzerFuncRet:
		ret
