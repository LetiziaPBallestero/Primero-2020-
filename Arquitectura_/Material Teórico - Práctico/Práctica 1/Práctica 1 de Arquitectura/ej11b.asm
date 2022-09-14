;Escriba la subrutina RESTO que calcule el resto de la división entre 
; 2 números positivos.
; Dichos números deben pasarse por valor desde el programa principal 
; a la subrutina a través de registros. 
; El resultado debe devolverse también a través de un registro por referencia

 ORG 1000H
num1 DB 6h ; cl 
num2 DB 4h ; ch

 ORG 3000H
resto: mov al, 0 ; inicializa el resto en 0 
 mov dh , 0 ; inicializo el cociente de la división
 cmp ch , 0 ; ch tiene num 2 
 jz fin

DIV: sub cl , ch 
 js RES ; si el resultado es negativo, voy a calcular el resto 
 inc dh ; sumo al cociente
 jmp DIV 
 
RES: add cl , ch ; sumo de vuelta ch para det. el resto
 mov al , cl ; devuelvo el resto en ax 

fin: ret

 ORG 2000H
 mov cl , num1
 mov ch , num2
 call resto 
 hlt
END