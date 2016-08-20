.cseg
prButton1Init:
		initPr 6,1,varButton1StTime0,varButton1StTime1
	
prButton1IsLoad:
		isLoadPr varButton1System,prButton1InitEt

prButton1Load:
		loadPr varButton1System,prButton1Init

prButton1Inc:
		incPr varButton1System,prButton1IncEt,varButton1CurTime0,varButton1CurTime1


prButton1TimeCheck:
		timeCheckPr varButton1System,prButton1TimeCheckEt,varButton1StTime0,varButton1StTime1,varButton1CurTime0,varButton1CurTime1

prButton1Func:
		FuncPr varButton1System,prButton1Exit0
		rjmp prButton1FuncBeggin
prButton1Exit0:
		rjmp prButton1Exit
prButton1FuncBeggin:
		CLR temp
		STS varButton1CurTime0,temp
		STS varButton1CurTime1,temp
		ldi prTemp0, 0x01
		STS varButton1System, prTemp0

		lds prTemp0, varButton1Status
		andi prTemp0, 0b10000000
		cpi prTemp0, 0
		breq prButton1Press
		rjmp prButton1UnPress

; todo Реализовать через относительные переходы
prButton1Press:
		SBIC PINB,4
		rjmp prButton1Exit
		lds prTemp0, varButton1Status
		ori prTemp0, 0b10000000
		sts varButton1Status, prTemp0
		rjmp prButton1Exit

prButton1UnPress:	
		SBIS PINB,5
		rjmp button1Start	
		SBIS PINB,4
		rjmp prButton1Exit
		;rcall Pause		
button1Start:
		clr prTemp0
		sts varButton1Status, prTemp0
		lds temp, positionMenu
		cpi temp, 0
		breq p0
		cpi temp, 1
		breq p1
		cpi temp, 2
		breq p2
		cpi temp, 3
		breq p3
		cpi temp, 4
		breq p4
		rjmp p02
p0:
		ldi temp,1
		sts positionMenu, temp
		rcall prClockUnLoad
		rcall prRealClockLoad
		rjmp p01
p1:
		ldi temp,2
		sts positionMenu, temp
		rcall prRealClockUnLoad
		rcall prClockLoad
		rjmp p01
p2:		
		ldi temp,3
		sts positionMenu, temp
		rcall prClockUnLoad
		lds R20, varPowerOff
		rcall showOnOff				
		rjmp p01
p3:
		rjmp p0
		ldi temp,4
		sts positionMenu, temp
		rjmp p01
p4:
		ldi temp,0
		sts positionMenu, temp
		rjmp p01
p02:
		cpi temp, 21
		breq p21
		cpi temp, 22
		breq p22
		cpi temp, 23
		breq p23
		cpi temp, 24
		breq p24
		cpi temp, 25		
		breq p25
		cpi temp, 26
		breq p26
		cpi temp, 27
		breq p27
		cpi temp, 28
		breq p28
		cpi temp, 29
		breq p29
		cpi temp, 41
		breq p41
		cpi temp, 42
		breq p42
		cpi temp, 43
		breq p43
		cpi temp, 50
		breq p50
		cpi temp, 51
		breq p51
		cpi temp, 52
		breq p52
		cpi temp, 53
		breq p53
		cpi temp, 54
		breq p54
		cpi temp, 55
		breq p55
		cpi temp, 60
		breq p60
		cpi temp, 61
		breq p61
		cpi temp, 62
		breq p62
		cpi temp, 70
		breq p70
		cpi temp, 80
		breq p80
		cpi temp, 90
		breq p90
		cpi temp, 91
		breq p91		
		cpi temp, 92
		breq p92
		cpi temp, 100
		breq p100
		cpi temp, 101
		breq p101
		cpi temp, 102
		breq p102
		cpi temp, 110
		breq p110

		rjmp pNextPart
p21:
		rjmp pr21
p22:
		rjmp pr22
p23:
		rjmp pr23
p24:
		rjmp pr24
p25:
		rjmp pr25
p26:
		rjmp pr26
p27:
		rjmp pr27
p28:
		rjmp pr28
p29:
		rjmp pr29
p41:
		rjmp pr41
p42:
		rjmp pr42
p43:
		rjmp pr43
p50:
		rjmp pr50
p51:
		rjmp pr51
p52:
		rjmp pr52
p53:
		rjmp pr53
p54:
		rjmp pr54
p55:
		rjmp pr55
p60:
		rjmp pr60
p61:
		rjmp pr61
p62:
		rjmp pr62
p70:
		rjmp pr70
