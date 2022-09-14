;  SWAP Escribir una subrutina SWAP que intercambie dos datos 
; de 16 bits almacenados en memoria. 
; Los parámetros deben ser pasados por referencia desde el
; programa principal a través de la pila.
; Para hacer este ejercicio, tener en cuenta que los parámetros que
; se pasan por la pila son las direcciones de memoria,
; por lo tanto para acceder a los datos a intercambiar se requieren
; accesos indirectos, además de los que ya se deben
; realizar para acceder a los parámetros de la pila.

 ORG 1000H
val1 dw 1234H
val2 dw 5678H

; Recibe las direcciones de dos celdas de memoria a intercambiar 
; M1 y M2 a través de la pila 

 ORG 3000H
SWAP: push bx ; salvaguardo los 3 registros 
 push ax 
 push dx 
; con las siguientes instrucciones obtengo el valor de val 2 
 mov bx , sp ; salvo el SP 
 add bx , 8 ; apunto al segundo parámetro que pasé 
 mov bx , [bx] ; bx tiene la dirección de val2 
 mov cx , [bx] ; cx tiene el valor de val2
; con las siguientes instrucciones obtengo el valor de val 1 
 mov bx , sp 
 add bx , 10 ; apunto al primer parámetro 
 mov bx , [bx]
 mov dx , [bx]
; entonces me quedo val 1 en dx y val 2 en cx 
; ahora tengo que poner el valor de val1 (dx) en val2
 mov bx , sp
 add bx , 8 ; apunto al segundo parámetro 
 mov bx , [bx] ; bx tiene la dirección de memoria de val2
 mov [bx] , dx ; asigno val1 en la dirección de memoria de val2
; ahora tengo que poner el valor val2 en la dirección de val1
 mov bx , sp 
 add bx , 10 ; apunto al primer parámetro 
 mov bx , [bx] ; bx tiene la dirección de memoria de val2
 mov [bx] , cx ; asigno val2 en la dirección de memoria de val1
; ahora restauro los 3 registros 
 pop dx 
 pop ax 
 pop bx 
 
 RET

 ORG 2000H 
 mov ax , offset val1 
 push ax ; le mando val 1 a la pila 
 mov ax , offset val2 
 push ax ; le mando val 2 a la pila 
 call SWAP 
 hlt
END 
