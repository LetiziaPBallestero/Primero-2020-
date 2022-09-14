; Escribir un programa que solicite el ingreso de un número (de un dígito) 
; por teclado y muestre en pantalla dicho número expresado en letras.
; Luego que solicite el ingreso de otro y así sucesivamente. 
; Se debe finalizar la ejecución al ingresarse en dos vueltas consecutivas el número cero. 

 org 1000h
numeros db "Cero  " ; Todos los nombres tienen 6 caracteres para
        db "Uno   " ; facilitar posicionarnos al imprimir 
        db "Dos   " ; el nombre del numero
        db "Tres  "
        db "Cuatro"
        db "Cinco "
        db "Seis  "
        db "Siete "
        db "Ocho  "
        db "Nueve "
msj db "Numero "
fin db ?

 org 1500h
num db ? ; este es el numero que ingreso  

 org 2000h
 mov cl , 0 ; cuento las veces que ingresa el valor 0 de forma consecutiva
otro: mov bx , offset msj
      mov al , offset fin - offset msj ; así le meto las letras
      int 7 ; imprimo el mensaje pidiendo el numero 
 ; ingreso ese numero
      mov bx , offset num 
      int 6 ; y se guarda en num
      
      cmp num , 30h ; o sea, si no es cero 
      jnz no_cero
      
      inc cl ; si vino el valor 0 , incremento el contador que cuando da 2, corta
      jmp seguir 
      
no_cero: mov cl , 0 ; como no vino un valor 0, inicializo nuevamente cl
seguir: mov bx , offset numeros ; la dirección base sera la del primer mensaje
; luego se posicionara al inicio del mensaje adecuado, por eso pusimos 6
         mov al , 6 ; se imprimen 6 caract.

loop: cmp num , 30h 
      jz imprime ; si es el valor adecuado imprimo en la pantalla el nombre del numero
      add bx , 6 ; si no es el valor adecuado, me posiciono en el siguiente nombre
      dec num ; al llegar a NUM = 0 estara posicionado en el nombre correspondiente
      jmp loop 
 ; salta de elemento en elemento del arreglo por el numero ingresado 
imprime: int 7 ; lo imprimo 
       cmp cl , 2 ; si cl = 2 es xq ingrese dos ceros
       jnz otro ; sino, salto a otro 
 int 0 
END