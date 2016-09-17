.cseg
prRealClockInit:
		initPr 7,2,varRealClockStTime0,varRealClockStTime1

prRealClockLoad:
		loadPr varRealClockSystem,prRealClockInit

prRealClockInc:
		incPr varRealClockSystem,prRealClockIncEt,varRealClockCurTime0,varRealClockCurTime1

prRealClockTimeCheck:
		timeCheckPr varRealClockSystem,prRealClockTimeCheckEt,varRealClockStTime0,varRealClockStTime1,varRealClockCurTime0,varRealClockCurTime1

prRealClockUnload:		
		unloadPr varRealClockSystem,varRealClockCurTime0,varRealClockCurTime1


prRealClockFunc:
		FuncPr varRealClockSystem,prRealClockFuncEt
		LDI temp,0
		STS varRealClockCurTime0,temp
		STS varRealClockCurTime1,temp
		LDS prTemp0, varRealClockSystem
		andi prTemp0, 0b11111101
		STS varRealClockSystem, prTemp0

		rcall updateRealClock
			
		
prRealClockFuncEt:
		reti
