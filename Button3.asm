.cseg
prButton3Init:
		initPr 6,1,varButton3StTime0,varButton3StTime1
	
prButton3IsLoad:
		isLoadPr varButton3System,prButton3InitEt

prButton3Load:
		loadPr varButton3System,prButton3Init

prButton3Inc:
		incPr varButton3System,prButton3IncEt,varButton3CurTime0,varButton3CurTime1


prButton3TimeCheck:
		timeCheckPr varButton3System,prButton3TimeCheckEt,varButton3StTime0,varButton3StTime1,varButton3CurTime0,varButton3CurTime1

prButton3Func:
		FuncPr varButton3System,prButton3Exit0
		rjmp prButton3FuncBeggin
prButton3Exit0:
		rjmp prButton3Exit
prButton3FuncBeggin:
		CLR temp
		STS varButton3CurTime0,temp
		STS varButton3CurTime1,temp
		ldi prTemp0, 0x01
		STS varButton3System, prTemp0

		lds prTemp0, varButton3Status
		andi prTemp0, 0b10000000
		cpi prTemp0, 0
		breq prButton3Press
		rjmp prButton3UnPress

prButton3Press:
		SBIC PINB,1
		rjmp prButton3Exit
		lds prTemp0, varButton3Status
		ori prTemp0, 0b10000000
		sts varButton3Status, prTemp0
		rjmp prButton3Exit

prButton3UnPress:	
		SBIS PINB,5
		rjmp button3Start	
		SBIS PINB,1
		rjmp prButton3Exit
		;rcall Pause		
button3Start:
		clr prTemp0
		sts varButton3Status, prTemp0
		lds temp, positionMenu

		cpi temp, 1
		breq p3_1
		cpi temp, 3
		breq p3_3
		cpi temp, 41
		breq p3_41			
		cpi temp, 50
		breq p3_50
		cpi temp, 51
		breq p3_51
		cpi temp, 52
		breq p3_52
		cpi temp, 53
		breq p3_53
		cpi temp, 54
		breq p3_54
		cpi temp, 130
		breq p3_130
		cpi temp, 131
		breq p3_131

		rjmp p3_01

p3_1:
		rjmp pr3_1
p3_3:
		rjmp pr3_3
p3_41:
		rjmp pr3_41
p3_50:
		rjmp pr3_50
p3_51:
		rjmp pr3_51
p3_52:
		rjmp pr3_52
p3_53:
		rjmp pr3_53
p3_54:
		rjmp pr3_54
p3_130:
		rjmp pr3_130
p3_131:
		rjmp pr3_131

pr3_1:
		ldi temp, 130
		sts positionMenu, temp		
		ldi temp, 0b00110000
		sts varBlinkDisplaySegments, temp
		rcall prBlinkDisplayLoad
		rjmp p3_01

pr3_3:		
		lds temp, varPowerOff
		rcall onOffPower
		mov R20, temp
		rcall showOnOff
		sts varPowerOff, temp
		rjmp p3_01

pr3_130:
		ldi temp, 131
		sts positionMenu, temp		
		ldi temp, 0b00001100
		sts varBlinkDisplaySegments, temp
		rcall prBlinkDisplayLoad
		rjmp p3_01

pr3_131:
		ldi temp, 1
		sts positionMenu, temp		
		ldi temp, 0b00000000
		sts varBlinkDisplaySegments, temp
		rcall prBlinkDisplayUnLoad
		clr temp
		sts varRealTimeClockSec, temp
		rjmp p3_01

pr3_41:
		lds R20, varPwmDeep
		dec R20
		sts varPwmDeep, R20
		rcall showPwnDeep
		rcall powerStatusUpdate
		rjmp p3_01

pr3_50:
		lds R20, varSmallPwmStTime0
		dec R20
		sts varSmallPwmStTime0, R20
		rcall showProcessStTime
		rcall updateSmallPwmStatus
		rjmp p3_01

pr3_51:
		lds R20, varSmallPwmStTime1
		dec R20
		sts varSmallPwmStTime1, R20
		rcall showProcessStTime
		rcall updateSmallPwmStatus
		rjmp p3_01

pr3_52:
		lds R20, varSmallPwmStTime2
		dec R20
		sts varSmallPwmStTime2, R20
		rcall updateSmallPwmStatus
		rcall showProcessStTime		
		rjmp p3_01

pr3_53:
		lds R20, varSmallPwmOn
		dec R20
		sts varSmallPwmOn, R20
		rcall updateSmallPwmStatus
		rcall showProcessStTimeOn		
		rjmp p3_01

pr3_54:
		lds R20, varSmallPwmOff
		dec R20
		sts varSmallPwmOff, R20
		rcall updateSmallPwmStatus
		rcall showProcessStTimeOff		
		rjmp p3_01

p3_01:
		reti

prButton3Exit:
		RETI