p80:
		rjmp pr80
p90:
		rjmp pr90
p91:
		rjmp pr91
p92:
		rjmp pr92
p100:
		rjmp pr100
p101:
		rjmp pr101
p102:
		rjmp pr102
p110:
		rjmp pr110
		

pNextPart:
		cpi temp, 111
		breq p111
		cpi temp, 112
		breq p112
		cpi temp, 120
		breq p120
		cpi temp, 121
		breq p121
		cpi temp, 122
		breq p122
		cpi temp, 130
		breq p130
		cpi temp, 131
		breq p131

		rjmp p01

p111:
		rjmp pr111
p112:
		rjmp pr112
p120:
		rjmp pr120
p121:
		rjmp pr121
p122:
		rjmp pr122
p130:
		rjmp pr130
p131:
		rjmp pr131

		rjmp p01

pr131:		
		rcall incRealTimeMin		
		rjmp p01

pr130:		
		rcall incRealTimeHour
		rjmp p01


pr92:
		lds temp, varClockEnableON1		
		rcall incPrOnOff
		sts varClockEnableON1, temp
		mov R20, temp
		rcall showOnOff		
		rjmp p01

pr91:		
		lds prTemp2, varClockEnableMin1
		rcall incClockDisableMin
		sts varClockEnableMin1, prTemp2		
		rjmp pp01

pr90:		
		lds prTemp2, varClockEnableHour1
		rcall incClockDisableHour
		sts varClockEnableHour1, prTemp2		
		rjmp pp01

pr100:		
		lds prTemp2, varClockDisableHour1
		rcall incClockDisableHour
		sts varClockDisableHour1, prTemp2		
		rjmp pp01

pr101:		
		lds prTemp2, varClockDisableMin1
		rcall incClockDisableMin
		sts varClockDisableMin1, prTemp2		
		rjmp pp01

pr102:
		lds temp, varClockDisableON1		
		rcall incPrOnOff
		sts varClockDisableON1, temp
		mov R20, temp
		rcall showOnOff		
		rjmp p01

pr110:		
		lds prTemp2, varClockEnableHour2
		rcall incClockDisableHour
		sts varClockEnableHour2, prTemp2		
		rjmp pp01

pr111:		
		lds prTemp2, varClockEnableMin2
		rcall incClockDisableMin
		sts varClockEnableMin2, prTemp2		
		rjmp pp01

pr112:
		lds temp, varClockEnableON2	
		rcall incPrOnOff
		sts varClockEnableON2, temp
		mov R20, temp
		rcall showOnOff		
		rjmp p01

pr120:
		lds prTemp2, varClockDisableHour2
		rcall incClockDisableHour
		sts varClockDisableHour2, prTemp2		
		rjmp pp01

pr121:
		lds prTemp2, varClockDisableMin2
		rcall incClockDisableMin
		sts varClockDisableMin2, prTemp2		
		rjmp pp01

pr122:
		lds temp, varClockDisableON2	
		rcall incPrOnOff
		sts varClockDisableON2, temp
		mov R20, temp
		rcall showOnOff		
		rjmp p01

pr80:
		lds temp, varUniversalShowMemoryPower
		inc temp
		cpi temp, 10
		brlo pr80Next0
		clr temp
pr80Next0:
		sts varUniversalShowMemoryPower, temp
		rcall showMemoryPower
		rjmp p01

pr70:
		lds temp, varUniversalShowMemoryPower
		inc temp
		cpi temp, 10
		brlo pr70Next0
		clr temp
pr70Next0:
		sts varUniversalShowMemoryPower, temp
		rcall showMemoryPower
		rjmp p01

pr62:
		lds temp, varTimerOnOff		
		rcall incPrOnOff
		sts varTimerOnOff, temp
		mov R20, temp
		rcall showOnOff		
		rjmp p01

pr61:
		rcall incPrTimerMin
		rcall showTimer
		rjmp p01

pr60:			
		rcall incPrTimerHour
		rcall showTimer
		rjmp p01

pr55:
		lds temp, varSmallPwmOnOff
		inc temp
		cpi temp, 2
		breq ClearProcessDataOnOff
		rjmp NClearProcessDataOnOff
ClearProcessDataOnOff:
		clr temp
NClearProcessDataOnOff:
		sts varSmallPwmOnOff, temp
		lds R20, varSmallPwmOnOff
		rcall showOnOff
		rcall updateSmallPwmStatus
		rjmp p01
