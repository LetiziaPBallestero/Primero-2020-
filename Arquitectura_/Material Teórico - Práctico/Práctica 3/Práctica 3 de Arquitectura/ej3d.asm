; handshake , polling e interrupciones 
; ingresar 6 caracteres e imprimirlos 

; constantes
eoi equ 20h
imr equ 21h
int2 equ 26h
handid equ 10
dato equ 40h ; hand 
estado equ 41h

; variables 
org 1000h
cant_caracteres dw 6
mensaje         db "6 caracteres"
fin_mensaje     db ? 
normal          db "mismo orden"
fin_normal      db 13
alreves         db "alreves"
fin_alreves     db 13 
string          db 0 ; ??

; subrutina 
org 3000h

; recibe en bx la dir de comienzo para guardar
; en al la cantidad de caracteres a leer
leer: cmp al , 0 
      jz fin_leer
repetir: int 6
         inc bx 
         dec al 
         jnz repetir
fin_leer: ret 

poll:   in al, estado
        and al, 01h
        jnz poll
ret

org 2000h 
; imprimir 
mov bx , offset mensaje 
mov al , offset fin_mensaje - offset mensaje
int 7 

; leer lo ingresado 
mov bx , offset string 
mov al , cant_caracteres 
call leer
;hace salto de línea yupi 
mov word ptr [bx] , 13 

;; arrancamos la parte de la impresión - configuramos 
in al , estado
and al , 07fh 
out estado , al 

;; aviso 
mov bx , offset normal 
mov al , offset fin_normal - offset normal 
inc al 
int 7 

;; imprimir normal 
mov bx , offset string 
mov cl , cant_caracteres
inc cl ; por el salto de línea 


imprimir_normal: cmp cl , 0 
                 jz imprimir_alreves 
                 call poll 
                 mov al , [bx]
                 out dato , al 
                 dec cl 
                 inc bx 
                 jmp imprimir_normal
                 
imprimir_alreves: mov bx , offset alreves 
                  mov al , offset fin_alreves - offset alreves
                  int 7 

                  mov bx , offset string 
                  add bx , cant_caracteres 
                  dec bx ; para que no arranque del salto de linea 
                  mov cl , cant_caracteres
                  
imrpimirAAAlreves: cmp cl , 0 
                   jz fin 
                   call poll 
                   mov al , [bx]
                   out dato , al 
                   dec cl 
                   dec bx 
                   jmp imrpimirAAAlreves
fin: int 0 
end