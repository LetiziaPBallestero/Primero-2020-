dato equ 40h ; el hand, el dato 
estado equ 41h ; el busy 

org 1000h
msj db "Ingenieria e informatica"
fin db ? 

org 2000h

in al , estado ; consulta el estado de la impresora 
and al , 07fh ; 0111 1111
out estado , al ; config. la impresora 

mov bx , offset msj 
mov cl , offset fin - offset msj 

poll: in al , estado 
      and al , 1 ; con esto nos fijamos que la impresora no esté ocupada
      jnz poll ; si está en 1 , significa que está busy en 1 
      
      ; salio de ese loop, así que mando el carácter (o inicio)
      mov al , [bx]
      out dato , al ; le mando a la impresora mi carácter a impr.
      
      inc bx ; sig. carácter 
      dec cl ; decremento 
      jnz poll

int 0
end