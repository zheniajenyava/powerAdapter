prBlinkDisplayInit:
		initPr 200,10,varBlinkDisplayStTime0,varBlinkDisplayStTime1

prBlinkDisplayIsLoad:	
		isLoadPr varBlinkDisplaySystem,prBlinkDisplayInitEt

prBlinkDisplayLoad:
		loadPr varBlinkDisplaySystem,prBlinkDisplayInit

prBlinkDisplayInc:
		incPr varBlinkDisplaySystem,prBlinkDisplayIncEt,varBlinkDisplayCurTime0,varBlinkDisplayCurTime1

prBlinkDisplayTimeCheck:
		timeCheckPr varBlinkDisplaySystem,prBlinkDisplayTimeCheckEt,varBlinkDisplayStTime0,varBlinkDisplayStTime1,varBlinkDisplayCurTime0,varBlinkDisplayCurTime1

prBlinkDisplayUnload:
		clr temp
		sts varBlinkDisplayFlags, temp
		sts varBlinkDisplaySegments, temp
		unloadPr varBlinkDisplaySystem,varBlinkDisplayCurTime0,varBlinkDisplayCurTime1


prBlinkDisplayFunc:
		FuncPr varBlinkDisplaySystem,prBlinkDisplayFuncEt
		LDI temp,0
		STS varBlinkDisplayCurTime0,temp
		STS varBlinkDisplayCurTime1,temp
		LDS prTemp0, varBlinkDisplaySystem
		andi prTemp0, 0b11111101
		STS varBlinkDisplaySystem, prTemp0		

		lds temp, varBlinkDisplayFlags
		lds prTemp0, varBlinkDisplaySegments
		eor temp, prTemp0
		sts varBlinkDisplayFlags, temp
prBlinkDisplayFuncEt:		
		reti


