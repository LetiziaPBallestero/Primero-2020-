Program Ejercicio6; 
Const 
     DimF = 50;
Type 
     SubR = 1..DimF; 
     
     Vector = array [SubR] of integer; 
     
     indice = -1 ..DimF; 
{Zona de módulos}

Procedure Llenar_Vector ( Var V : Vector);
Var 
     i : integer; 
Begin 
     for i:=1 to DimF do
         V[i] := i + 1; 
End; 

Procedure Imprimir (V : Vector); 
Var 
     i : integer;
Begin 
     for i:=1 to DimF do 
         Writeln ('Los valores son: ', V[i]);
End; 

Procedure BusquedaDicotomica (v: vector; ini,fin: indice; dato: integer; var pos: indice);
Var 
     Medio : indice; 
begin 
     if (ini > fin) then 
         pos := -1 
     else begin 
         Medio := (ini + fin) div 2; 
         if (Dato = V[Medio]) then 
             pos := medio 
         else 
             if (dato < V[Medio]) then 
                 BusquedaDicotomica (v, ini, medio-1, dato , pos)
             else 
                 BusquedaDicotomica (v , medio + 1 , fin , dato , pos);
     end; 
End;
{Programa principal}
Var 
     V : Vector; 
     num : integer; 
     pos : indice; 
Begin 
{info : el programa se hace sin DimL para probar más fácil, en caso de dimL el proceso
de búsqueda dicotómica no queda alterado}
     pos:= -1; 
     
     Llenar_Vector (V);
     Imprimir (V);
     writeln ('********************************************');
     
     writeln ('Ingrese el valor a buscar');
     read (num);
     
     BusquedaDicotomica (V , 1 , DimF , num , pos);
     {en caso de querer usar DimL, ahí se le cambia DimF a DimL}
     writeln ('El valor ',num,'se encuentra en la posición', pos);
     readln ();
End.
