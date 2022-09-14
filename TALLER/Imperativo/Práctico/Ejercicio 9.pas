Program Ejercicio_9;
Type 
	 Cadena = String [30];
	 Arbol = ^Nodo;
	 Nodo = record 
		 dato : Cadena;
		 hi : Arbol;
		 hd : Arbol;
	 end; 
{ -------------------------- Zona de modulos ------------------------ }
Procedure Crear_Nodo (Var A : Arbol ; dato : Cadena);
Begin 
	 if ( A = nil ) then begin 
		 New (A);
		 A^.dato := dato;
		 A^.hi := nil;
		 A^.hd := nil;
	 end
	 else begin 
		 if (dato < A^.dato) then
			 Crear_Nodo (A^.hi , dato)
		 else 
			 Crear_Nodo (A^.hd , dato); 
	 end;
End;

Procedure Leer_Nombre (Var nombre : Cadena); 
Begin
	 writeln (' * Introducir un nombre');
	 readln (nombre);
End; 

Procedure Armar_Arbol (Var A : Arbol); 
Var 
	 Dato : Cadena; 
Begin 
	 Leer_Nombre (dato);
	 while (dato <> 'zzz') do begin 
		 Crear_Nodo (A , dato); 
		 Leer_Nombre (dato);
	 end; 
End;

Procedure Imprimir (A : Arbol);
Begin
	 if (A <> nil) then begin 
		 Imprimir (A^.hi);
		 writeln (A^.dato);
		 Imprimir (A^.hd);
	 end; 
End;

Function Buscar_Nombre (A : Arbol ; nombre : Cadena) : boolean;
Begin 
	 Buscar_Nombre := False;
	 if (A <> nil) then  begin 
		 if (nombre = A^.dato) then 
			 Buscar_Nombre := true
		 else 
			 if (nombre < A^.dato) then 
				 Buscar_Nombre := Buscar_Nombre (A^.hi , nombre)
			 else 
				 Buscar_Nombre := Buscar_Nombre (A^.hd , nombre);
	 end;
End;

{ ---------------- PROGRAMA PRINCIPAL ---------------- }
Var 
	 A : Arbol; 
	 Nombre : Cadena;
Begin 
	 A := nil; 
	 Armar_Arbol (A);
	 Writeln ('Se imprimira en orden los nombres');
	 Imprimir (A);
	 Writeln ('**********************************');
	 Writeln (' * Introducir nombre a buscar');
	 read (Nombre);
	 Writeln ();
	 Writeln (' * La busqueda del nombre ha dado ', Buscar_Nombre (A,Nombre));
End.
