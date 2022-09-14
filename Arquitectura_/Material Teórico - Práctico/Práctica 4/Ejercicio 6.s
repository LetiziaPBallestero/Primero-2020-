           .data
A:        .word  3
B:        .word  3
C:        .word  3
D:        .word  0
;
;
                  .text
                  LD     R1, A(R0)
                  LD     R2, B(R0)
                  LD     R3, C(R0)
                  daddi r4 , r0 , r0  

                  BNE    R1, R2, NO_IGUAL1 ; A =/= B ?
                  DADDI  R4, R0, 1 ; si es igual d = 1

    NO_IGUAL1:    BNE    R1, R3, NO_IGUAL2 ; A =/= C?
                  DADDI  R4, R4, 1 ; si es igual d := d + 1 
                  J      FIN ; salto a fin 

    NO_IGUAL2:    BNE    R2, R3, FIN ; C =/= B? 
                  DADDI  R4, R0, 1

          FIN:    BEQZ   R4, LISTO ; si d = 0 voy a listo
                  DADDI  R4, R4, 1 ; d := d + 1 

        LISTO:    SD     R4, D(R0)
                  HALT
