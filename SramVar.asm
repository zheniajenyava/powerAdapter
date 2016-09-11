.dseg
varBeginRunSystem: 		.byte 1
varBeginRunSystem2: 		.byte 1
varBeginRunDumpTempRegist: 		.byte 1

varDisplaySystem: .byte 1
varDisplayStTime0: .byte 1
varDisplayStTime1: .byte 1
varDisplayCurTime0: .byte 1
varDisplayCurTime1: .byte 1
varSegmentDisplay: .byte 1


varProcessDataDigit1D: .byte 1
varProcessDataDigit2D: .byte 1
varProcessDataDigit3D: .byte 1
varProcessDataDigit4D: .byte 1

varProcessDataDigit1B: .byte 1
varProcessDataDigit2B: .byte 1
varProcessDataDigit3B: .byte 1
varProcessDataDigit4B: .byte 1

varButton1System: .byte 1
varButton1StTime0: .byte 1
varButton1StTime1: .byte 1
varButton1CurTime0: .byte 1
varButton1CurTime1: .byte 1
varButton1Status: .byte 1


varButton2System: .byte 1
varButton2StTime0: .byte 1
varButton2StTime1: .byte 1
varButton2CurTime0: .byte 1
varButton2CurTime1: .byte 1
varButton2Status: .byte 1
varButton2Count: .byte 1
varButtonStatus: .byte 1

varPwmDeep: .byte 1
varPwmONDel: .byte 1
varPwmONOFF: .byte 1

varButton1PressTime: .byte 1

positionMenu: .byte 1


DIGIT1: .byte 1
DIGIT2: .byte 1
DIGIT3: .byte 1
DIGIT4: .byte 1


varSmallPwmSystem: .byte 1
varSmallPwmStTime0: .byte 1
varSmallPwmStTime1: .byte 1
varSmallPwmStTime2: .byte 1
varSmallPwmCurTime0: .byte 1
varSmallPwmCurTime1: .byte 1
varSmallPwmCurTime2: .byte 1
varSmallPwmOff: .byte 1
varSmallPwmOn: .byte 1
varSmallPwmOnOff: .byte 1
varSmallPwmCurOnOff: .byte 1
varSmallPwmState: .byte 1

varTimerSec: .byte 1
varTimerMin: .byte 1
varTimerHour: .byte 1
varTimerOnOff: .byte 1

varBlinkDisplaySystem: .byte 1
varBlinkDisplayStTime0: .byte 1
varBlinkDisplayStTime1: .byte 1
varBlinkDisplayCurTime0: .byte 1
varBlinkDisplayCurTime1: .byte 1
varBlinkDisplaySegments: .byte 1
varBlinkDisplayFlags: .byte 1

varClockSec: .byte 1
varClockMin: .byte 1
varClockHour: .byte 1
varClockSystem: .byte 1
varClockStTime0: .byte 1
varClockStTime1: .byte 1
varClockCurTime0: .byte 1
varClockCurTime1: .byte 1

varUniversalShow2DigitTime0: .byte 1
varUniversalShow2DigitTime1: .byte 1

varUniversalShowMemoryPower: .byte 1

varClockEnableHour1: .byte 1
varClockEnableMin1: .byte 1
varClockEnableON1: .byte 1

varClockEnableHour2: .byte 1
varClockEnableMin2: .byte 1
varClockEnableON2: .byte 1

varClockDisableHour1: .byte 1
varClockDisableMin1: .byte 1
varClockDisableON1: .byte 1

varClockDisableHour2: .byte 1
varClockDisableMin2: .byte 1
varClockDisableON2: .byte 1


varButton3System: .byte 1
varButton3StTime0: .byte 1
varButton3StTime1: .byte 1
varButton3CurTime0: .byte 1
varButton3CurTime1: .byte 1
varButton3Status: .byte 1

varRealTimeClockHour: .byte 1
varRealTimeClockMin: .byte 1
varRealTimeClockSec: .byte 1
varRealClockSystem: .byte 1
varRealClockStTime0: .byte 1
varRealClockStTime1: .byte 1
varRealClockCurTime0: .byte 1
varRealClockCurTime1: .byte 1

varRealClockPORTBMin: .byte 1
varRealClockPORTDMin: .byte 1
varRealClockPORTBHour: .byte 1
varRealClockPORTDHour: .byte 1

varRealClockPortB_0: .byte 1
varRealClockPortD_0: .byte 1
varRealClockPortB_1: .byte 1
varRealClockPortD_1: .byte 1
varRealClockPortB_2: .byte 1
varRealClockPortD_2: .byte 1
varRealClockPortB_3: .byte 1
varRealClockPortD_3: .byte 1


varRealTimeDelimiter1000Hz0: .byte 1
varRealTimeDelimiter1000Hz1: .byte 1

varShow2DigitTimePortB_0: .byte 1
varShow2DigitTimePortD_0: .byte 1
varShow2DigitTimePortB_1: .byte 1
varShow2DigitTimePortD_1: .byte 1
varShow2DigitTimePortB_2: .byte 1
varShow2DigitTimePortD_2: .byte 1
varShow2DigitTimePortB_3: .byte 1
varShow2DigitTimePortD_3: .byte 1

varPowerOff:				.byte 1

varPwmDeepDump: .byte 1
varPwmONDelDump: .byte 1
varPwmONOFFDump: .byte 1
varSmallPwmSystemDump: .byte 1
varSmallPwmStTime0Dump: .byte 1
varSmallPwmStTime1Dump: .byte 1
varSmallPwmStTime2Dump: .byte 1
varSmallPwmOffDump: .byte 1
varSmallPwmOnDump: .byte 1
varSmallPwmOnOffDump: .byte 1
varSmallPwmCurOnOffDump: .byte 1
varSmallPwmStateDump: .byte 1
varTimerSecDump: .byte 1
varTimerMinDump: .byte 1
varTimerHourDump: .byte 1
varTimerOnOffDump: .byte 1


varBuzzerSystem: .byte 1
varBuzzerStTime0: .byte 1
varBuzzerStTime1: .byte 1
varBuzzerCurTime0: .byte 1
varBuzzerCurTime1: .byte 1
varBuzzerDurationCurTime0: .byte 1
varBuzzerDurationCurTime1: .byte 1
varBuzzerDurationCurTime2: .byte 1
varBuzzerDurationEndTime0: .byte 1
varBuzzerDurationEndTime1: .byte 1
varBuzzerDurationEndTime2: .byte 1

varCurSumAdc0: .byte 1
varCurSumAdc1: .byte 1
varCurSumAdc2: .byte 1
varEndSumAdc0: .byte 1
varEndSumAdc1: .byte 1
varEndSumAdc2: .byte 1
varCurrentPower0: .byte 1
varCurrentPower1: .byte 1
