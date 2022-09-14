ORG 1000h ; memoria de datos 
  A DW 5h
  B DW 6h
  C DW 2h
  D DW ? 
ORG 3000h ; memoria de subrutinas
Calculo: mov ax, A
  add ax, B
  sub ax, C
  mov D, ax 
  ret ; retorna 
ORG 2000h ; memoria de programa 
  call Calculo
hlt 
end 