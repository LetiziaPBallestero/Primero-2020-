; 11) Subrutinas de cálculo
; Escriba la subrutina DIV que calcule el resultado de la división 
; entre 2 números positivos. 
; Dichos números deben pasarse por valor desde el programa 
; principal a la subrutina a través de la pila. 
; El resultado debe devolverse también a través de la pila por valor

; NOTA, ESTÁ BIEN, SOLO QUE NO DEVUELVE DE LA PILA. Y NO SÉ PORQUÉ. 
 ORG 1000h
num1 DW 10 ; número a dividir 
num2 DW 2h ; número por el cuál lo divido 
res DW ? ; resultado 
resto DW ? 

 ORG 3000h
DIV: push bx ; salvaguardo los tres registros 
; obtengo el valor de los números 
 mov bx , sp 
 add bx , 4
 mov cx , [bx] ; en cx tengo 2, el dividiendo
; ahora tengo el 2 en cx, voy a por el 10
 mov bx , sp 
 add bx , 6 
 mov ax , [bx] ; en ax tengo 10 (divisor)
; ya tengo todos los datos dónde tengo que tenerlos 
; me fijo que num2 no sea 0 (pues no se puede hacer la resta)
; ni que el dividiendo sea más chico 
 mov dx , 0 ; acá cuento cuantas veces hago la resta
LOOP: cmp AX , CX ; si el dividiendo es menor ( da signo )
 js fin 
 ;ahora hacemos las sucesivas restas para dividir 
 sub ax , cx
 inc dx ; como resté una vez, incremento el contador 
; pregunto si  de nuevo 
 jmp LOOP  
fin: pop bx; tengo la dirección de resto en BX 
 RET

 ORG 2000h
 mov ax , num1 
 push ax 
 mov ax , num2
 push ax
 call DIV
 ;----
 ;el programa debe de retornar mediante la pila el valor de res 
 
 hlt 
END