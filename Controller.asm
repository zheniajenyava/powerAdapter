Run:
	lds temp, varBeginRunSystem
	cpi temp, 1
	BRNE Run10Hz
;	saveRegist
	rcall Inc_All
	rcall Check_All
	rcall Fuc_All
;	loadRegist
	rcall UnRun
Run10Hz:
	lds temp, varBeginRunSystem2
	cpi temp, 1
	BRNE Run
;	saveRegist		
	rcall Hz10Actions
;	loadRegist
	rcall UnRun10Hz		
	rjmp Run

EnRun:	
	sts varBeginRunDumpTempRegist, temp
	ldi temp, 1
	sts varBeginRunSystem, temp
	lds temp, varBeginRunDumpTempRegist
	ret

UnRun:	
	clr temp
	sts varBeginRunSystem, temp
	ret

EnRun10Hz:	
	sts varBeginRunDumpTempRegist, temp
	ldi temp, 1
	sts varBeginRunSystem2, temp
	lds temp, varBeginRunDumpTempRegist
	ret

UnRun10Hz:		
	clr temp
	sts varBeginRunSystem2, temp
	ret


Inc_All:
		rcall prButton3Inc
		rcall prButton2Inc
		rcall prButton1Inc
		rcall prDisplayInc
		rcall prSmallPwmInc
		rcall prBlinkDisplayInc
		rcall prCLockInc
		rcall prRealClockInc
		rcall prBuzzerInc
		ret
Check_All:
		rcall prButton3TimeCheck
		rcall prButton2TimeCheck
		rcall prButton1TimeCheck
		rcall prDisplayTimeCheck
		rcall prSmallPwmTimeCheck
		rcall prBlinkDisplayTimeCheck
		rcall prClockTimeCheck
		rcall prRealClockTimeCheck
		rcall prBuzzerTimeCheck
		ret
Fuc_All:
		rcall prDisplayFunc
		rcall prButton1Func
		rcall prButton2Func
		rcall prButton3Func
		rcall prSmallPwmFunc
		rcall prBlinkDisplayFunc
		rcall prClockFunc
		rcall prRealClockFunc
		rcall prBuzzerFunc
		ret

