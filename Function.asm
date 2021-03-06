.cseg
toDigit:
		ldi r30,0
		mov R0,R30		 
        ldi   r16,-1            
        ldi   r17,low(1000)     
        ldi   r18,high(1000)
   toDigitLOOP1:   
    	inc   r16          
        sub   r20,r17        
        sbc   r21,r18
        brcc  toDigitLOOP1         
        add   r20,r17        
        adc   r21,r18
        sts   DIGIT1,r16
        ldi   r16,-1           
        ldi   r17,100          
   toDigitLOOP2:   
		inc   r16          
        sub   r20,r17       
        sbc   r21,R0
        brcc  toDigitLOOP2        
        add   r20,r17       
        adc   r21,R0
        sts   DIGIT2,r16
        ldi   r16,-1           
        ldi   r17,10           
   toDigitLOOP3:   
   		inc   r16           
        sub   r20,r17        
        brcc  toDigitLOOP3        
        add   r20,r17
        sts   DIGIT3,r16
        sts   DIGIT4,r20
		ret

prProcessDataDigital:
		cpi prTemp0,1
		breq prProcessDataOne
		cpi prTemp0,2
		breq prProcessDataTwo
		cpi prTemp0,3
		breq prProcessDataFree
		cpi prTemp0,4
		breq prProcessDataFour
		cpi prTemp0,5
		breq prProcessDataFive
		cpi prTemp0,6
		breq prProcessDataSix
		cpi prTemp0,7
		breq prProcessDataSeven
		cpi prTemp0,8
		breq prProcessDataEigth
		cpi prTemp0,9
		breq prProcessDataNine
		cpi prTemp0,0
		breq prProcessDataZero
prProcessDataOne:				
		ldi prTemp0,0b00000110
		ldi prTemp1, 0b00000000
		rjmp prProcessDataExitDigital
prProcessDataTwo:
		ldi prTemp0,0b00011011
		ldi prTemp1,0b00000001
		rjmp prProcessDataExitDigital
prProcessDataFree:
		ldi prTemp0,0b00001111
		ldi prTemp1,0b00000001
		rjmp prProcessDataExitDigital
prProcessDataFour:
		ldi prTemp0,0b00100110
		ldi prTemp1,0b00000001
		rjmp prProcessDataExitDigital
prProcessDataFive:
		ldi prTemp0,0b00101101
		ldi prTemp1,0b00000001
		rjmp prProcessDataExitDigital
prProcessDataSix:
		ldi prTemp0,0b00111101
		ldi prTemp1,0b00000001
		rjmp prProcessDataExitDigital
prProcessDataSeven:
		ldi prTemp0,0b00000111
		ldi prTemp1,0b00000000
		rjmp prProcessDataExitDigital
prProcessDataEigth:
		ldi prTemp0,0b00111111
		ldi prTemp1,0b00000001
		rjmp prProcessDataExitDigital
prProcessDataNine:
		ldi prTemp0,0b00101111
		ldi prTemp1,0b00000001
		rjmp prProcessDataExitDigital
prProcessDataZero:
		ldi prTemp0,0b00111111
		ldi prTemp1,0b00000000
		rjmp prProcessDataExitDigital
prProcessDataExitDigital:
		ret

showPwnDel:
		lds temp, varPwmONDel
		cpi temp,0
		breq del0
		cpi temp,1
		breq del1
		cpi temp,2
		breq del2
		cpi temp,3
		breq del3
		cpi temp,4
		breq del4
		cpi temp,5
		breq del5
		cpi temp,6
		breq del6
del0:
		rjmp ddel0
del1:
		rjmp ddel1
del2:
		rjmp ddel2
del3:
		rjmp ddel3
del4:
		rjmp ddel4
del5:
		rjmp ddel5
del6:
		rjmp ddel6

ddel0:
		ldi prTemp1, 0b00011110
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit1B, prTemp1

		ldi prTemp1, 0b00111001
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00111000
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1, 0b00111111
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit4B, prTemp1

		ret