pr54:
		lds R20, varSmallPwmOff
		inc R20
		sts varSmallPwmOff, R20
		rcall updateSmallPwmStatus
		rcall showProcessStTimeOff		
		rjmp p01

pr53:
		lds R20, varSmallPwmOn
		inc R20
		sts varSmallPwmOn, R20
		rcall updateSmallPwmStatus
		rcall showProcessStTimeOn		
		rjmp p01
pr52:
		lds R20, varSmallPwmStTime2
		inc R20
		sts varSmallPwmStTime2, R20
		rcall updateSmallPwmStatus
		rcall showProcessStTime		
		rjmp p01
pr51:
		lds R20, varSmallPwmStTime1
		inc R20
		sts varSmallPwmStTime1, R20
		rcall showProcessStTime
		rcall updateSmallPwmStatus
		rjmp p01
pr50:
		lds R20, varSmallPwmStTime0
		inc R20
		sts varSmallPwmStTime0, R20
		rcall showProcessStTime
		rcall updateSmallPwmStatus
		rjmp p01
pr43:
		lds temp, varPwmONOFF
		inc temp
		cpi temp, 2
		breq ClearPwnONOFF
		rjmp NClearPwnONOFF
ClearPwnONOFF:
		clr temp		
NClearPwnONOFF:
		sts varPwmONOFF, temp
		lds R20, varPwmONOFF
		rcall showOnOff
		rcall powerStatusUpdate
		rjmp p01

pr42:
		lds temp, varPwmONDel
		inc temp
		cpi temp, 7
		breq ClearPwnDel
		rjmp NClearPwnDel
		ClearPwnDel:
		clr temp
NClearPwnDel:
		sts varPwmONDel, temp
		rcall showPwnDel
		rcall powerStatusUpdate
		rjmp p01
pr41:
		lds R20, varPwmDeep
		inc R20
		sts varPwmDeep, R20
		rcall showPwnDeep
		rcall powerStatusUpdate
		rjmp p01
pr29:
		rjmp ppr1
pr21:
		ldi temp,22
		sts positionMenu, temp		
		ldi prTemp1, 0b00001000
		sts varProcessDataDigit1D, prTemp1
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00110110
		sts varProcessDataDigit3D, prTemp1
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit3B, prTemp1
		sts varProcessDataDigit4B, prTemp1
		rjmp p01
pr22:
		ldi temp,23
		sts positionMenu, temp
		ldi prTemp1, 0b00001000
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00101101
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00111001
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1, 0b00111001
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit4B, prTemp1

		rjmp p01

pr23:
		ldi temp,24
		sts positionMenu, temp

		ldi prTemp1, 0b00001000
		sts varProcessDataDigit1D, prTemp1

		ldi prTemp1, 0b00110011
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00111001
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1, 0b00111001
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit4B, prTemp1

		rjmp p01

pr24:
		ldi temp,25
		sts positionMenu, temp

		ldi prTemp1, 0b00111000
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit1B, prTemp1

		ldi prTemp1, 0b00111111
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00110111
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1, 0b00011110
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit4B, prTemp1

		rjmp p01



pr28:
		ldi temp,29	; Clock OFF 1
		sts positionMenu, temp

		ldi prTemp1, 0b00111001
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit1B, prTemp1

		ldi prTemp1, 0b00111000
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00110001
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1, 0b00000110
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit4B, prTemp1	

		rjmp p01


pr27:
		ldi temp,28	; Clock ON 1
		sts positionMenu, temp

		ldi prTemp1, 0b00111001
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit1B, prTemp1

		ldi prTemp1, 0b00111000
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00111111
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1, 0b00000110
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit4B, prTemp1

		rjmp p01		

pr26:
		ldi temp,27	; Clock OFF 0
		sts positionMenu, temp

		ldi prTemp1, 0b00111001
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit1B, prTemp1

		ldi prTemp1, 0b00111000
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00110001
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1, 0b00111111
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit4B, prTemp1

		rjmp p01

pr25:
		ldi temp,26
		sts positionMenu, temp

		ldi prTemp1, 0b00111001
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit1B, prTemp1

		ldi prTemp1, 0b00111000
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00111111
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1, 0b00111111
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit4B, prTemp1

		rjmp p01

p01:
		reti

		;ldi temp,0xff
		;sts varProcessDataDigit2D, temp
		;ldi temp,0b00000001
		;sts varProcessDataDigit2B, temp

prButton1Exit:
		ret

Pause:
		ldi R28,-1
		ldi R29,-255
Loop:
		dec R28
		nop
		brne Loop
		ldi R28,-1
		dec R29
		nop
		brne Loop
		ret
