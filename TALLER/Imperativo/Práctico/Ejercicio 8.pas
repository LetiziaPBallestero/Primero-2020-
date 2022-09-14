Program Ejercicio_8;
Const 
     Fin = 0;
Type 
     Arbol = ^Nodo; 
     
     Nodo = record 
         dato : integer; 
         hi : Arbol; 
         hd : Arbol; 
     end; 
{ ----------------------- ZONA DE MÓDULOS ----------------------- }
{ --- Punto a : modulo que lea y almacene en un abb --- }
Procedure Armar_Nodo (Var A : Arbol ; num : integer);
Begin 
     if (A = nil) then begin 
         new (A); 
         A^.dato := num; 
         A^.hi := nil; 
         A^.hd := nil; 
     end 
     else 
         if (num < A^.dato) then 
             Armar_Nodo (A^.hi , num)
         else 
             if (num >  A^.dato) then 
                 Armar_Nodo (A^.hd,num);
End;

Procedure Leer (Var num : integer); 
Begin 
     writeln ('Ingrese un numero');
     num := Random (50);
     // read (num);
End; 

Procedure Armar_Arbol (Var A : Arbol);
Var 
     num : integer;
Begin 
	 Randomize;
     Leer (num);
     while (num <> 0) do begin 
         Armar_Nodo (A , num);
         writeln ('Se agrego el numero ',num,' al arbol');
         Leer (num);
     end; 
End; 

Procedure Imprimir_A1 (A : Arbol);
Begin 
     if (A <> nil) then Begin
         Imprimir_A1 (A^.hi);
         writeln (A^.dato);
         Imprimir_A1 (A^.hd);
     end; 
End; 

{ --- Punto b1: nº más grande --- }
Function Maximo (A : Arbol): integer; 
Begin 
     if (A = nil) then 
         Maximo := -9
     else 
         if (A^.hd = nil) then 
             Maximo := A^.dato
         else 
             Maximo := Maximo (A^.hd);
End;
{ --- Punto b2: nº más chico --- }
Function Minimo (A : Arbol): integer; 
Begin 
     if (A = nil) then 
         Minimo := 999
     else 
         if (A^.hi = nil) then 
             Minimo := A^.dato
         else 
             Minimo := Minimo (A^.hi);
End;
{ --- Punto b3 : cantidad de elementos --- }
Function Cantidad (A : arbol) : integer;
Begin 
     if (A = nil) then 
         Cantidad := 0
     else 
         Cantidad := 1 + Cantidad (A^.hi) + Cantidad (A^.hd); 
End;
{ --- Punto b4 : creciente --- }
Procedure Creciente (A : Arbol);
Begin 
     if (A <> nil) then Begin
         Creciente (A^.hi);
         writeln(A^.dato);
         Creciente (A^.hd);
     end; 
End; 
{ --- Punto b5 : pares decreciente --- }
Procedure Pares_Decrecientes (A : Arbol);
Begin 
     if (A <> nil) then begin 
         Pares_Decrecientes (A^.hd);
         if ((A^.dato MOD 2) = 0) then 
			 writeln (A^.dato);
         Pares_Decrecientes (A^.hi);
     end; 
End; 
{ ----------------------- PROGRAMA PRINCIPAL ----------------------- }
Var 
     A : Arbol; 
Begin 
     Armar_Arbol (A);
     writeln ('El arbol quedo de esta manera'); 
     Imprimir_A1 (A);
     writeln ('*********************************');
     writeln ('El elemento mas grande es: ',Maximo (A));
     writeln ('El elemento mas chico es: ',Minimo (A));
     writeln ('La cantidad de elementos es de: ', Cantidad (A));
     writeln ('**********************************');
     writeln ('Se imprimira de manera creciente');
     Creciente (A);
     writeln ('Se imprimira SOLO PARES de manera decreciente');
     Pares_Decrecientes (A);
End.
