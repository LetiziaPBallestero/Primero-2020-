           .data
A:        .word  2
B:        .word  1
C:        .word  5
D:        .word  0
;
;
                  .text
                  ld     r1, a(r0)
                  ld     r2, b(r0)
                  ld     r3, c(r0)
                  daddi r4 , r0 , r0  

                  bne    r1, r2, no_igual ; A =/= B ?
                  daddi  r4, r0, 1 ; si es igual d = 1

    no_igual:    bne    r1, r3, no_igual2 ; A =/= C?
                 daddi  r4, r4, 1 ; si es igual d := d + 1 
                  J      fin ; salto a fin 

    no_igual2:    bne    r2, r3, fin ; C =/= B? 
                  daddi  r4, r0, 1

          fin:    beqz   r4, listo ; si d = 0 voy a listo
                  daddi  r4, r4, 1 ; d := d + 1 

        listo:    SD     r4, D(r0)
                  halt
