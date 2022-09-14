	org 1000h
msj_i db "Daneel: Ingrese clave  "
salto  db 13
finmsj_i db ?

clave db "1301"
finclave db ?

ifok db "A c c e s o  p e r m i t i d o"
finok db ?

notok db "A c c e s o  d e n e g a d o. puto"
finnot db ?

leido db 0

	org 3000h
leer_clave: cmp al, 0 ; si no es 0 , sigo pidiendo  
	jz finleer
repet: int 6
	inc bx ; va al segundo 
	dec al ; decrementa la cantidad 
	cmp al , 0
	jnz repet
finleer: ret

comparar_2: cmp al , ah
	jnz diferentes
	mov al , 0FFh
	jmp fin_comp
diferentes: mov al , 00h
fin_comp: ret


Comparar: cmp ah , 0 ;  voy a recibirlas por pila 
	jz son_diferentes
	push bx ; salvo 
	push cx ; salvo 
	push dx ;salvo 
	mov bx , sp

	add bx , 8 ; primera direccion 
	mov cx , [bx]

	add bx , 2  ; segunda direccion 
	mov dx , [bx]

repeatComparar: push ax  ; recupero caracteres 
	mov bx , cx
	mov ah , [bx]
	mov bx , dx
	mov al , [bx]
	call comparar_2

	cmp al , 0FFH ; voy a verificiar si son iguales ; 
	pop ax  ; recpero caracteres
	
	jnz son_diferentes
; voy al siguientes ; 
	inc cx
	inc dx
	dec ah
	cmp ah , 0
	jnz repeatComparar

	mov al, 0FFh
	jmp finllave
	
son_diferentes: mov al , 00h
finllave: pop dx
	pop cx
	pop bx
	ret


	org 2000h
;iniicio 
	mov bx , offset msj_i
	mov al , offset finmsj_i - offset msj_i
	int 7
; leo la clave 
	mov bx , offset leido
	mov al , 4
	call leer_clave
; veo si esta bien o no 
	mov ax , offset clave
	push ax
	mov ax , offset leido
	push ax
	mov ah , offset finclave - offset clave
	call Comparar

	cmp al , 0FFh
	jnz dif 
	
	mov bx , offset ifok
	mov al , offset finok - offset ifok
	int 7
	jmp FINPROGRAMA

	dif: mov bx , offset notok
	mov al , offset finnot - offset notok
	int 7

	FINPROGRAMA: pop ax
	pop ax
	
int 0 
END