ddel1:
		ldi prTemp1, 0b00011110
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit1B, prTemp1

		ldi prTemp1, 0b00111001
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00111000
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1, 0b00000110
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1,0b00000000
		sts varProcessDataDigit4B, prTemp1

		ret

ddel2:
		ldi prTemp1, 0b00011110
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit1B, prTemp1

		ldi prTemp1, 0b00111001
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00111000
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1,0b00011011		
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1,0b00000001
		sts varProcessDataDigit4B, prTemp1

		ret

ddel3:
		ldi prTemp1, 0b00011110
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit1B, prTemp1

		ldi prTemp1, 0b00111001
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00111000
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1,0b00001111
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1,0b00000001
		sts varProcessDataDigit4B, prTemp1

		ret

ddel4:
		ldi prTemp1, 0b00011110
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit1B, prTemp1


		ldi prTemp1, 0b00111001
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00111000
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1,0b00100110
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1,0b00000001
		sts varProcessDataDigit4B, prTemp1

		ret

ddel5:
		ldi prTemp1, 0b00011110
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit1B, prTemp1

		ldi prTemp1, 0b00111001
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00111000
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1,0b00101101
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1,0b00000001
		sts varProcessDataDigit4B, prTemp1

		ret

ddel6:
		ldi prTemp1, 0b00011110
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit1B, prTemp1

		ldi prTemp1, 0b00111001
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00111000
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1,0b00111101
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1,0b00000001
		sts varProcessDataDigit4B, prTemp1

		ret

showPwnDeep:
		lds R20, varPwmDeep
		ldi R21, 0
		rcall toDigit
		lds prTemp0, DIGIT4
		rcall prProcessDataDigital
		sts varProcessDataDigit4D, prTemp0
		sts varProcessDataDigit4B, prTemp1

		lds prTemp0, DIGIT3
		rcall prProcessDataDigital
		sts varProcessDataDigit3D, prTemp0
		sts varProcessDataDigit3B, prTemp1

		lds prTemp0, DIGIT2
		rcall prProcessDataDigital
		sts varProcessDataDigit2D, prTemp0
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp0, 0b00001000
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit1D, prTemp0
		sts varProcessDataDigit1B, prTemp1

		ret

showOnOff:
		cpi R20,0
		breq pwnOff
		cpi R20,1
		breq pwnOn

pwnOff:
		rjmp ppwnOff
pwnOn:
		rjmp ppwnOn

ppwnOff:

		ldi prTemp1, 0b00001000
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit1B, prTemp1

		ldi prTemp1, 0b00111111
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00110001
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1, 0b00110001
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit4B, prTemp1

		ret

ppwnOn:

		ldi prTemp1, 0b00001000
		sts varProcessDataDigit1D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit1B, prTemp1

		ldi prTemp1, 0b00111111
		sts varProcessDataDigit2D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit2B, prTemp1

		ldi prTemp1, 0b00110110
		sts varProcessDataDigit3D, prTemp1
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit3B, prTemp1

		ldi prTemp1, 0b00000000
		sts varProcessDataDigit4D, prTemp1
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit4B, prTemp1

		ret

powerStatusUpdate:
		lds temp, varPwmONOFF
		cpi temp, 1
		breq powerPwmStart
		clr temp 
		out TCCR2, temp
		sbi PORTB, 3

		ret

powerPwmStart:
		cbi PORTB, 3
		lds prTemp0, varPwmONDel
		cpi prTemp0, 0
		breq Del0q
		cpi prTemp0, 1
		breq Del8q
		cpi prTemp0, 2
		breq Del32q
		cpi prTemp0, 3
		breq Del64q
		cpi prTemp0, 4
		breq Del128q
		cpi prTemp0, 5
		breq Del256q
		cpi prTemp0, 6
		breq Del1024q
Del0q:
		rjmp PDel0
Del8q:
		rjmp PDel8
Del32q:
		rjmp PDel32
Del64q:
		rjmp PDel64
Del128q:
		rjmp PDel128
Del256q:
		rjmp PDel256
