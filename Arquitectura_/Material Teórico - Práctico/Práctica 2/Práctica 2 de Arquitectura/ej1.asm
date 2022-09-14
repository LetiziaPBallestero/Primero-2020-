 org 1000h
msj db "Hola soy un mensaje"
    db "Y yo soy Letizia"
fin db ? 
 
 org 2000h
 mov bx , offset msj 
 mov al , offset fin-offset msj ; cuanto me mide el mensaje 
 int 7
 int 0 
 hlt 
END
