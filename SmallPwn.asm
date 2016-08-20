.cseg
prSmallPwnInit:
ldi servPrTemp0, 1
ldi servPrTemp1, 0
ldi servPrTemp2, 0
STS varProcessDataStTime0, servPrTemp0
STS varProcessDataStTime1, servPrTemp1
STS varProcessDataStTime2, servPrTemp2
ret

prSmallPwnLoad:
ldi servPrTemp0, 0x01
STS varProcessDataSystem, servPrTemp0
RCALL prSmallPwnInit
ret


prSmallPwnInc:
LDS servPrTemp0, varProcessDataSystem
ANDI servPrTemp0, 0x01
CPI servPrTemp0, 0x01
BRNE prSmallPwnIncRet
LDS servPrTemp0, varProcessDataCurTime0
LDS servPrTemp1, varProcessDataCurTime1
LDS servPrTemp2, varProcessDataCurTime2
LDI servPrTemp3, 0x01
LDI servPrTemp4, 0x00
ADD servPrTemp0, servPrTemp3
ADC servPrTemp1, servPrTemp4
ADC servPrTemp2, servPrTemp4
STS varProcessDataCurTime0, servPrTemp0
STS varProcessDataCurTime1, servPrTemp1
STS varProcessDataCurTime2, servPrTemp2
prSmallPwnIncRet:
ret


prSmallPwnTimeCheck:

LDS servPrTemp6, varProcessDataSystem

ANDI servPrTemp6, 0x01

CPI servPrTemp6, 0x01

;BRNE prSmallPwnTimeCheckRet
;LDS servPrTemp0, varProcessDataCurTime0
;LDS servPrTemp1, varProcessDataCurTime1
;LDS servPrTemp2, varProcessDataCurTime2
;LDS servPrTemp3, varProcessDataStTime0
;LDS servPrTemp4, varProcessDataStTime1
;LDS servPrTemp5, varProcessDataStTime2
;CP  servPrTemp0, servPrTemp3
;BRNE prSmallPwnTimeCheckRet
;CP  servPrTemp1, servPrTemp4
;BRNE prSmallPwnTimeCheckRet
;CP  servPrTemp2, servPrTemp5
;BRNE prSmallPwnTimeCheckRet
;LDS servPrTemp0, varProcessDataSystem
;ORI servPrTemp0, 0b00000010
;STS varProcessDataSystem, servPrTemp0
prSmallPwnTimeCheckRet:
ret




prSmallPwnUnload:
reti

prSmallPwnFunc:
LDS servPrTemp0, varProcessDataSystem
ANDI servPrTemp0, 0x02
CPI servPrTemp0, 0x02
BRNE prSmallPwnFuncEt

clr temp
STS varProcessDataCurTime0,temp
STS varProcessDataCurTime1,temp
STS varProcessDataCurTime2,temp

lds prTemp0, varProcessDataSystem
andi prTemp0, 0b11111101
STS varProcessDataSystem, prTemp0

in temp, PORTB
andi temp, 0b00000010
cpi temp, 0b00000010
breq t3
rjmp t4
t3:
cbi PORTB,1
reti 
t4:
sbi PORTB,1

prSmallPwnFuncEt:
ret
