; Escribir un programa que calcule la suma de dos números de 32 bits 
; almacenados en la memoria sin hacer llamados a subrutinas, resolviendo 
; el problema desde el programa principal.
 ORG 1000h
num1 DW 9234h
     DW 1111h
num2 DW 9234h
     DW 2222h
     
 ORG 2000h
 mov ax , num1 ; AX = la parte baja de num1
 mov cx , num2 ; CX es igual a la parte baja de num2
 mov dx , num1+2 ; la parte alta 
 mov bx , num2+2 ; la parte alta 
 add ax , cx ; ax = ax + bx suma parte baja 
 adc dx , bx ; dx = dx + bx + carry 
 hlt 
END

; el resultado de la suma queda almacenado en dx ax ( 32 bits)
; aquí y en el resto del ejericcio consideramo que la parte alta de la suma 
; no genera carry 