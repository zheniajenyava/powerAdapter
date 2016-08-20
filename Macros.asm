.MACRO outi			
LDI 	R16,@1 			
OUT 	@0,R16 	
.ENDM

; ********************************************************

.MACRO initPr
ldi servPrTemp0, @0
ldi servPrTemp1, @1
STS @2, servPrTemp0
STS @3, servPrTemp1
ret
.ENDM

; ********************************************************

.MACRO initPr3
ldi servPrTemp0, @0
ldi servPrTemp1, @1
ldi servPrTemp2, @2
STS @3, servPrTemp0
STS @4, servPrTemp1
STS @5, servPrTemp2
ret
.ENDM

; ********************************************************

.MACRO setPrCurTime3
initPr3 @0,@1,@2,@3,@4,@5
.ENDM

; ********************************************************

.MACRO isLoadPr
LDS servPrTemp1, @0
LDI servPrTemp0, 0xFF
ANDI servPrTemp1, 0x01
CPI servPrTemp1, 0x01
BREQ @1
LDI servPrTemp0, 0x00
@1: 
MOV servPrTemp1, servPrTemp0
ret
.ENDM

; ********************************************************

.MACRO loadPr
ldi servPrTemp0, 0x01
STS @0, servPrTemp0
RCALL @1
ret
.ENDM

; ********************************************************

.MACRO incPr
LDS servPrTemp4, @0
ANDI servPrTemp4, 0x01
CPI servPrTemp4, 0x01
BRNE @1
LDS servPrTemp4, @2
LDS servPrTemp5, @3
LDI servPrTemp6, 0x01
LDI servPrTemp7, 0x00
ADD servPrTemp4, servPrTemp6
ADC servPrTemp5, servPrTemp7
STS @2, servPrTemp4
STS @3, servPrTemp5
@1:
ret
.ENDM

; ********************************************************

.MACRO incPr3
LDS servPrTemp0, @0
ANDI servPrTemp0, 0x01
CPI servPrTemp0, 0x01
BRNE @1
LDS servPrTemp0, @2
LDS servPrTemp1, @3
LDS servPrTemp2, @4
LDI servPrTemp3, 0x01
LDI servPrTemp4, 0x00
ADD servPrTemp0, servPrTemp3
ADC servPrTemp1, servPrTemp4
ADC servPrTemp2, servPrTemp4
STS @2, servPrTemp0
STS @3, servPrTemp1
STS @4, servPrTemp2
@1:
ret
.ENDM

; ********************************************************

.MACRO timeCheckPr
LDS servPrTemp0, @0
ANDI servPrTemp0, 0x01
CPI servPrTemp0, 0x01
BRNE @1
LDS servPrTemp0, @2
LDS servPrTemp1, @3
LDS servPrTemp2, @4
LDS servPrTemp3, @5
CP  servPrTemp1, servPrTemp3
BRNE @1
CP  servPrTemp0, servPrTemp2
BRNE @1
LDS servPrTemp0, @0
ORI servPrTemp0, 0b00000010
STS @0, servPrTemp0
@1:
ret
.ENDM

; ********************************************************

.MACRO timeCheckPr3
LDS servPrTemp0, @0
ANDI servPrTemp0, 0x01
CPI servPrTemp0, 0x01
BRNE @1
LDS servPrTemp0, @2
LDS servPrTemp1, @3
LDS servPrTemp2, @4
LDS servPrTemp3, @5
LDS servPrTemp4, @6
LDS servPrTemp5, @7
CP  servPrTemp2, servPrTemp5
BRNE @1
CP  servPrTemp1, servPrTemp4
BRNE @1
CP  servPrTemp0, servPrTemp3
BRNE @1
LDS servPrTemp0, @0
ORI servPrTemp0, 0b00000010
STS @0, servPrTemp0
@1:
ret
.ENDM

; ********************************************************

.MACRO FuncPr
LDS XL, @0
ANDI XL, 0x02
CPI XL, 0x02
BRNE @1
.ENDM

; ********************************************************

.MACRO saveRegist
PUSH R16
PUSH R17
PUSH R18
PUSH R19
PUSH R20
PUSH R21
PUSH R22
PUSH R23
PUSH R24
PUSH R25
PUSH R26
PUSH R27
PUSH R28
PUSH R29
.ENDM

; ********************************************************


.MACRO loadRegist
POP R29
POP R28
POP R27
POP R26
POP R25
POP R24
POP R23
POP R22
POP R21
POP R20
POP R19
POP R18
POP R17
POP R16
.ENDM

; ********************************************************

.MACRO unloadPr3
clr servPrTemp0
sts @0,servPrTemp0
sts @1,servPrTemp0
sts @2,servPrTemp0
sts @3,servPrTemp0
reti
.ENDM

; ********************************************************

.MACRO unloadPr
clr servPrTemp0
sts @0,servPrTemp0
sts @1,servPrTemp0
sts @2,servPrTemp0
reti
.ENDM

; ********************************************************
