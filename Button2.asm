.cseg
prButton2Init:
		initPr 6,1,varButton2StTime0,varButton2StTime1

prButton2IsLoad:
		isLoadPr varButton2System,prButton2InitEt

prButton2Load:
		loadPr varButton2System,prButton2Init

prButton2Inc:
		incPr varButton2System,prButton2IncEt,varButton2CurTime0,varButton2CurTime1


prButton2TimeCheck:
		timeCheckPr varButton2System,prButton2TimeCheckEt,varButton2StTime0,varButton2StTime1,varButton2CurTime0,varButton2CurTime1

prButton2Func:
		FuncPr varButton2System,prButton2Exit0		
		rjmp prButton2FuncBeggin
prButton2Exit0:
		rjmp prButton2Exit
prButton2FuncBeggin:
		LDI temp,0
		STS varButton2CurTime0,temp
		STS varButton2CurTime1,temp
		ldi prTemp0, 0x01
		STS varButton2System, prTemp0

		lds prTemp0, varButton2Status
		andi prTemp0, 0b10000000
		cpi prTemp0, 0b00000000
		breq prButton2Press
		rjmp prButton2UnPress		

prButton2Press:
		SBIS PINB,4
		rjmp prButton2Exit
		SBIC PINB,5
		rjmp prButton2Exit
		rcall Pause
		lds prTemp0, varButton2Status
		ori prTemp0, 0b10000000
		sts varButton2Status, prTemp0
		rjmp prButton2Exit

prButton2UnPress:		
		SBIS PINB,5
		rjmp prButton2Exit
		clr prTemp0
		sts varButton2Status, prTemp0

		lds temp, positionMenu
		cpi temp, 1
		breq pp1
		cpi temp, 21
		breq pp21
		cpi temp, 22
		breq pp22
		cpi temp, 24
		breq pp24
		cpi temp, 25
		breq pp25		
		cpi temp, 26
		breq pp26	
		cpi temp, 27
		breq pp27
		cpi temp, 28
		breq pp28
		cpi temp, 29
		breq pp29
		cpi temp, 41
		breq pp41
		cpi temp, 42
		breq pp42
		cpi temp, 43
		breq pp43
		cpi temp, 50
		breq pp50
		cpi temp, 51
		breq pp51
		cpi temp, 52
		breq pp52
		cpi temp, 53
		breq pp53
		cpi temp, 54
		breq pp54
		cpi temp, 55
		breq pp55
		cpi temp, 23
		breq pp23
		cpi temp, 60
		breq pp60
		cpi temp, 61
		breq pp61
		cpi temp, 62
		breq pp62
		cpi temp, 70
		breq pp70
		cpi temp, 80
		breq pp80		
		cpi temp, 90
		breq pp90	
		cpi temp, 91
		breq pp91
		cpi temp, 92
		breq pp92
		cpi temp, 100
		breq pp100
		cpi temp, 101
		breq pp101
		cpi temp, 102
		breq pp102
		cpi temp, 110
		breq pp110	

		rjmp ppNextPart
pp1:
		rjmp ppr1
pp21:
		rjmp ppr21
pp22:
		rjmp ppr22
pp24:
		rjmp ppr24
pp25:
		rjmp ppr25
pp26:
		rjmp ppr26
pp27:
		rjmp ppr27
pp28:
		rjmp ppr28
pp29:
		rjmp ppr29
pp41:
		rjmp ppr41
pp42:
		rjmp ppr42
pp43:
		rjmp returnMainMenu
pp50:
		rjmp ppr50
pp51:
		rjmp ppr51
pp52:
		rjmp ppr52
pp53:
		rjmp ppr53
pp54:
		rjmp ppr54
pp55:
		rjmp returnMainMenu
pp23:
		rjmp ppr23
pp60:
		rjmp ppr60
pp61:
		rjmp ppr61
pp62:
		rjmp returnMainMenu
pp70:
		rjmp ppr70
pp80:
		rjmp ppr80
pp90:
		rjmp ppr90
pp91:
		rjmp ppr91
