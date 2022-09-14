; Escribir un programa que efectúe la suma de dos números 
; (de un dígito cada uno) ingresados por teclado y muestre el
; resultado en la pantalla de comandos. 

; Recordar que el código de cada caracter ingresado no coincide 
; con el número que
; representa y que el resultado puede necesitar ser expresado con 2 dígitos.

 org 1000h
msj db "Daneel Olivaw: Ingrese un numero"
salto db 13
fin db ? 

 org 1500h
num1 db ? 
num2 db ? 
res_D db "0" ;decena del resultado
res_U db ? ; unidad del resultado 

 org 2000h
 ; demanda un numero 
 mov bx , offset msj
 mov al , offset fin - offset msj 
 int 7 
 
 mov bx , offset num1 ;leo el primer numero 
 int 6 ; leo el primero numero y lo guardo en num 1
 
 mov bx , offset msj 
 int 7 ; imprimo de nuevo 
 
 mov bx , offset num2
 int 6 ; lo mismo pero con el segundo numero 
 
 mov al , num2 ; copio el segundo caracter leído en AL 
 sub al , 30h ; le resto 30 para quedarme con el valor del numero 
 add al , num1 ; le sumo el primero caracter leído 
 cmp al , 3Ah ; si queda un  valor entre 30h y 39h, la suma NO supero 9
 ; entonces la uniidad esta lista
 ; y la decena también ya que comienza con valor 0
 
 JS num_ok ; si no hay signo, salto a ok
 
 sub al , 10 ; si hay signo (valor myor a 39h)
 ; entonces le resto 10 para obtener la unidad
 
 inc res_D ; se suma 1 a la decena (paso de 0 a 1)
 
num_ok: mov res_U , al ; copio el valor de la unidad a res_u
  mov bx , offset res_D ; a partir de la dirección de res_d 
; se imprime 2 caracteres
  mov al , 2 
  int 7
int 0 
END 
