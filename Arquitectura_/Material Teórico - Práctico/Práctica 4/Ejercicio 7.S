                       .data
          Tabla:       .word   1,4,5,6,6,8,2,2,9,10
          Res:         .word   0,0,0,0,0,0,0,0,0,0 ; 0 si x <= X ó 1 si x > X 
          X:           .word   4 ; elemento a igualar
          Long:        .word  10 ; longitud de la tabla 
          Cant:        .word   0 ; dónde se almacena el resultado
                       
                       .code    
                       ; cargo los valores 
                  LD    R1, Long(R0) ; r1 = 10 
                  LD    R2, X(R0) ; r2 = 4 
                  DADD  R3, R0, R0 ; base de la tabla 
                  DADD  R5, R0, R0 ; contador 
                  DADDI R8, R0, 1

         SIGO:    LD    R4, Tabla(R3) ; cargo la tabla en r3 + tabla
                  SLT   R6, R4, R2 ; si r4 MENOR r2 , o sea, mi elemento de la tabla es MENOR que 4, R6 = 1  
                  BNEZ  R6, ES_MENOR ; si R6 =/= 0 , salto! a es_menor 
                  DSUB  R7, R4, R2 ; resta el valor de la tabla con el valor en X (4)
                  BEQZ  R7, ES_MENOR ; si esa resta es = 0 salta a es menor 
                  SD    R8, Res(R3) ; como no es igual, carga el valor de r8 (1) en RES 
                  DADDI R5, R5, 1 ; r5 := r5 +  1 

      ES_MENOR:   DADDI R3, R3, 8 ; voy al siguiente valor en la tabla 
                  DADDI R1, R1, -1 ; queda 1 menos en la tabla , le resto 1 a longitud 
                  BNEZ  R1, SIGO ; s i aún tengo elementos, sigo 

                  SD    R5, Cant(R0) ; guardo lo que fui acumulando en r5 en Cant

                  HALT
