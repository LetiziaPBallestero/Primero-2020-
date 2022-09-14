Program Teoria1;
Const 
     dimF = 20;
     StopV = 0;
     StopL = 15;
Type 
     Vector = array [1..dimF] of integer;
     
     Lista = ^Nodo; 
     Nodo = record
         Dato : integer;
         Sig : Lista;
     end; 
{Zona de procesos}
// ---- Punto 1 ---- // 
Procedure Carga (Var V : vector ; Var DimL : integer); 
Var 
     num : integer; 
Begin 
     DimL := 0; 
     Writeln ('Introducir un número');
     Readln (num);
     while ((DimL < DimF) and (num <> StopV )) do begin 
         DimL := DimL + 1 ;
         V[DimL] := num; 
         Writeln ('Introducir un número');
         Readln (num);
     end; 
End;
// ---- Punto 2 ---- //
Procedure Imprimir (V : Vector ; DimL : integer); 
{Se usa un proceso porque no devuelve nada al programa principal}
Var 
     i : integer;
Begin 
     for i:= 1 to DimL do 
         writeln ('En la posición', i , 'se cargo el', v[i] );
End;
// ----- Punto 3 ---- // 
Function Posicion ( V : vector ; num : integer ; DimL : integer) : integer; 
{uso una función para buscarlo, si no lo encuentro regreso -1}
Var 
     aux : integer; 
Begin
     aux := 1 ; 
     while ((aux <= DimL) and (v[aux] <> num)) do
         aux := aux + 1;
     if (aux > DimL) then 
         aux := -1 ;
     {pregunto si el auxiliar es mayor para retornar -1, en caso de que no lo sea, quedó con la posición}
     Posicion := aux; 
End; 
Procedure Eliminar ( Var V : Vector ; Var DimL : integer; num : integer);
Var 
     Pos , i : integer; 
Begin 
     Pos := Posicion (V, num , DimL);
     if  (Pos = -1) then 
         writeln ('No se encontró el elemento a eliminar');
     else {significa que si está el elemento} 
     begin 
         for i := Pos to DimL-1 do {desde el número hasta casi el final hacemos los corrimientos}
             v[i] := v[i+1];
         DimL := DimL - 1 ; {achico el vector}
         writeln ('Se eliminó con éxito');
     end; 
End;
// ---- Punto 4 ---- // 
Procedure Armar_Nodo (Var aux : Lista);
Var 
     num : integer; 
Begin 
     num := Random (16); {Genero números entre 0 y 15}
     if (num <> StopL) then begin
         new (aux);
         aux^.dato := num;
         aux^.sig := nil;
     end
     else 
         aux := nil;
End;
Procedure Agregar_Atras (Var Pri, Ult : Lista ; nodo : lista);
//fijarme//
Begin 
	If (Pri = nil) then 
         pri := nodo
     else 
         ult^.sig := nodo; 
     ult := nodo; 
End; 
Procedure Generar_Lista (Var L : lista);
Var 
     nodo, ult : lista; 
Begin 
     Armar_Nodo (nodo); 
     while (nodo <> nil) do begin  
         Agregar_Atras (L, ult, nodo);
         Armar_Nodo (nodo);
     end; 
end; 
// ----Programa principal ---- // 
Var 
     v : vector; 
     DimL : integer; 
     num : integer; 
     L : lista; 
Begin 
     randomize; 
     Carga ( V , DimL); 
     Imprimir (V , DimL);
     Writeln ('Introducir el número a eliminar');
     Readln (num);
     Eliminar (V , DimL , num);
     Generar_Lista (L);
End.
