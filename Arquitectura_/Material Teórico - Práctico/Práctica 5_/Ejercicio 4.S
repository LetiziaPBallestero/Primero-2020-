	.data 
inf: .double 18.5
nor: .double 25.0
sob: .double 30
peso: .double 75.7 ; kg 
altura: .double 1.73 ; m 
IMC: .double 0.0
estado: .word 0 

	.code 
; carga de datos 
	L.D f2, altura (r0) ; f1 = altura 
	L.D f1, peso (r0) ; f2 = peso 

	L.D f3, inf(r0) 
	L.D f4, nor(r0)
	L.D f5, sob(r0)
	
; cálculo 
	mul.d f6, f2, f2 ; f6 = f5 * f5  , altura * altura 
	div.d f7, f1, f6 ; f8 = peso / altura^2
 
	c.lt.d f3, f7; if inf < imc (f7) fp = 1 
	bc1f Infrapeso ; if fp = 0 , salta 

	c.lt.d f4, f7 ; if normal < imc fp = 1 
	bc1f Normal ; 

	c.lt.d f5, f7 ; 
	bc1f Sobrepeso

	c.le.d f5,f7 ; f5 <= f7
	bc1t Obeso
; etiquetas
Infrapeso: s.d f7, IMC(r0)
	daddi r1, r0, 1
	sd r1 , estado(r0)
	j fin 

Normal: s.d f7, IMC(r0)
	daddi r1, r0, 2
	sd r1, estado(r0)
	j fin

Sobrepeso: s.d f7, IMC(r0)
	daddi r1, r0, 3 
	sd r1, estado(r0)
	j fin

Obeso: s.d f7, IMC(r0)
	daddi r1, r0, 4
	sd r1, estado(r0)

fin: halt