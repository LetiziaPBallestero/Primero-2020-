; El simulador no posee una instrucción para multiplicar números.
; Escribir un programa para multiplicar los números
; NUM1 y NUM2, y guardar el resultado en la variable RES

;SIN LLAMADO A SUBRUTINA

; PASAJE DE PARÁMETROS POR REGISTRO
ORG 1000h
  num1 DW 2
  num2 DW 3 
  res DW ? 
ORG 2000h
  mov dx, 0 ; inicializo 
  mov al, num1 ; pongo en AL 2 
  CMP al, 0 ; comparo si AL con 0 ... 
  JZ FIN ; si es 0 ( Z= 1) salto a fin, sino, sigo
  mov ah, 0 ; en AH pongo 0 
  mov cl, num2 ; en CL pongo 3, q va ser quien me lleve cuantas veces sumo el numero, o sea, por cuánto lo multiplico

LOOP: CMP cl, 0 ; compara CL con 0  
  JZ FIN; si es 0 blablabla lo mismo de arriba 
  ADD dx, ax ; sumo en dx lo que está en ax 
  DEC cl ; decremento CL
  JMP LOOP ; salto a LOOP 

FIN: mov res, dx
  hlt 
END
