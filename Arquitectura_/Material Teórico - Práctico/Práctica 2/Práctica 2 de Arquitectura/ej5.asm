; Modificar el programa anterior agregando una subrutina llamada ES_NUM 
; que verifique si el caracter ingresado es realmente un número. 
; De no serlo, el programa debe mostrar el mensaje “CARACTER NO VALIDO”.
; La subrutina debe recibir el código del caracter por referencia desde el
; programa principal y debe devolver vía registro el valor 0FFH en caso
; de tratarse de un número o el valor 00H en caso contrario. 
; Tener en cuenta que el código del “0” es 30H y el del “9” es 39H.

	org 1000h
msj 	db "Daneel Olivaw: Ingrese un numero por favor. "
finmsj  db ?
msjinv 	db "Eso no es un numero, puto"
finmsj2 db ? 
num 	db ?  

	org 3000h 
ES_NUM: cmp byte ptr [bx], 48
		js noes_n ; si no es numero 
		mov al , 57 
		cmp al , [bx] ; bx tiene la direccion del caracter 
		js noes_n
		mov al , 0FFh ; si es digito 
		jmp fin 
noes_n: mov al , 00h ; si no es 
fin: ret 
	
	org 2000h
	; muestro el mensaje de que me ponga numerito
	mov bx , offset msj
	mov al , offset finmsj - offset msj
	int 7
	; lo lee 
	mov bx , offset num ; le paso al bx 
	int 6 
	; me fijo 
	call ES_NUM
	;imprimo 
	cmp al , 00h
	jz print 
	; era un numero 
	mov al , 1 
	int 7 
	jmp fin_p
	; no era un numero 
	print: mov al , offset finmsj2 - offset msjinv
	mov bx , offset msjinv
	int 7 
fin_p: int 0
END 