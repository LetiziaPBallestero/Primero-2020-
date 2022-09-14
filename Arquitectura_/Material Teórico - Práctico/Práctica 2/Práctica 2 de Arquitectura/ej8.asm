; Escribir un programa que efectúe la resta de dos números 
; (de un dígito cada uno) ingresados por teclado y muestre el
; resultado en la pantalla de comandos. 
; Antes de visualizarlo el programa debe verificar si el resultado es positivo 
; o negativo y anteponer al valor el signo correspondiente.

	org 1000h
msj db "Daneel Olivaw: Ingrese un numero"
salto db 13
fin db ? 

 org 1500h
num1 db ? 
num2 db ? 
simb  db "-"
res  db ? 

	org 2000h
 ; demanda un numero 
 mov bx , offset msj
 mov al , offset fin - offset msj 
 int 7 
 ; pongo numero 
 mov bx , offset num1 ;leo el primer numero 
 int 6 ; leo el primero numero y lo guardo en num 1
 ; demando numero 
 mov bx , offset msj 
 int 7 ; imprimo de nuevo 
 ; pongo numero 2 
 mov bx , offset num2
 int 6 ; lo mismo pero con el segundo numero 
 
 ;corrijo los dos numeros 
 sub num1 , 30h
 sub num2 , 30h
 
 ;realizo la resta 
 mov ah , num1 ; muevo el numero 
 sub ah , num2 ; le resto el numerito 2 
 mov res, ah ; y dejo todo en resultados 
 
 ;veo si es negativo 
 cmp res , 0
 js poner_sig 
 
 ;imprimo solo el caracter 
 mov al , 1 ; el caracter a imprimir 
 mov bx , offset res
 jmp preparar ; si no es negativo salto a preparar
 
poner_sig: xor res , 0FFh 
	add res , 1 ; xq esta en ca2

	mov al , 2 ; xq imprimo dos caracteres 
	mov bx , offset simb ; y le pongo el - adelante
	
preparar: add res , 30h ; esto siempre se hace, así que por eso esta aca

	int 7 ; no importa como llego, pero llego  

	int 0 
END
