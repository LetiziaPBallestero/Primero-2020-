Program Ejericio_10;
Const 
	 lim_inf = 2803;
	 lim_sup = 6982;
	 lim_ingr = 2000;
	 superior = 12803;
Type 
	 Alumno = record
		 legajo : integer;
		 apynom : string;
		 dni : integer;
		 ingreso : integer; 
	 end;
	 
	 Arbol = ^Nodo;
	 Nodo = record 
		 dato : Alumno;
		 hi : Arbol;
		 hd : Arbol; 
	 end; 
{ ------------------- ZONA DE MODULOS ------------------ }
{ --- Punto a: almacenar --- }
Procedure Leer_Alumno (Var A : Alumno);
Begin
	 write ('Ingrese el legajo del alumno ');
	 readln (A.legajo);
	 if (A.legajo <> -1) then begin 
		 write ('Ingrese apellido y nombre '); 
		 readln (A.apynom);
		 write ('Ingrese DNI '); 
		 readln (A.dni);
		 write ('Ingrese año de ingreso '); 
		 readln (A.ingreso);
		 writeln ('-----------------');
	 end; 
End;

Procedure Agregar_Nodo (Var A : Arbol ; R : Alumno);
Begin 
	 if (A = nil) then begin
		 new (A);
		 A^.dato := R;
		 A^.hi := nil;
		 A^.hd := nil;
	 end
	 else
		 if (A^.dato.legajo > R.legajo) then 
			 Agregar_Nodo (A^.hi , R)
		 else 
			 Agregar_Nodo (A^.hd , R); 
End;

Procedure Generar_Arbol (Var A : Arbol); 
Var 
	 R : Alumno;
Begin 
	 Leer_Alumno (R);
	 while (R.legajo <> -1 ) do begin 
		 if (R.ingreso > lim_ingr) then 
			 Agregar_Nodo (A , R);
		 Leer_Alumno (R);
	 end; 
End; 
{ --- Punto b: nombre y apellido con legajo mayor a 12803 --- }
Procedure Informar_superior (A : Arbol);
Begin
	 if (A <> nil ) then begin 
		 Informar_Superior (A^.hd);
		 Informar_Superior (A^.hi);
		 if (A^.dato.legajo > superior) then 
			 writeln (A^.dato.apynom);
	 end; 
End;
{ --- Punto c: Nombre y apellido de los que tengan legajo e/ 2803 y 6982 --- }
Procedure Informar_Rango (A : Arbol); 
Begin
	 if (A <> nil) then begin
		 if ((A^.dato.legajo > lim_inf) and (A^.dato.legajo < lim_sup)) then 
			 writeln (A^.dato.apynom);
		 Informar_Rango (A^.hi);
		 Informar_Rango (A^.hd);
	 end; 
end;
{ ----------------- PROGRAMA PRINCIPAL ----------------- }
Var 
	 A : Arbol; 
Begin 
	 A := nil; 
	 Generar_Arbol (A);
	 Writeln ();
	 Writeln ('Alumnos con legajo superior a 12803: ');
	 Informar_superior (A);
	 writeln ();
	 Writeln ('Alumnos con legajo entre ', lim_inf,' y ',lim_sup);
	 Informar_Rango (A);
	 readln ();
End.
