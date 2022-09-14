		.data
 valor1: .word 16
 valor2: .word 4
 result: .word 0
		.text
		ld $a0, valor1($zero)
		ld $a1, valor2($zero)
		jal a_la_potencia
		sd $v0, result($zero)
		halt

a_la_potencia: daddi $v0, $zero, 1
lazo: slt $t1, $a1, $zero; compara $a1 con $zero y si $a1 < $zero $t1 = 1
	bnez $t1, terminar; si $t1 =/= 0 ,salta
	daddi $a1, $a1, -1
	dmul $v0, $v0, $a0
	j lazo
terminar: jr $ra