pp92:
		rjmp returnMainMenu
pp100:
		rjmp ppr100
pp101:
		rjmp ppr101
pp102:
		rjmp returnMainMenu
pp110:
		rjmp ppr110


ppNextPart:
		cpi temp, 111
		breq pp111
		cpi temp, 112
		breq pp112
		cpi temp, 120
		breq pp120
		cpi temp, 121
		breq pp121
		cpi temp, 122
		breq pp122

		rjmp pp01

pp111:
		rjmp ppr111
pp112:
		rjmp returnMainMenu
pp120:
		rjmp ppr120
pp121:
		rjmp ppr121
pp122:
		rjmp returnMainMenu

		rjmp pp01

ppr80:		
		rcall loadPowerSetting
		rcall returnMainMenu
		rjmp pp01

ppr25:
		ldi temp,80
		sts positionMenu, temp
		rcall showMemoryPower
		rjmp pp01

ppr26:		
		ldi temp,90
		sts positionMenu, temp
		lds R20, varClockEnableHour1
		rcall showClockDisableHour
		lds R20, varClockEnableMin1
		rcall showClockDisableMin				
		ldi temp, 0b00110000
		sts varBlinkDisplaySegments, temp
		rcall prBlinkDisplayLoad
		rjmp pp01

ppr27:		
		ldi temp,100
		sts positionMenu, temp
		lds R20, varClockDisableHour1
		rcall showClockDisableHour
		lds R20, varClockDisableMin1
		rcall showClockDisableMin				
		ldi temp, 0b00110000
		sts varBlinkDisplaySegments, temp
		rcall prBlinkDisplayLoad
		rjmp pp01

ppr29:		
		ldi temp,120
		sts positionMenu, temp
		lds R20, varClockDisableHour2
		rcall showClockDisableHour
		lds R20, varClockDisableMin2
		rcall showClockDisableMin				
		ldi temp, 0b00110000
		sts varBlinkDisplaySegments, temp
		rcall prBlinkDisplayLoad
		rjmp pp01

ppr28:		
		ldi temp,110
		sts positionMenu, temp
		lds R20, varClockEnableHour2
		rcall showClockDisableHour
		lds R20, varClockEnableMin2
		rcall showClockDisableMin				
		ldi temp, 0b00110000
		sts varBlinkDisplaySegments, temp
		rcall prBlinkDisplayLoad
		rjmp pp01

ppr90:		; down memory
		ldi temp,91
		sts positionMenu, temp
		lds R20, varClockEnableHour1
		rcall showClockDisableMin
		lds R20, varClockEnableMin1
		rcall showClockDisableMin				
		ldi temp, 0b00001100
		sts varBlinkDisplaySegments, temp	
		rjmp pp01

ppr91:		; down memory
		ldi temp,92
		sts positionMenu, temp
		rcall prBlinkDisplayUnLoad
		lds R20, varClockEnableON1
		rcall showOnOff
		rjmp pp01


ppr100:
		ldi temp,101
		sts positionMenu, temp
		lds R20, varClockDisableHour1
		rcall showClockDisableMin
		lds R20, varClockDisableMin1
		rcall showClockDisableMin				
		ldi temp, 0b00001100
		sts varBlinkDisplaySegments, temp	
		rjmp pp01

ppr101:
		ldi temp,102
		sts positionMenu, temp
		rcall prBlinkDisplayUnLoad
		lds R20, varClockDisableON1
		rcall showOnOff
		rjmp pp01

ppr110:
		ldi temp,111
		sts positionMenu, temp
		lds R20, varClockEnableHour2
		rcall showClockDisableMin
		lds R20, varClockEnableMin2
		rcall showClockDisableMin				
		ldi temp, 0b00001100
		sts varBlinkDisplaySegments, temp	
		rjmp pp01

ppr111:
		ldi temp,112
		sts positionMenu, temp
		rcall prBlinkDisplayUnLoad
		lds R20, varClockDisableON1
		rcall showOnOff
		rjmp pp01

