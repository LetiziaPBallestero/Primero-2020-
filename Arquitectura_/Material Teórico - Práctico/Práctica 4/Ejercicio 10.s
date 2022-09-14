                       .data
             cadena:   .asciiz  "abcdefghajaja"
             car:      .asciiz  "a"
             cant:       .word   0
                                 
                         .code    
                  DADD   R1, R0, R0 ; inicializo r1 
                  DADD   R2, R0, R0 ; inicializo r2 mi contador 
                  LBU    R3, car(R0) ; copia solo 8bitsdesde la dirección , en este caso desde car. O sea, solo copia un carácter. 

         ARRIBA:  LBU    R4, cadena(R1) ; copio un carácter  a r4 

                  BEQZ   R4, FIN; r4 = 0 , salto a fin 

                  DSUB   R5, R4, R3 ; r5 = cadena - caracter (a) -> me fijo si el carácter de la cadea es el caracter que busco
                  BNEZ   R5, DISTINTOS ; r5 <> 0 ? son distintos, salto a distinto , son iguales ...
                  DADDI  R2, R2, 1 ; r2 := r2 + 1 

      DISTINTOS:  DADDI  R1, R1, 1 ; r1 := r1 + 1  -> voy al siguiente carácter 

                  J      ARRIBA

            FIN:  SD r2 , cant(r0)
            HALT
