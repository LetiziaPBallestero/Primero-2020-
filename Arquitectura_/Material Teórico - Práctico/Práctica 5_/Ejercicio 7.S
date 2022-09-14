		.data 
	tabla: .word 1 , 2 , 3 , 4 , 5 , 6 , 7
	cant:  .word 7 
	num:   .word 2 
	c:     .word 0 
		.code 
		dadd r2, r0, r0 ; r2 = 0 
		daddi r4, r0, tabla ; cargo en r4 la tabla 

		ld r5, num(r0)
		ld r6, cant(r0)
; hago la pila 
		daddi r29, r0, 0x400 ; dónde arranca la pila r29 = $sp
		daddi r29, r29, -24 ; push de r29 y como es una dirección son 3 registros? 

		sd r4, 16(r29) ; cargo r4 en la posición 16 a partir de sp - 24 
		sd r5, 8(r29) ; cargo r5 en la posición 8 a partir de sp - 24 
		sd r6, 0(r29) ; cargo r3 en la posición 0 a partir de sp - 24 
; aaaaaaaaa
		jal busca

		sd r2, c(r0)
		halt
busca:  ld r5, 16(r29) ; cargo los datos en los registros 
		ld r5, 8(r29)
		ld r6, 0(r29)

buscaNumero: ld r8, (r4) ; puntero de la tabla 
		slt r9, r8, r5 ; r9 = 1 SI r9 < r8 
		bnez r9, listo ; si r9 = 1 entonces ... 
		dsub r9, r8, r5
		beqz r9, listo
		daddi r2, r2, 1 
listo:  daddi r4, r4, 8 ; ... r4:= r4 + 8 (vamos al siguiente elemento de la tabla)
		daddi r6, r6, -1 ; r6 := r6 -1 (1 menos en la tabla, vamos al siguiente )
		bnez r6, buscaNumero ; si r6 =/= 0, volvemos a buscar 
		jr r31