ppr120:
		ldi temp,121
		sts positionMenu, temp
		lds R20, varClockDisableHour2
		rcall showClockDisableMin
		lds R20, varClockDisableMin2
		rcall showClockDisableMin				
		ldi temp, 0b00001100
		sts varBlinkDisplaySegments, temp	
		rjmp pp01

ppr121:
		ldi temp,122
		sts positionMenu, temp
		rcall prBlinkDisplayUnLoad
		lds R20, varClockDisableON2
		rcall showOnOff
		rjmp pp01


ppr70:		
		rcall savePowerSetting
		rcall returnMainMenu
		rjmp pp01

ppr24:
		ldi temp,70
		sts positionMenu, temp
		rcall showMemoryPower
		rjmp pp01

ppr61:
		ldi temp,62
		sts positionMenu, temp
		lds R20, varTimerOnOff		
		rcall prBlinkDisplayUnload
		rcall showOnOff
		rjmp pp01

ppr60:
		ldi temp,61
		sts positionMenu, temp		
		rcall showTimer					
		rcall prBlinkDisplayUnload
		rcall prBlinkDisplayLoad
		ldi temp, 0b00001100
		sts varBlinkDisplaySegments, temp
		rjmp pp01

ppr23:
		ldi temp,60
		sts positionMenu, temp
		clr temp
		sts varTimerOnOff, temp
		sts varTimerSec, temp		
		rcall showTimer
		rcall prBlinkDisplayLoad
		ldi temp, 0b00110000
		sts varBlinkDisplaySegments, temp
		rjmp pp01

ppr54:
		ldi temp,55
		sts positionMenu, temp
		lds R20, varSmallPwmOnOff
		;rcall prSmallPwmLoad
		rcall showOnOff
		rcall updateSmallPwmStatus
		rjmp pp01

ppr53:
		ldi temp,54
		sts positionMenu, temp
		lds R20, varSmallPwmOff
		rcall showProcessStTimeOff
		rcall updateSmallPwmStatus
		;rcall prSmallPwmLoad
		rjmp pp01

ppr52:
		ldi temp,53
		sts positionMenu, temp
		lds R20, varSmallPwmOn
		rcall showProcessStTimeOn
		rcall updateSmallPwmStatus
		;rcall prSmallPwmLoad
		rjmp pp01

ppr51:
		ldi temp,52
		sts positionMenu, temp
		lds R20, varSmallPwmStTime2
		rcall showProcessStTime
		rcall updateSmallPwmStatus
		;rcall prSmallPwmLoad
		rjmp pp01

ppr50:
		ldi temp,51
		sts positionMenu, temp
		lds R20, varSmallPwmStTime1
		rcall showProcessStTime
		rcall updateSmallPwmStatus
		;rcall prSmallPwmLoad
		rjmp pp01

ppr22:
		ldi temp,50
		sts positionMenu, temp
		ldi temp, 1
		sts varSmallPwmOnOff, temp
		lds R20, varSmallPwmStTime0
		rcall showProcessStTime
		;rcall prSmallPwmLoad
		rcall updateSmallPwmStatus
		rjmp pp01

ppr42:
		ldi temp,43
		sts positionMenu, temp
		lds R20, varPwmONOFF
		rcall showOnOff
		rcall powerStatusUpdate
		rjmp pp01

ppr41:
		ldi temp,42
		sts positionMenu, temp		
		rcall showPwnDel
		rcall powerStatusUpdate
		rjmp pp01
ppr1:
		ldi temp,21
		sts positionMenu, temp
		rcall prRealClockUnload
		ldi prTemp1, 0b00001000
		sts varProcessDataDigit1D, prTemp1
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00110001
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit3B, prTemp1
		sts varProcessDataDigit4B, prTemp1
		ldi prTemp1, 0b00110110
		sts varProcessDataDigit4D, prTemp1
		rjmp pp01

ppr21:
		ldi temp,41
		sts positionMenu, temp
		ldi temp, 1
		sts varPwmONOFF, temp
		rcall showPwnDeep
		rcall powerStatusUpdate
		rjmp pp01
pp01:
prButton2Exit:
		ret


