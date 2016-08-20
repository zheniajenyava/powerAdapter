.cseg
prClockInit:
		initPr 5,2,varClockStTime0,varClockStTime1

prClockIsLoad:	
		isLoadPr varClockSystem,prClockInitEt

prClockLoad:
		loadPr varClockSystem,prClockInit

prClockInc:
		incPr varClockSystem,prClockIncEt,varClockCurTime0,varClockCurTime1

prClockTimeCheck:
		timeCheckPr varClockSystem,prClockTimeCheckEt,varClockStTime0,varClockStTime1,varClockCurTime0,varClockCurTime1

prClockUnload:		
		unloadPr varClockSystem,varClockCurTime0,varClockCurTime1


prClockFunc:
		FuncPr varClockSystem,prClockFuncEt
		LDI temp,0
		STS varClockCurTime0,temp
		STS varClockCurTime1,temp
		LDS prTemp0, varClockSystem
		andi prTemp0, 0b11111101
		STS varClockSystem, prTemp0

		rcall updateClock		
		
prClockFuncEt:		
		reti