Del1024q:
		rjmp PDel1024
PDel0:
		clr prTemp0
		ori prTemp0, 0b00000001
		rjmp setDel
PDel8:
		clr prTemp0
		ori prTemp0, 0b00000010
		rjmp setDel
PDel32:
		clr prTemp0
		ori prTemp0, 0b00000011
		rjmp setDel
PDel64:
		clr prTemp0
		ori prTemp0, 0b00000100
		rjmp setDel
PDel128:
		clr prTemp0
		ori prTemp0, 0b00000101
		rjmp setDel
PDel256:
		clr prTemp0
		ori prTemp0, 0b00000110
		rjmp setDel
PDel1024:
		clr prTemp0
		ori prTemp0, 0b00000111
		rjmp setDel
setDel:
		lds prTemp2, varPwmDeep
		ldi prTemp1,0b01101000
		or prTemp1, prTemp0
		out TCCR2, prTemp1
		out OCR2,prTemp2
		ret	

showProcessStTime:
		ldi R21, 0
		rcall toDigit

		ldi prTemp0, 0b00001000
		ldi prTemp1, 0b00000000
		sts varProcessDataDigit1D, prTemp0
		sts varProcessDataDigit1B, prTemp1

		lds prTemp0, DIGIT4
		rcall prProcessDataDigital
		sts varProcessDataDigit4D, prTemp0
		sts varProcessDataDigit4B, prTemp1

		lds prTemp0, DIGIT3
		rcall prProcessDataDigital
		sts varProcessDataDigit3D, prTemp0
		sts varProcessDataDigit3B, prTemp1

		lds prTemp0, DIGIT2
		rcall prProcessDataDigital
		sts varProcessDataDigit2D, prTemp0
		sts varProcessDataDigit2B, prTemp1

		ret

showProcessStTimeOn:
		ldi R21, 0
		rcall toDigit

		ldi prTemp0, 0b00111111
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit1D, prTemp0
		sts varProcessDataDigit1B, prTemp1

		lds prTemp0, DIGIT4
		rcall prProcessDataDigital
		sts varProcessDataDigit4D, prTemp0
		sts varProcessDataDigit4B, prTemp1

		lds prTemp0, DIGIT3
		rcall prProcessDataDigital
		sts varProcessDataDigit3D, prTemp0
		sts varProcessDataDigit3B, prTemp1

		lds prTemp0, DIGIT2
		rcall prProcessDataDigital
		sts varProcessDataDigit2D, prTemp0
		sts varProcessDataDigit2B, prTemp1

		ret


showProcessStTimeOff:
		ldi R21, 0
		rcall toDigit

		ldi prTemp0, 0b00110001
		ldi prTemp1, 0b00000001
		sts varProcessDataDigit1D, prTemp0
		sts varProcessDataDigit1B, prTemp1

		lds prTemp0, DIGIT4
		rcall prProcessDataDigital
		sts varProcessDataDigit4D, prTemp0
		sts varProcessDataDigit4B, prTemp1

		lds prTemp0, DIGIT3
		rcall prProcessDataDigital
		sts varProcessDataDigit3D, prTemp0
		sts varProcessDataDigit3B, prTemp1

		lds prTemp0, DIGIT2
		rcall prProcessDataDigital
		sts varProcessDataDigit2D, prTemp0
		sts varProcessDataDigit2B, prTemp1
		ret

updateSmallPwmStatus:
		lds temp, varSmallPwmOnOff
		cpi temp, 0
		breq updateSmallPwmStatusOff
		rcall prSmallPwmLoad
		ret

updateSmallPwmStatusOff:
		rcall prSmallPwmUnLoad
		lds temp, varPwmONOFF
		cpi temp, 1
		breq updateSmallPwmStatusRevert
		sbi PORTB, 3
		ret
updateSmallPwmStatusRevert:
		ldi prTemp4, 0b00100000
		rcall revertPower
		ret

revertPower:
		lds temp, varPwmONOFF		
		cpi temp, 1
		breq revertPwmPower
