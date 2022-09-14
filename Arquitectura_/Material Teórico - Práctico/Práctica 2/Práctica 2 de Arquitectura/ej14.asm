; Implementar un reloj similar al utilizado en los partidos de básquet,
; que arranque y detenga su marcha al presionar sucesivas
; veces la tecla F10 y que finalice el conteo al alcanzar los 30 segundos.

; constantes 
timer equ 10H
pic   equ 20H
eoi   equ 20H
n_clk equ 10
n_f10 equ 20

org 40 ; ( 10 * 4 )
ip_clk dw rut_clk

org 80 ; (20 * 4 ) dónde está la f10
ip_f10 dw rut_f10

; memoria de datos 
org 1000H
seg db 30H ; decena 
    db 30H ; unidad 
fin db ? 

; memoria de rutinas 

org 3000H
rut_clk: push ax ; se guarda el valor de ax xq se va a usar el registro
 inc seg+1 
 cmp seg+1 , 3AH
 jnz reset 
 mov seg+1 , 30H 
 inc seg
 cmp seg, 33H
 jnz reset
 mov dl , 1 ; pongo el true el flag de la finalizacion
 mov al , 0FFH ; deshabilito las interrupciones del IMR 
 out pic+1 , al 
reset: mov al , 2 ; el contador tiene 2 carácteres 
 int 7; se imprime e lvalor actual 
 mov al , 0 ; se vuelve a cero el contador del timer 
 out timer , al 
 mov al , eoi ; se finaliza la atención de la interrupcion
 out pic , al 
 pop ax ; se recupera el valor que contenia ax al entrar en la rutina 
 iret ; regreso de la interrupcion 
 
org 3500H
rut_f10: push ax ; se guarda el valor de ax, porque se va a usar en el registro
 in al , pic+1 ; recupero el valor actual del IMR 
 xor al , 00000010B ; y cambio la linea correspondiente al TIMER
 out pic+1 , al ; pic +1 es el timer 
 mov al , eoi ; se finaliza la atención de la interrupcion 
 out pic , al 
 pop ax ; recupera el valor que contenía ax al entrar en la rutina 
 iret 
 
org 2000H
 CLI ; desactivo 
 mov al , 0FEH
 out pic+1 , al ; pic : registro IMR 
 mov al , n_f10
 out pic+4 , al ; pic : registro int0 f 10 
 mov al , n_clk
 out pic+5 , al ; pic : registro int1 , timer 
 mov al , 1
 out timer+1 , al ; timer + 1 es el registro comp 
 mov al , 0 
 out timer , al ; timer : registro cont 
 mov bx , offset seg ; direccion del contador 
 mov dl , 0 
 STI ; activo interruociones 
 
lazo: cmp dl , 0 
 jz lazo 
 
Int 0
END