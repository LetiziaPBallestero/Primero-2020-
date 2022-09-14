
        .data
TABLA:  .word 5, 6, 7, 6, 1, 34, 101, 24, 999, 0

R:      .word 0

        .code
        daddi $a0, $0, TABLA
        daddi $sp, $sp, 0x400 ; puntero a la pila
        xor $v0, $v0, $v0
        jal n_impares
        sw $v0, R($0)
        halt

n_impares:
        lw $a1, 0($a0)
		beqz $a1, final
		daddi $sp, $sp, -8
		sd $ra, 0($sp)
		jal es_impar
		ld $ra, 0($sp)
		daddi $sp, $sp, 8
		dadd $v0, $v0, $v1
        daddi $a0, $a0, 8
		j n_impares
final:	jr $ra

es_impar:
        andi $v1, $a1, 1
        jr $ra