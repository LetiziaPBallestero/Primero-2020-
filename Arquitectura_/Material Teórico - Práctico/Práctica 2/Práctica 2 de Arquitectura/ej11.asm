;  Escribir un programa que permita seleccionar una letra del abecedario al azar.
; El código de la letra debe generarse en un registro que incremente 
; su valor desde el código de A hasta el de Z continuamente. 

; La letra debe quedar seleccionada al presionarse la tecla F10 
; y debe mostrarse de inmediato en la pantalla de comandos.

; equ = constante 
EOI equ 20h
IMR equ 21h 
MASK equ 11111110b ; la mascara que le voy a poner 
INT0 equ 24h
DIR equ 24

 org 1000h
letra db "A"

 org 3000h
;rutina de interrupción
int 7 
push ax
mov al , EOI
out EOI , al
pop ax
iret 

 org 96
 dw 3000h 

 org 2000h
 

org 2000h
; coonfiguraremos el PIC 
 cli 
 
 mov al , MASK
 out IMR , al 
 
 mov al , DIR ;configuro la int 0 
 out INT0 , al 

 mov bx , offset letra ; configuro la int 7 
 mov al , 1 
 
 sti 
 
loop: cmp letra , 90 
 jz reloop
 inc letra
 jmp loop ; hasta que aprete f10 
reloop: mov letra , 65 
 jmp loop 
 
 int 0 
END