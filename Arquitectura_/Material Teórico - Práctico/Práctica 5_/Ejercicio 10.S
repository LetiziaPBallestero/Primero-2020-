				.data
frase: 			.asciiz 'me quiero morir' ; ascii que termina en zero 
vocales: 		.asciiz 'AEIOUaeiou' ;  las vocales 
result: 		.word 0 ; el resultado 
			
				.code
				daddi $a1, $0, frase ; puntero a frase
				daddi $sp, $sp, 0x0400 ; puntero a la pila

        		dadd $v1, $0, $0 ; en $v1 voy a contar la cantidad de vocales
				jal cuenta_vocal; primer llamado a subrutina

				sd $v1, result($0) ; $v1 tiene la cantidad de vocales guardo 

				halt

cuenta_vocal:	lbu $a0, 0($a1)  ; carga caracter de frase en $a0
				beqz $a0, final ; si el carácter es 0, va al final 
				daddi $sp, $sp, -8 ; espacio para salvar en la pila $ra ( sp - 8 )
				sd $ra, 0($sp) ; (push)  salvo push 

				jal es_vocal ; llamado a la segunda subrutina

				ld $ra, 0($sp) ; cargo ra 
				daddi $sp, $sp, 8 ; (pop) ; hago pop de los datos 
				beqz $v0, no_vocal ; s v0 es 0, es porque no tenía vocales 
				daddi $v1, $v1, 1 ;cuenta una vocal

no_vocal:		daddi $a1, $a1, 1; apunta al que sigue en frase

				j cuenta_vocal

final:			jr $ra

es_vocal:		dadd $v0, $0, $0 ; v0 = 0 
				daddi $t0, $0, 0 ; t0 = 0 

loop: 			lbu $t1, vocales($t0) ; copio una vocal 
				beqz $t1, fin_vocal ; si la vocal es 0, salto a fin_vocal 
				beq $a0, $t1, si_es_voc ; en a0 tengo el carácter, en t1 la vocal, las comparo 
				daddi $t0, $t0, 1 ; paso a la siguiente vocal 
				j loop  ; así hasta examinar todas 

si_es_voc: 	daddi $v0, $0, 1 ; si es vocal, en v0 (contador) sumo 1
fin_vocal: 	jr $ra ;  regreso 