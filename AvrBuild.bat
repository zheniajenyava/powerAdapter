@ECHO OFF
"C:\Program Files (x86)\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "C:\Users\user\Project\PowerBp\labels.tmp" -fI -W+ie -C V2E -o "C:\Users\user\Project\PowerBp\PowerBp.hex" -d "C:\Users\user\Project\PowerBp\PowerBp.obj" -e "C:\Users\user\Project\PowerBp\PowerBp.eep" -m "C:\Users\user\Project\PowerBp\PowerBp.map" "C:\Users\user\Project\PowerBp\PowerBp.asm"
