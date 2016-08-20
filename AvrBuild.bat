@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\AVR\AVR\PowerBp\labels.tmp" -fI -W+ie -C V2E -o "C:\AVR\AVR\PowerBp\PowerBp.hex" -d "C:\AVR\AVR\PowerBp\PowerBp.obj" -e "C:\AVR\AVR\PowerBp\PowerBp.eep" -m "C:\AVR\AVR\PowerBp\PowerBp.map" "C:\AVR\AVR\PowerBp\PowerBp.asm"
