; El simulador no posee una instrucción para multiplicar números.
; Escribir un programa para multiplicar los números
; NUM1 y NUM2, y guardar el resultado en la variable RES

; subrutina pasando parámetros por valor 

; PASAJE DE PARÁMETROS POR REGISTRO
ORG 1000h ; memoria de datos 
  num1 DW 2
  num2 DW 3 
  res DW ? 

ORG 3000H ; memoria de rutinas 
MUL: mov dx, 0
  CMP cl , 0 ; comparo cl con 0
  JZ FIN ; si terminé de multiplicar , salto a FIN -> retorno
  mov ah, 0 ; pongo en 0 la parte alta 
LAZO: add dx, ax  ; sumo en dx lo que tengo en ax 
  dec cl ; decremento cl 
  JNZ LAZO ; si z = 0 SALTO hacia lazo, o sea, hago de nuevo la suma 
FIN: RET
ORG 2000h ; memoria de programa 
  mov al , num1 ; carga AL 
  mov cl , num2 ; carga CL 
  call MUL ; llama a la multiplicación
  mov res, dx ; carga el resultado 
  hlt 
END 
