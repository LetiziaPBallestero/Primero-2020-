	 .data
cad1: .asciiz "hola"
cad2: .asciiz "holA"
result: .word 0

	 .code
	 daddi $a0, $0, cad1 ; 
 	 daddi $a1, $0, cad2 ; 

 	jal compara

	sd $v0, result ($zero)
 	halt

compara: dadd $v0, $0, $0
loop: lbu $t0, 0($a0) ; copia 8 bits (1 byte)
	  lbu $t1, 0($a1) ; copia 8 bits (1 byte)
	  beqz $t0, fin ; $t0 = 0 -> fin 
	  beqz $t1, fin2

	  bne $t0, $t1, fin2 ; t0 =/= t1 -> fin 
 	  daddi $v0, $v0, 1 ; si sí son iguales v0 := v0 + 1 
 	  daddi $a0, $a0, 1 ; a0 := a0 + 1 
	  daddi $a1, $a1, 1 ; a1 := a1 + 1 

	  j loop
fin: bnez $t1, fin2 ; t1 =/= 0 salta 
 	 daddi $v0, $0, -1
fin2: jr $r 