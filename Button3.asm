.cseg
prButton3Init:
		initPr 6,1,varButton3StTime0,varButton3StTime1

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
		rcall resetBlinkDisplay
		clr prTemp0
		sts varButton3Status, prTemp0
		lds temp, positionMenu

		cpi temp, 1
		breq p3_1
		cpi temp, 3
		breq p3_3
		cpi temp, 4
		breq p3_4
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
		cpi temp, 90
		breq p3_90
		cpi temp, 91
		breq p3_91		
		cpi temp, 100
		breq p3_100
		cpi temp, 101
		breq p3_101
		cpi temp, 110
		breq p3_110
		cpi temp, 111
		breq p3_111
		cpi temp, 120
		breq p3_120
		cpi temp, 121
		breq p3_121
		cpi temp, 130
		breq p3_130
		cpi temp, 131
		breq p3_131
		cpi temp, 255
		breq p3_255

		rcall returnMainMenu
		rjmp p3_01

p3_1:
		rjmp pr3_1
p3_3:
		rjmp pr3_3
p3_4:
		rjmp pr3_4
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
p3_90:
		rjmp pr3_90
p3_91:
		rjmp pr3_91
p3_100:
		rjmp pr3_100
p3_101:
		rjmp pr3_101
p3_110:
		rjmp pr3_110
p3_111:
		rjmp pr3_111
p3_120:
		rjmp pr3_120
p3_121:
		rjmp pr3_121
p3_130:
		rjmp pr3_130
p3_131:
		rjmp pr3_131
p3_255:
		rjmp pr3_255

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

pr3_4:
		clr temp
		sts varCurrentPower0, temp
		sts varCurrentPower1, temp
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
		rcall showValueRegister
		rcall updateSmallPwmStatus
		rjmp p3_01

pr3_51:
		lds R20, varSmallPwmStTime1
		dec R20
		sts varSmallPwmStTime1, R20
		rcall showValueRegister
		rcall updateSmallPwmStatus
		rjmp p3_01

pr3_52:
		lds R20, varSmallPwmStTime2
		dec R20
		sts varSmallPwmStTime2, R20
		rcall updateSmallPwmStatus
		rcall showValueRegister		
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

pr3_90:
		lds prTemp2, varClockEnableHour1
		rcall decClockDisableHour
		sts varClockEnableHour1, prTemp2
		rjmp p3_01

pr3_91:
		lds prTemp2, varClockEnableMin1
		rcall decClockDisableMin
		sts varClockEnableMin1, prTemp2		
		rjmp p3_01

pr3_100:
		lds prTemp2, varClockDisableHour1
		rcall decClockDisableHour
		sts varClockDisableHour1, prTemp2
		rjmp p3_01

pr3_101:
		lds prTemp2, varClockDisableMin1
		rcall decClockDisableMin
		sts varClockDisableMin1, prTemp2		
		rjmp p3_01

pr3_110:
		lds prTemp2, varClockEnableHour2
		rcall decClockDisableHour
		sts varClockEnableHour2, prTemp2
		rjmp p3_01

pr3_111:
		lds prTemp2, varClockEnableMin2
		rcall decClockDisableMin
		sts varClockEnableMin2, prTemp2		
		rjmp p3_01


pr3_120:
		lds prTemp2, varClockDisableHour2
		rcall decClockDisableHour
		sts varClockDisableHour2, prTemp2
		rjmp p3_01

pr3_121:
		lds prTemp2, varClockDisableMin2
		rcall decClockDisableMin
		sts varClockDisableMin2, prTemp2		
		rjmp p3_01

pr3_255:
		sei
		; comporator		
		ldi temp, 0b00011000
		out ACSR, temp
		rcall Pause
		cli
		rcall prBuzzerUnload
		rcall powerOn
		ldi temp, 1
		sts positionMenu, temp
		rcall prRealClockLoad
		rjmp p3_01		

p3_01:
		reti

prButton3Exit:
		RETI
