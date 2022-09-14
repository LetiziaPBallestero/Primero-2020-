Program Libreria;
Const 
     DimF_1 = 6; {Responde a la estructura del primer punto}
     DimF_2 = 30; {Responde a la estructura de b}
Type 
     Rango_1 = 1..DimF_1;
     Rango_2 = 1..DimF_2;
     
     Producto = record
         cod : integer;
         rubro : Rango_1;
         precio : real;
     end;
    
     Lista = ^Nodo;
     Nodo = record 
         dato : Producto; 
         sig : Lista; 
     end; 

     Vector_1 = Array [Rango_1] of Lista; 
     Vector_2 = Array [Rango_2] of Producto;
{ ------------------ ZONA DE MÓDULOS ------------------ }
{ ---- Punto a : cargar el vector de listas ---- }
Procedure Leer_Producto (Var P : Producto);
begin
     Writeln ('Introducir el código del producto:');
     Readln (P.cod);
     If (P.cod <> -1) then begin 
         Write ('Código de rubro:');
         Readln (P.rubro);
         Write ('Precio:');
         Readln (P.precio);
     end;
End;

Procedure Insertar_Ordenado (Var L : Lista ; P : Producto);
Var 
     aux , act , ant : Lista; 
begin
     new (aux);
     aux^.dato := P; 
     ant := L;
     act := L;
     while ((act <> nil) and (L^.dato.cod < act^.dato.cod)) do begin 
         ant := act; 
         act := act^.sig; 
     end; 
     if (ant = act) then 
         L := aux
     else 
         ant^.sig := aux;
     aux^.sig := act;
End;

Procedure Inicializar_Vector_1 (Var V : Vector_1);
Var
     i : Rango_1;
begin
     for i:=1 to DimF_1 do 
         V[i]:= nil; 
End; 

Procedure Cargar_Vector_1 (Var V : Vector_1);
Var 
     P : Producto;
begin
     Inicializar_Vector_1 (V);
     Leer_Producto (P);
     While (P.cod <> -1) do begin
         Insertar_Ordenado (V[P.cod], P);
         Leer_Producto (P);
     end; 
End;
Procedure Imprimir_V1 (V : Vector_1);
Var 
     i : Rango_1; 
Begin 
     for i:=1 to DimF_1 do Begin
         writeln ('Rubro', i, ':');
         while (V[i] <> nil) do Begin
             writeln ('Codigo producto:', V[i]^.dato.cod ) ;
             writeln ();
             V[i]:= V[i]^.sig;
         end; 
     end; 
End;
{ ---- Punto b : cargar de la lista 3---- }
Procedure Cargar_Vector_2 (L : Lista ; Var V2 : Vector_2 ; Var DimL : integer);
Begin 
     DimL := 0 ; 
     while ((L <> nil) and (DimL < 30 )) do begin
         DimL := DimL + 1; 
         V2[DimL] := L^.dato;
         L := L^.sig; 
     end; 
End;
{ --- Punto c : Ordenar el vector 2 por precio }
Procedure Ordenar (Var V : Vector_2 ; DimL : integer);
Var 
     i : integer;
     anterior : integer;
     act : Producto; 
Begin 
	for i:= 2 to DimL do begin 
         act := V[i];
         anterior := i-1;
         while (anterior > 0) and (V[anterior].precio > act.precio) do begin
             V[anterior +1] := V[anterior];
             anterior:= anterior - 1;
         end;
         V[anterior+1]:= act;
	end;
End;
{ --- Punto d : imprimir el vector ordenado}
Procedure Imprimir_V2 (V2 : Vector_2 ; DimL : integer); 
Var 
     i : integer;
begin
     For i:=1 to DimL do 
         writeln ('Producto número' , i, 'precio:' , V2[i].precio:2:2);
End;
{ ------------------ PROGRAMA PRINCIPAL ------------------ }
Var 
     V1 : Vector_1;
     V2 : Vector_2;
     DimL : integer;
begin
     Writeln ('Comenzará la carga de los productos');
     Cargar_Vector_1 (V1);
     Writeln ('Finalizó la carga de los productos y ahora se mostrarán los mismos');
     Imprimir_V1 (V1);
     Writeln ('Se cargará automáticamente la lista 3 hasta - a lo sumo - 30 elementos');
     Cargar_Vector_2 (V1[3], V2, DimL);
     Writeln ('Ahora se mostrará SIN ordenar:');
     Imprimir_V2 (V2 , DimL);
     Writeln ('Ahora se ordenará ... ');
     Ordenar (V2 , DimL);
     writeln ('Ahora se mostrará ordenado:');
     Imprimir_V2 (V2, DimL);
     writeln ('El programa ha finalizado');
End.
