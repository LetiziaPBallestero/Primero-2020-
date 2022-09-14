PIC EQU 20H
HAND EQU 50H * ta mal
TIMER EQU 10H
N_TIMER EQU 13
N_F10 EQU 10

ORG 1000H
OK DB "OK!"
FIN DB ?
MAL DB "ALERTA!"
FIN2 DB ?

ORG 52; 13*4
IP_TIMER DW RUT_TIMER

ORG 40; 10*4
IP_F10 DW RUT_F10

ORG 3000H
RUT_TIMER: PUSH AX
           CALL IMPRESORA
           MOV AL,PIC; END OF 
           OUT PIC,AL; INTERRUPT
           POP AX
           IRET

ORG 3500H
RUT_F10: PUSH AX
         MOV DL,1
         MOV AL,PIC; END OF 
         OUT PIC,AL; INTERRUPT
         POP AX
         IRET

ORG 2500H
IMPRESORA: CMP DL,0
           JNZ PERFECTO
           MOV BX,OFFSET MAL
           MOV CL,OFFSET FIN2-OFFSET MAL
           JMP IMPRIMIR
 PERFECTO: MOV BX,OFFSET OK
           MOV CL,OFFSET FIN-OFFSET OK
 IMPRIMIR: IN AL, HAND+1
           AND AL,1; me quedo con bit BUSY
           JNZ IMPRIMIR
           MOV AL,[BX]
           OUT HAND,AL; Imprimo caracter
           INC BX
           DEC CL
           JNZ IMPRIMIR
           MOV DL,0
           MOV AL, 0
           OUT TIMER,AL; Reinicio CONT
           RET


ORG 2000H
CLI 
MOV AL, 0FCH
OUT PIC+1,AL; IMR= 1111 1100
MOV AL,N_F10
OUT PIC+4,AL; INT0=10
MOV AL, N_TIMER
OUT PIC+5,AL; INT1=13
IN AL,HAND+1
AND AL,7FH
OUT HAND+1,AL; BIT7=0 consulta de estado
MOV AL,15
OUT TIMER+1,AL; COMP=15 segs
MOV DL,0
MOV AL,0
OUT TIMER,AL; CONT=0
STI 
LAZO: JMP LAZO
INT 0
END