revertSmallPwmPower:
		in temp, PORTB
		andi temp, 0b11110111
		eor temp, prTemp3
		out PORTB, temp		
		rjmp revertPowerRet
revertPwmPower:
		in temp, TCCR2
		andi temp, 0b11011111
		eor temp, prTemp4
		out TCCR2, temp		
revertPowerRet:	
		ret

showTimer:	
		lds R20, varTimerHour
		ldi R21, 0
		rcall toDigit

		lds prTemp0, DIGIT3
		rcall prProcessDataDigital
		sts varProcessDataDigit1D, prTemp0
		sts varProcessDataDigit1B, prTemp1

		lds prTemp0, DIGIT4
		rcall prProcessDataDigital
		ori prTemp1, 0b00000100
		sts varProcessDataDigit2D, prTemp0
		sts varProcessDataDigit2B, prTemp1		

		lds R20, varTimerMin
		ldi R21, 0
		rcall toDigit

		lds prTemp0, DIGIT3
		rcall prProcessDataDigital
		sts varProcessDataDigit3D, prTemp0
		sts varProcessDataDigit3B, prTemp1

		lds prTemp0, DIGIT4
		rcall prProcessDataDigital
		sts varProcessDataDigit4D, prTemp0
		sts varProcessDataDigit4B, prTemp1	

		ret

incPrTimerHour:
		lds prTemp0, varTimerHour
		inc prTemp0
		cpi prTemp0, 100
		brlo incPrTimerHourNext
incPrTimerHourResetTimer:
		clr prTemp0		
incPrTimerHourNext:
		sts varTimerHour, prTemp0

		ret

incPrTimerMin:
		lds prTemp0, varTimerMin
		inc prTemp0
		cpi prTemp0, 60
		brlo incPrTimerMinNext
incPrTimerMinTimer:
		clr prTemp0		
incPrTimerMinNext:
		sts varTimerMin, prTemp0

		ret

incPrOnOff:		
		inc temp
		cpi temp, 2
		breq incPrOnOffClear
		rjmp incPrOnOffRet
incPrOnOffClear:
		clr temp
incPrOnOffRet:
		ret

decPrTimer:
		lds temp, varTimerSec
		cpi temp, 0
		breq decPrTimerResetSec
		rjmp decPrTimerNext1
decPrTimerResetSec:
		lds temp, varTimerMin
		cpi temp, 0
		breq decPrTimerResetMin
		rjmp decPrTimerNext2
decPrTimerResetMin:
		lds temp, varTimerHour
		cpi temp, 0
		breq decPrTimerResetTime
		rjmp decPrTimerNext4
decPrTimerResetTime:			
		ret
decPrTimerNext4: 
		lds temp, varTimerHour
		dec temp
		sts varTimerHour, temp
		ldi temp, 59
		sts varTimerMin, temp		
		sts varTimerSec, temp
		rjmp decPrTimerRet
decPrTimerNext2:
		lds temp, varTimerMin
		dec temp
		sts varTimerMin, temp
		ldi temp, 59
		sts varTimerSec, temp
		rjmp decPrTimerRet
decPrTimerNext1:
		lds temp, varTimerSec
		dec temp
		sts varTimerSec, temp
decPrTimerRet:
		ret 

checkPrTimer:
		lds temp, varTimerOnOff
		cpi temp, 1
		brne checkPrTimerRet
		rjmp checkPrTimerNext0
checkPrTimerRet:
		ret	
checkPrTimerNext0:
		rcall decPrTimer
		lds prTemp0, varTimerHour
		cpi prTemp0, 0
		brne checkPrTimerRet
		lds prTemp0, varTimerMin
		cpi prTemp0, 0
		brne checkPrTimerRet
		lds prTemp0, varTimerSec
		cpi prTemp0, 0
		brne checkPrTimerRet
		rcall prSmallPwmUnload
		ldi prTemp3,0b00000000
		ldi prTemp4,0b00000000
		rcall revertPower
		cbi PORTB,3
		clr temp
		sts varTimerOnOff, temp
		ret

