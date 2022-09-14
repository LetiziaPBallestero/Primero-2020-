; actualiza cada 10 segundos el tiempo pasado.
; con minutos incuidos 
; esto tiene que verse en msx y no en vonsim ... peeeeero msx es horrible

; equ = constantes , yay zona de constantes 
EOI  equ 20h
IMR  equ 21h
mask equ 11111101b ; para activar el timer 0 = activado 
TIMER equ 25h
idtimer equ 25
cont equ 10h
comp equ 11h


 org 1000h ; aca basicamente arme mi reloj 
min1  db 30h
min2  db 30h
puntitos db ":"
seg1  db 30h
seg2  db 30h
salto db 0Dh
finR db 0

flag db 0


 org 3000h 
timerSR: cmp seg1, 35h ; comparo si llego a 60 
 jz compMin2 ; salto y comparo y si no ... 
 inc seg1 ; aumento el primer segundo 
 jmp imprimir ; salto a imprimir 

compMin2: cmp min2, 39h ; comparo si llego 
 jz compMin1 
 inc min2
 mov seg1 , 30h
 jmp imprimir

compMin1: cmp min1, 35h
 jz fin 
 inc min1
 mov min2 , 30h
 mov seg1 , 30h
 
imprimir: mov al, offset finR - offset min1
 int 7

;reinicio la cuenta
 mov al , 0
 out cont , al ; reinicio el reloj cont 
 jmp seguir
 
fin: mov flag , 1

seguir: mov al, EOI
 out EOI, al
 iret


 org 100
     dw timerSR ; voy a la rutina al llamar a la interrupcion

; programa principal 
 org 2000h
 cli ; deshabilito interrupciones 
 
 mov al , mask ; muevo máscara a AL para mandarla al IMR 
 out IMR , al ; ahora habilité el timer 
 mov al , idtimer ; muevo la dirección del timer 
 out TIMER , al ; lo mando 
 mov al , 1 ; para que mande cada 1 clk
 out comp , al
 mov al , 0 ; que arranque en 0 
 out cont , al
 mov bx , offset min1
 
 sti ; habilito interrupciones 

count: cmp flag, 1
jnz count ; interrupción 

int 0
end