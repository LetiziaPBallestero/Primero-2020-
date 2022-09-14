	org 1000h
pri db 01h

	org 2000h
mov bx , offset pri 
mov al , 1 

	mov bx , offset pri
	mov al , 1
imprimir: int 7
          inc pri 
          mov bx , offset pri 
          cmp byte ptr [bx] , 80h
          jnz imprimir
          int 0 
END