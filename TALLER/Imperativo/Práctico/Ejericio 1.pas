Program Edificio;
Const
     oficinas = 300; 
Type 
     Rango_oficinas = 1..oficinas; 
     
     Oficina = Record
         cod : integer; 
         dni : integer; 
         exp : real; 
     end; 
     Vector = array [Rango_oficinas] of Oficina; 
// MODULOS //
// --- Punto A: Cargar vector --- // 
Procedure Leer_oficinas (Var R : Oficina); 
Begin 
     writeln ('Ingrese el código de oficina');
     readln (R.cod);
         if (R.cod <> -1) then Begin 
             writeln ('Ingrese el DNI del propietario');
             read (R.dni);
             writeln ('Ingrese el monto de las expensas');
             read (R.exp);
         end
         else
             Writeln (' Se ingresó -1, no se leerán más oficinas, que tenga un buen día');
End; 

Procedure Cargar_Vector (Var V : Vector ; var DimL : integer);
Var 
     R : Oficina;
begin
     writeln ('Inicia la carga del vector. Ingresar las oficinas hasta que se lea el código -1 o hasta el límite (300)');
     Leer_Oficinas (R);
     While ((R.cod <> -1) and (DimL < oficinas)) do begin 
         DimL := DimL + 1; 
         V[DimL] := R; 
         Leer_Oficinas (R);
     end; 
End;
// --- Punto B: Ordenar vector por código de identificación de la oficina --- // 
Function Comparar (R , R2 : Oficina ) : boolean; 
Begin
     Comparar := (R.cod > R2.cod);
End;
Procedure Ordenar (Var V : Vector ; DimL : integer);
Var 
     i, j : integer; 
     Act : integer; 
Begin 
     For i := 2 to DimL do Begin
         Act := V[i].cod;
         J := i + 1; 
         while (j > 0) and (Comparar (V[j].cod , Act)) do begin
             v [j + 1] := V [j];
             j := j - 1; 
         end;
         V [j + 1].cod := Act;
     end; 
End;
// PROGRAMA PRINCIPAL // 
Var
	 DimL : integer;
	 V : Vector; 
Begin
	 DimL := 0; 
	 Cargar_Vector (V, DimL);
     Writeln ('Se cargó el vector');
     Ordenar (V, DimL); 
     Writeln ('Se ordenó el vector');
End.
