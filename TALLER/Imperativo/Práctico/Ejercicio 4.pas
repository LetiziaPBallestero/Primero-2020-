Program Ejercicio4; 
Const 
     Fin = 0; 
Type 
     Lista = ^Nodo; 
     Nodo = record
         dato : integer; 
         sig : Lista; 
     end; 
{ ----------------------------- ZONA DE MÓDULOS ----------------------------- }
{ --- Punto a: generar una lista de enteros --- }
Procedure Leer (Var n : integer);
Begin
     writeln ('Ingrese un número: ');
     read (n);
End;

Procedure Agregar_Adelante (Var L : Lista ; n : integer);
Var 
     aux : Lista;
Begin 
     new (aux);
     aux^.dato := n; 
     aux^.sig := L; 
     L := aux;
End;

Procedure Generar_Lista (Var L : Lista);
var 
     num : integer;
Begin
     Leer (num);
     While (num <> 0) do Begin
         Agregar_Adelante (L, num);
         Leer (num);
     end; 
End; 

Procedure Imprimir_Lista (L : Lista); 
begin 
	 writeln ('Los números introducidos fueron: ');
     while (L <> nil ) do begin
         writeln (L^.dato);
         L:= L^.sig;
     end;
End;

{ --- Punto b: Recursividad para el mínimo valor de la lista}
Function Minimo (L : Lista ; min : integer) : integer; 
Var 
	 aux : integer;
begin
     If (L = nil) then
         aux := min 
     else
         if (L^.dato < min) then 
             aux := Minimo (L^.sig , L^.dato)
         else 
             aux := Minimo (L^.sig , min);
     Minimo := aux;
End;

{ --- Punto c: Recursividad para el máximo valor de la lista}
Function Maximo (L : Lista ; max : integer) : integer; 
begin
     if (L = nil) then 
         Maximo := max
     else
         if (L^.dato > max) then 
             Maximo := Maximo (L^.sig , L^.dato)
         else 
             Maximo := Maximo (L^.sig, max);
End;

{ --- Punto d: Recursividad v si está, f si no}
Function Buscar (L : Lista ; n : integer) : boolean; 
begin  
	 if (L <> nil) then
		 if (L^.dato <> n) then
		     buscar := buscar(l^.sig, n)
		 else
			 buscar := true
	 else 
		 buscar := false;
End; 

{ --------------------------- PROGRAMA PRINCIPAL --------------------------- }
Var 
     L : Lista; 
     Mini : integer;
     Maxi : integer; 
     NUM : integer;
Begin
     L := nil;
     Mini := 9999;
     Maxi := -9999;
     Generar_Lista (L);
     Imprimir_Lista (L);
     writeln ('***********************************************************');
     writeln ('El valor mínimo es: ', Minimo (L,Mini));
     writeln ();
     writeln ('El valor máximo es: ', Maximo (L, Maxi));
     writeln ('***********************************************************');
     writeln ('Ingresar el numero a buscar: ');
     read (NUM);
     writeln ('El resultado de la búsqueda del numero fue: ', Buscar (L, NUM));
End.
