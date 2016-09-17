.cseg
prCurrentSumInit:
		initPr 40,3,varCurrentSumStTime0,varCurrentSumStTime1

prCurrentSumLoad:
		loadPr varCurrentSumSystem,prCurrentSumInit

prCurrentSumInc:
		incPr varCurrentSumSystem,prCurrentSumIncEt,varCurrentSumCurTime0,varCurrentSumCurTime1

prCurrentSumTimeCheck:
		timeCheckPr varCurrentSumSystem,prCurrentSumTimeCheckEt,varCurrentSumStTime0,varCurrentSumStTime1,varCurrentSumCurTime0,varCurrentSumCurTime1

prCurrentSumUnload:		
		unloadPr varCurrentSumSystem,varCurrentSumCurTime0,varCurrentSumCurTime1

prCurrentSumFunc:		
		FuncPr varCurrentSumSystem,prCurrentSumFuncEt
		LDI temp,0
		STS varCurrentSumCurTime0,temp
		STS varCurrentSumCurTime1,temp
		LDS prTemp0, varCurrentSumSystem
		andi prTemp0, 0b11111101
		STS varCurrentSumSystem, prTemp0

		;in R20, ADCH
		;lds R21, 0
		lds R20, varCurrentPower0
		lds R21, varCurrentPower1
		rcall toDigit

		lds prTemp0, DIGIT1
		rcall prProcessDataDigital
		ori prTemp1, 0b00000100
		sts varProcessDataDigit1D, prTemp0
		sts varProcessDataDigit1B, prTemp1

		lds prTemp0, DIGIT2
		rcall prProcessDataDigital		
		sts varProcessDataDigit2D, prTemp0
		sts varProcessDataDigit2B, prTemp1

		lds prTemp0, DIGIT3
		rcall prProcessDataDigital
		sts varProcessDataDigit3D, prTemp0
		sts varProcessDataDigit3B, prTemp1

		lds prTemp0, DIGIT4
		rcall prProcessDataDigital
		sts varProcessDataDigit4D, prTemp0
		sts varProcessDataDigit4B, prTemp1		
		
prCurrentSumFuncEt:
		ret
