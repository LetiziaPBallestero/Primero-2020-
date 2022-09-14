;  Uso de las luces y las llaves a través del PIO. Ejecutar los programas 
; bajo la configuración P1 C0 del simulador, 
; que conecta las llaves al puerto PA del PIO y a las luces al puerto PB.

; * Escribir un programa que encienda las luces con el patrón 11000011,
; o sea, solo las primeras y las últimas dos luces deben prenderse, 
; y el resto deben apagarse. 

org 1000h ; memoria de datos 
 patron db 11000011b 
 CB equ 33h ; configurar las luces 
 PB equ 31h ; puerto de luces 

org 2000h
 mov al , 0 
 out CB , al ; pongo todo en 0 CB 
 mov al , patron 
 out PB , al 
hlt 
END