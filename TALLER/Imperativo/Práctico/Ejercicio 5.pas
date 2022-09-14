Program Ejercicio_5;
Const 
     DimF = 4;
Type 
     SubR = 1..DimF;
     Vector = array [SubR] of integer;
{ ---------------- ZONA DE MÓDULOS ---------------- }
{ --- Punto a: Genere un vector de 20 enteros --- }
Procedure Leer (Var n : integer); 
Begin
     writeln ('Ingrese un número');
     read (n);
End; 

Procedure Cargar_Vec (Var V : Vector);
Var 
     i : integer; 
     n : integer; 
Begin
     For i:=1 to DimF do Begin 
         Leer (n);
         V[i]:= n;
     end; 
End;

Procedure Imprimir (V : Vector);
Var 
     i : integer;
Begin
     for i:=1 to DimF do 
         write (V[i], '-');
End;
{ --- Punto b: Módulo recursivo que busque el máximo del vector --- }
Procedure Maximo (V : Vector ; i : integer ; Var max : integer);
Begin
	 if (i <= DimF) then begin 
		 if (V[i] > max) then begin 
			 max := V[i]; 
		 end; 
		 Maximo (V , (i+1) , max);
	 end; 
End;
{ --- Punto c: Módulo recursivo que sume todos los valores del vector --- }
Function Suma (V : Vector ; i : integer) : integer;
Begin
     if (i <=DimF ) then 
         Suma := V[i] + Suma (V , (i+1))
     else 
		 suma := 0; // así considero el caso base // 
End;

{ ---------------- PROGRAMA PRINCIPAL ---------------- }
Var 
     V : Vector;  
     max : integer;
Begin
     max := -999;
     Cargar_Vec (V) ;
     writeln ('Se imprimira la carga de vectores');
     Imprimir (V);
     writeln ('***********************************************');
     Maximo (V , 1 , max );
     writeln ('El valor maximo es: ', max);
     writeln ('***********************************************');
     writeln ('La suma de todos los elementos del vector es: ', Suma (V, 1));
End.
