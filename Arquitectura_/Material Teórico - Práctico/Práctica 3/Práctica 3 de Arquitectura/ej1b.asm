;  Uso de las luces y las llaves a través del PIO. Ejecutar los programas 
; bajo la configuración P1 C0 del simulador, 
; que conecta las llaves al puerto PA del PIO y a las luces al puerto PB.

; Escribir un programa que verifique si la llave de más a la izquierda 
; está prendida. Si es así, mostrar en pantalla el mensaje
; “Llave prendida”, y de lo contrario mostrar “Llave apagada”. 
; Solo importa el valor de la llave de más a la izquierda 
; (bit más significativo). Recordar que las llaves se manejan con las
; teclas 0-7. 

org 1000H ; memoria de datos 
 prendida db "la llave esta prendida"
 apagada db "la llave esta apagada"
 fin_estado db ? 
 
 CA equ 32H
 PA equ 30H 

org 2000H
 mov al, 0ffH
 out CA, al 
 in al, PA 
 and al , 80H 
 
 cmp al , 0 
 jz estado_apagada 

 mov bx , offset prendida
 mov al , offset apagada - offset prendida 
 jmp fin 
 
estado_apagada: mov bx , offset apagada
 mov al , offset fin_apagada - offset apagada 
 
fin: int 7 ; imprimir 

 hlt 
END