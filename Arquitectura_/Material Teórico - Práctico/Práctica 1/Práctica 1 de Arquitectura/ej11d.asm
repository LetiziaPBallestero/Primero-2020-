; Escribir un programa que calcule la suma de dos números de 32 bits ç
; almacenados en la memoria llamando a una subrutina SUM32,
; que reciba los parámetros de entrada por valor a través de la pila, 
; y devuelva el resultado también por referencia a través de la pila.

 ORG 1000h
num1 dw 9234h
     dw 1111h
num2 dw 9234h
     dw 2222h


 ORG 3000h
sum32: push bx ; salva el viejo bx en 7ff9h y 7ff8h
  mov bx , sp ; bx = sp = 7ff8h salva el sp 
; ahora recupera los datos de la pila 
  add bx , 6 ; bx:=7FF8H+0006H=7FFEH apunta a dir NUM1 en la pila
  mov  ax , [bx] ; ax:=1000H dir NUM1
  sub bx , 2 ; bx ahora apunta a la dirección de num 2 
  mov cx , [bx]
; realiaz la suma con todo lo que eso implica ... 
  MOV BX , AX ; BX=AX=1000H
  MOV AX , [BX] ; AX:=9234H parte baja NUM1
  ADD BX , 2 ; BX:=1000H+0002H=1002H dir parte alta NUM1
  MOV DX , [BX] ; DX:=1111H parte alta NUM1
  MOV BX , CX ; BX:=1004H dir NUM2
  MOV CX , [BX]
  ADD BX , 2 ; BX:=1004H+0002H=1006H dir parte alta NUM2
  ADD AX , CX
  ADC DX , [BX] ; DX:=1111H+2222H+1=3334H
  
  POP BX ; Recupera viejo BX para el retorno
  RET
  
  ORG 2000H
  MOV AX, OFFSET num1 ; AX:=1000H dirección de NUM1
  PUSH AX ; Apila AX en 7FFFH y 7FFEH
  MOV AX, OFFSET num2 ; AX:=1004H dirección de NUM2
  PUSH AX ; Apila AX en 7FFDH y 7FFCH
; mete en la pila todos los datos 
  CALL sum32
  HLT
END