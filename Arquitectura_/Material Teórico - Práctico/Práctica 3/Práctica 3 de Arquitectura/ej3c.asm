; HANDSHAKE E INTERRUPCIÓN 

; Escribir un programa que imprime “UNIVERSIDAD NACIONAL DE LA PLATA” 
; en la impresora a través del HAND-SHAKE. 
; La comunicación se establece por interrupciones emitidas 
; desde el HANDSHAKE cada vez que la impresora se desocupa.

; constantes 
eoi equ 20h
imr equ 21h
int2 equ 26h
dato equ 40h
estado equ 41h

; vector de interrupciones
org 16 ; 4 * 4 
dir_impr dw 3000h

;variables
org 1000h
cad db "Universidad nacional de La Plata"
fin db ? 

;subrutinas
org 3000h
imp: mov al , [bx] ; manda el char 
     out dato , al 
     inc bx 
     dec cl 
     jnz volver 
     ;desactivo inst xq ya imprimí mi caracter y no quiero que 
     ; este mecanismo me vuelva a interrumpir
     mov al , 0ffh
     out imr , al 

volver: mov al , 20h
        out eoi , al 
iret 
; programa princiapl 
org 2000h
cli 
;conf el pic 
mov al , 0fbh ; 1111 1011
out imr , al 
mov al , 4 ; ID = 4 
out int2 , al 
;;;;;
in al , estado 
or al , 80h ; 1000 0000
out estado , al 
;;;;;
mov bx , offset cad
mov cl , offset fin - offset cad

sti 

loop: cmp cl , 0
      jnz loop
     
 int 0 
 hlt 
 END 