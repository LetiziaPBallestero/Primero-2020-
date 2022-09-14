	.data 
A:  .byte 2 ;cuantas veces voy a iterar
X:  .byte 5 
Y:  .byte 3 

	.code
; while a > 0  x = x + y  a-- 
LD r14 , A(r0) ; A en r14
LD r1 , X(r0) ; X en r1 
LD r31 , Y(r0) ; Y en r31 
; while r14 > 0  r1 = r1 + 31 ; r14 -- 

loop: slt r10 , r0 , r14 ; r10 = 1 si r0 < r14 ... r10 = 1 si 0 es MENOR que A (=2)

	  beqz r10 , fin ; si r10 = 0 ( o sea, que no r0 no es menor que r14 voy a fin) terminé de iterar 

	  daddi r14 , r14 , -1  ; la cantidad de veces que itero, le resto uno 
	  dadd r1 , r1 , r31  ; x := x + y

	  j loop 

fin: SD r1 , X(r0) ; guardo en X lo calculado 
halt