Hz10Actions:
		lds prTemp0, varRealTimeDelimiter10Hz
		inc prTemp0
		cpi prTemp0, 10
		BRLO Hz10ActionsRet
		clr prTemp0
		rcall secActions
Hz10ActionsRet:
		sts varRealTimeDelimiter10Hz, prTemp0
		ret

secActions:
		rcall checkPrTimer
		rcall incSecClock
		rcall incRealClock		
		ret

incRealClock:
		lds temp, varRealTimeClockSec		
		inc temp 
		cpi temp, 60
		breq incRealClockNext0
		sts varRealTimeClockSec, temp
		rjmp incRealClockRet
incRealClockNext0:
		clr temp
		sts varRealTimeClockSec, temp
		lds temp, varRealTimeClockMin
		inc temp
		cpi temp, 60
		breq incRealClockNext1
		sts varRealTimeClockMin, temp		
		rjmp incRealClockRetAlarm
incRealClockNext1:
		clr temp
		sts varRealTimeClockMin, temp
		lds temp, varRealTimeClockHour
		inc temp
		cpi temp, 24

		breq incRealClockNext2
		sts varRealTimeClockHour, temp
		rjmp incRealClockRetAlarm
incRealClockNext2:
		clr temp
		sts varRealTimeClockHour, temp
incRealClockRetAlarm:
		rcall checkAlarmRealClock
incRealClockRet:
		ret

checkAlarmRealClock:
		lds temp, varPowerOff
		cpi temp, 1
		breq checkAlarmRealClockOff
checkAlarmRealClockOn1:
		lds temp,varClockEnableON1
		cpi temp, 0
		breq checkAlarmRealClockOn2
		lds temp, varClockEnableMin1
		lds prTemp0, varRealTimeClockMin
		cp temp, prTemp0
		brne checkAlarmRealClockOn2
		lds temp, varClockEnableHour1
		lds prTemp0, varRealTimeClockHour
		cp temp, prTemp0
		brne checkAlarmRealClockOn2
		rcall powerOn
		rjmp checkAlarmRealClockRet
checkAlarmRealClockOn2:
		lds temp,varClockEnableON2
		cpi temp, 0
		breq checkAlarmRealClockRet
		lds temp, varClockEnableMin2
		lds prTemp0, varRealTimeClockMin
		cp temp, prTemp0
		brne checkAlarmRealClockRet
		lds temp, varClockEnableHour2
		lds prTemp0, varRealTimeClockHour
		cp temp, prTemp0
		brne checkAlarmRealClockRet
		rcall powerOn
		rjmp checkAlarmRealClockRet
checkAlarmRealClockOff:
		lds temp,varClockDisableON1
		cpi temp, 0
		breq checkAlarmRealClockOff2
		lds temp, varClockDisableMin1
		lds prTemp0, varRealTimeClockMin
		cp temp, prTemp0
		brne checkAlarmRealClockOff2
		lds temp, varClockDisableHour1
		lds prTemp0, varRealTimeClockHour
		cp temp, prTemp0
		brne checkAlarmRealClockOff2
		rcall powerOff
		rjmp checkAlarmRealClockRet
checkAlarmRealClockOff2:
		lds temp,varClockDisableON2
		cpi temp, 0
		breq checkAlarmRealClockRet
		lds temp, varClockDisableMin2
		lds prTemp0, varRealTimeClockMin
		cp temp, prTemp0
		brne checkAlarmRealClockRet
		lds temp, varClockDisableHour2
		lds prTemp0, varRealTimeClockHour
		cp temp, prTemp0
		brne checkAlarmRealClockRet
		rcall powerOff
checkAlarmRealClockRet:		
		ret

powerOn:
		rcall powerStatusUpdate			
		rcall updateSmallPwmStatus
		ldi temp, 1
		sts varPowerOff, temp
		ret

powerOff:
		clr temp
		out TCCR2, temp		
		out TCNT2, temp
		rcall prSmallPwmUnload
		cbi PORTB, 3
		clr temp
		sts varPowerOff, temp
		ret

