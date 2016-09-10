.cseg

loadPowerSetting:
		cli
		lds R20,varUniversalShowMemoryPower		
		ldi prTemp0, 1
		ldi prTemp1, 50
		ldi prTemp2, 0
		mul R20, prTemp1

		rcall EERead
		sts varPwmDeep,temp
		
		rcall LoadNextSegment
		sts varPwmONDel,temp		

		rcall LoadNextSegment
		sts varPwmONOFF,temp		

		rcall LoadNextSegment
		sts varSmallPwmSystem,temp		

		rcall LoadNextSegment
		sts varSmallPwmStTime0,temp		

		rcall LoadNextSegment
		sts varSmallPwmStTime1,temp	

		rcall LoadNextSegment
		sts varSmallPwmStTime2,temp		

		rcall LoadNextSegment
		sts varSmallPwmOff,temp		

		rcall LoadNextSegment
		sts varSmallPwmOn,temp		

		rcall LoadNextSegment
		sts varSmallPwmOnOff,temp		

		rcall LoadNextSegment
		sts varSmallPwmCurOnOff,temp		

		rcall LoadNextSegment
		sts varSmallPwmState,temp		

		rcall LoadNextSegment
		sts varTimerSec,temp		

		rcall LoadNextSegment
		sts varTimerMin,temp		

		rcall LoadNextSegment
		sts varTimerHour,temp		

		rcall LoadNextSegment
		sts varTimerOnOff,temp		

		rcall LoadNextSegment
		sts varClockSec,temp	

		rcall LoadNextSegment
		sts varClockMin,temp

		rcall LoadNextSegment
		sts varClockHour,temp

		rcall LoadNextSegment
		sts varClockEnableHour1,temp

		rcall LoadNextSegment
		sts varClockEnableMin1,temp

		rcall LoadNextSegment
		sts varClockEnableON1,temp

		rcall LoadNextSegment
		sts varClockEnableHour2,temp

		rcall LoadNextSegment
		sts varClockEnableMin2,temp

		rcall LoadNextSegment
		sts varClockEnableON2,temp

		rcall LoadNextSegment
		sts varClockDisableHour1,temp

		rcall LoadNextSegment
		sts varClockDisableMin1,temp

		rcall LoadNextSegment
		sts varClockDisableON1,temp

		rcall LoadNextSegment
		sts varClockDisableHour2,temp

		rcall LoadNextSegment
		sts varClockDisableMin2,temp

		rcall LoadNextSegment
		sts varClockDisableON2,temp
			
		rcall powerStatusUpdate	
		rcall updateSmallPwmStatus

		sei
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
		
		lds temp,varPwmONDel
		rcall WriteNextSegment
		
		lds temp,varPwmONOFF
		rcall WriteNextSegment

		lds temp,varSmallPwmSystem
		rcall WriteNextSegment

		lds temp,varSmallPwmStTime0
		rcall WriteNextSegment

		lds temp,varSmallPwmStTime1
		rcall WriteNextSegment

		lds temp,varSmallPwmStTime2
		rcall WriteNextSegment
		
		lds temp,varSmallPwmOff
		rcall WriteNextSegment
		
		lds temp,varSmallPwmOn
		rcall WriteNextSegment
		
		lds temp,varSmallPwmOnOff
		rcall WriteNextSegment
		
		lds temp,varSmallPwmCurOnOff
		rcall WriteNextSegment
		
		lds temp,varSmallPwmState
		rcall WriteNextSegment
		
		lds temp,varTimerSec
		rcall WriteNextSegment
		
		lds temp,varTimerMin
		rcall WriteNextSegment
		
		lds temp,varTimerHour
		rcall WriteNextSegment
		
		lds temp,varTimerOnOff
		rcall WriteNextSegment
		
		lds temp,varClockSec
		rcall WriteNextSegment
		
		lds temp,varClockMin
		rcall WriteNextSegment
		
		lds temp,varClockHour
		rcall WriteNextSegment
		
		lds temp,varClockEnableHour1
		rcall WriteNextSegment

		lds temp,varClockEnableMin1
		rcall WriteNextSegment

		lds temp,varClockEnableON1
		rcall WriteNextSegment

		lds temp,varClockEnableHour2
		rcall WriteNextSegment

		lds temp,varClockEnableMin2
		rcall WriteNextSegment

		lds temp,varClockEnableON2
		rcall WriteNextSegment

		lds temp,varClockDisableHour1
		rcall WriteNextSegment

		lds temp,varClockDisableMin1
		rcall WriteNextSegment

		lds temp,varClockDisableON1
		rcall WriteNextSegment

		lds temp,varClockDisableHour2
		rcall WriteNextSegment

		lds temp,varClockDisableMin2
		rcall WriteNextSegment

		lds temp,varClockDisableON2
		rcall WriteNextSegment
		
		sei		
		ret

LoadNextSegment:
		add R0, prTemp0
		adc R1, prTemp2
		rcall EERead		
		ret

WriteNextSegment:
		add R0, prTemp0
		adc R1, prTemp2		
		rcall EEWrite		
		ret
		

EEWrite:	
		sbic EECR,EEWE
		rjmp EEWrite 
		
		out	EEARL,R0
		out	EEARH,R1
		out	EEDR,temp
 
		sbi	EECR,EEMWE
		sbi	EECR,EEWE
		
		ret

EERead:	
		sbic EECR,EEWE
		rjmp EERead
		out	EEARL, R0
		out	EEARH, R1
		sbi	EECR,EERE
		in temp, EEDR
		ret
