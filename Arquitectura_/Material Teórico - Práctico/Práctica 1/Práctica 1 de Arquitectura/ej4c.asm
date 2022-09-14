ORG 1000h ; memoria de datos 
  A DW 5h
  B DW 6h
  C DW 2h
  D DW ? 
ORG 3000h ; memoria de subrutinas
Calculo: mov dx, ax
  add dx , bx
  sub dx, cx
  ret
ORG 2000h ; memoria de programa
  mov AX, A 
  mov BX, B
  mov CX, C
  call Calculo
  mov D, dx
  hlt
end