incRealTimeMin:
		lds temp, varRealTimeClockMin
		inc temp
		cpi temp, 60
		brne incRealTimeMinRet
		clr temp		
incRealTimeMinRet:
		sts varRealTimeClockMin, temp
		ret

incRealTimeHour:
		lds temp, varRealTimeClockHour
		inc temp
		cpi temp, 24
		brne incRealTimeHourRet
		clr temp		
incRealTimeHourRet:
		sts varRealTimeClockHour, temp
		ret

incSecClock:
		lds temp, varClockSec		
		inc temp 
		cpi temp, 60
		breq incSecClockNext0
		sts varClockSec, temp
		rjmp incSecClockRet
incSecClockNext0:
		clr temp
		sts varClockSec, temp
		lds temp, varClockMin
		inc temp
		cpi temp, 60
		breq incSecClockNext1
		sts varClockMin, temp
		rjmp incSecClockRet
incSecClockNext1:
		clr temp
		sts varClockMin, temp
		lds temp, varClockHour
		inc temp
		cpi temp, 100
		breq incSecClockNext2
		sts varClockHour, temp
		rjmp incSecClockRet
incSecClockNext2:
		clr temp
		sts varClockHour, temp
incSecClockRet:
		ret

updateRealClock:
		lds prTemp3, varRealTimeClockMin		
		lds prTemp4, varRealTimeClockHour
		sts varUniversalShow2DigitTime0, prTemp3
		sts varUniversalShow2DigitTime1, prTemp4
		rcall Show2DigitTime		
		ret

updateClock:
		lds prTemp3, varClockMin		
		lds prTemp4, varClockHour
		cpi prTemp4, 1
		brsh showClockNext0
		lds prTemp3, varClockSec
		lds prTemp4, varClockMin
showClockNext0:
		sts varUniversalShow2DigitTime0, prTemp3
		sts varUniversalShow2DigitTime1, prTemp4
		rcall Show2DigitTime
		ret		

Show2DigitTime:
		lds R20, varUniversalShow2DigitTime1		
		ldi R21, 0
		rcall toDigit

		lds prTemp0, DIGIT3
		rcall prProcessDataDigital
		sts varProcessDataDigit1D, prTemp0
		sts varProcessDataDigit1B, prTemp1

		lds prTemp0, DIGIT4
		rcall prProcessDataDigital
		ori prTemp1, 0b00000100
		sts varProcessDataDigit2D, prTemp0
		sts varProcessDataDigit2B, prTemp1	
		
		lds R20, varUniversalShow2DigitTime0	
		ldi R21, 0
		rcall toDigit		

		lds prTemp0, DIGIT3
		rcall prProcessDataDigital
		sts varProcessDataDigit3D, prTemp0
		sts varProcessDataDigit3B, prTemp1

		lds prTemp0, DIGIT4
		rcall prProcessDataDigital
		sts varProcessDataDigit4D, prTemp0
		sts varProcessDataDigit4B, prTemp1			

		ret

showMemoryPower:		
		ldi prTemp0, 0b00001000
		clr prTemp1
		sts varProcessDataDigit1D, prTemp0
		sts varProcessDataDigit1B, prTemp1

		sts varProcessDataDigit2D, prTemp0
		sts varProcessDataDigit2B, prTemp1

		sts varProcessDataDigit3D, prTemp0
		sts varProcessDataDigit3B, prTemp1		

		lds R20,varUniversalShowMemoryPower
		ldi R21, 0
		rcall toDigit
		lds prTemp0, DIGIT4
		rcall prProcessDataDigital
		sts varProcessDataDigit4D, prTemp0
		sts varProcessDataDigit4B, prTemp1

		ret

