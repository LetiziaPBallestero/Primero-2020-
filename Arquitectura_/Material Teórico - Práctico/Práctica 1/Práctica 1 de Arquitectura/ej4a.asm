; memoria de datos 
org 1000h
  A DW 5h
  B DW 6h
  C DW 2h
  D DW ?
; memoria de programa 
org 2000h
  mov ax, A ; pongo A en el registro  
  add ax, B ; sumo B a A 
  sub ax, C ; le resto C ...
  mov D, ax ; todo lo guardo en D 
hlt 
end
