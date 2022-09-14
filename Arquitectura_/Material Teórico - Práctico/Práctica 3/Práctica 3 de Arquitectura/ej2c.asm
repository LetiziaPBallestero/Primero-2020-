 ;Escribir un programa que solicita el ingreso de cinco caracteres por teclado y los envía de a uno por
;vez a la impresora a través de la PIO a medida que se van ingresando. No es necesario mostrar los
;caracteres en la pantalla. 

pio equ 30h

org 1000h
num_car db 5 
car db ? 

org 3000h
;subrutina de inicializacion 
; pio para impresora
ini_imp: mov al , 0fdH
 out pio+2 , al 
 mov al , 0 
 out pio+3 , al 
 in al , pio 
 and al , 0fdH
 out pio , al 
 ret 

org 3500H 
;subrutina de generacoin de pulso "strobe"
pulso: in al , pio
 or al , 02H
 out pio , al 
 in al , pio 
 and al , 0fdH 
 out pio , al 
 ret 
 
org 2000H
 push ax
 call ini_imp
 pop ax 
 mov bx , offset car 
 mov cl , num_car
lazo: int 6
poll: in al , pio 
 and al , 1 
 jnz poll
 
 mov al , [bx]
 out pio+1 , al 
 push ax 
 
 call pulso 
 pop ax 
 dec cl 
 jnz lazo
 int 0 
END
 