loadPowerSetting:
		cli
		lds R20,varUniversalShowMemoryPower		
		ldi prTemp0, 1
		ldi prTemp1, 50
		ldi prTemp2, 0
		mul R20, prTemp1

		rcall EERead
		sts varPwmDeep,temp		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varPwmONDel,temp
		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varPwmONOFF,temp
		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varSmallPwmSystem,temp
		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varSmallPwmStTime0,temp
		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varSmallPwmStTime1,temp
	

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varSmallPwmStTime2,temp
		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varSmallPwmOff,temp
		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varSmallPwmOn,temp
		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varSmallPwmOnOff,temp
		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varSmallPwmCurOnOff,temp
		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varSmallPwmState,temp
		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varTimerSec,temp
		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varTimerMin,temp
		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varTimerHour,temp
		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varTimerOnOff,temp
		

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varClockSec,temp	

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varClockMin,temp

		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead
		sts varClockHour,temp
			
		rcall powerStatusUpdate	
		rcall updateSmallPwmStatus

		ret

savePowerSetting:		
		cli
		lds R20,varUniversalShowMemoryPower		
		ldi prTemp0, 1
		ldi prTemp1, 50
		ldi prTemp2, 0
		mul R20, prTemp1		

		
		lds temp,varPwmDeep
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varPwmONDel
		rcall EEWrite	

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varPwmONOFF
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varSmallPwmSystem
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varSmallPwmStTime0
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varSmallPwmStTime1
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varSmallPwmStTime2
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varSmallPwmOff
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varSmallPwmOn
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varSmallPwmOnOff
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varSmallPwmCurOnOff
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varSmallPwmState
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varTimerSec
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varTimerMin
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varTimerHour
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varTimerOnOff
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varClockSec
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varClockMin
		rcall EEWrite

		add R0, prTemp0
		adc R1, prTemp2
		lds temp,varClockHour
		rcall EEWrite
						
		ret

EEWrite:	
		sbic EECR,EEWE
		rjmp EEWrite
 
		cli
		out	EEARL,R0
		out	EEARH,R1
		out	EEDR,temp
 
		sbi	EECR,EEMWE
		sbi	EECR,EEWE
 
		sei
		ret

EERead:	
		sbic EECR,EEWE
		rjmp EERead
		out	EEARL, R0
		out	EEARH, R1
		sbi	EECR,EERE
		in temp, EEDR
		ret


showClockDisableHour:
		clr R21
		rcall toDigit

		lds prTemp0, DIGIT3
		rcall prProcessDataDigital
		sts varProcessDataDigit1D, prTemp0
		sts varProcessDataDigit1B, prTemp1

		lds prTemp0, DIGIT4
		rcall prProcessDataDigital
		ori prTemp1, 0b00000100
		sts varProcessDataDigit2D, prTemp0
		sts varProcessDataDigit2B, prTemp1		
		ret

showClockDisableMin:
		clr R21
		rcall toDigit

		lds prTemp0, DIGIT3
		rcall prProcessDataDigital
		sts varProcessDataDigit3D, prTemp0
		sts varProcessDataDigit3B, prTemp1

		lds prTemp0, DIGIT4
		rcall prProcessDataDigital
		sts varProcessDataDigit4D, prTemp0
		sts varProcessDataDigit4B, prTemp1
		ret

incClockDisableHour:
		inc prTemp2
		cpi prTemp2, 24
		breq incClockDisableHourNULL
		rjmp incClockDisableHourRet
incClockDisableHourNULL:
		clr prTemp2
incClockDisableHourRet:
		mov R20, prTemp2
		rcall showClockDisableHour
		ret

incClockDisableMin:
		inc prTemp2
		cpi prTemp2, 60
		breq incClockDisableMinNULL
		rjmp incClockDisableMinRet
incClockDisableMinNULL:
		clr prTemp2
incClockDisableMinRet:
		mov R20, prTemp2
		rcall showClockDisableMin
		ret

returnMainMenu:		
		ldi temp, 1
		sts positionMenu, temp
		rcall prRealClockLoad
		ret

onOffPower:
		rcall incPrOnOff
		cpi temp, 1
		brne onOffPowerOFF
onOffPowerOn:
		rcall powerOn
		ret
onOffPowerOFF:
		rcall powerOff
		ret
