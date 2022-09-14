; * Escribir un programa para imprimir la letra “A” utilizando la impresora a través de la PIO
; Ejecutar en configuración 1

ORG 1000H; Memoria de datos
char db "A"
PA EQU 30h
PB EQU 31h
CA EQU 32h
CB EQU 33h

ORG 2000H ; Prog principal
mov al, 01h ; strobe salida (0), busy entrada (1)
out CA, al
mov al, 0 ; puerto de datos todo salida
out CB, al
; inicializo strobe en 0
in al, PA
and al, 11111101b
out PA, al
; espero que busy=0

poll: in al, PA
and al, 01h ; 1000 0000

jnz poll



; se que busy es 0, mandar caracer
mov al, char
out PB, al

; mandar flanco ascendente de strobe
in al, PA
or al, 00000010b
out PA, al
nop ; esperamos un poco que imprima
nop ; esperamos un poco que imprima
nop ; esperamos un poco que imprima
nop ; esperamos un poco que imprima
nop ; esperamos un poco que imprima
nop ; esperamos un poco que imprima

HLT
END