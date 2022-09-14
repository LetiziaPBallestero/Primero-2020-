Program Ejercicio_11;
Const
	 CantGeneros = 8; 
Type 
	 SubR = 1..CantGeneros;
	 rPelicula = record 
		 cod : integer;
		 gen : SubR;
		 score : real; 
	 end; 
	 
	 Lista_P = ^Nodo_P; 
	 Nodo_P = record
		 dato : rPelicula;
		 sig : Lista_P
	 end; 
	 
	 Vector_P = array [SubR] of Lista_P;
{ -------------------- ZONA DE MODULOS ---------------------- }
{ --- Punto a | alamcenamiento de datos --- }
Procedure Inicializar_Vector (Var V : Vector_P);
Var
	 i : integer;
Begin
	 for i:=1 to CantGeneros do
		 V[i] := nil;
End; 

Procedure Leer_Peliculas (Var P : rPelicula);
Begin 
	 writeln ('Introducir el codigo de pelicula:');
	 read (P.cod); 
	 if (P.cod <> -1) then begin 
		 writeln ('Introducir el numero asignado al genero:');
		 //read (P.gen);
		 P.gen := random (CantGeneros) + 1;
		 writeln ('Introducir el puntaje de la pelicula:');
		 //read (P.score);
		 P.score := random (10) + 1;
		 writeln ('--------------------------------------');
	 end; 
End;

Procedure Insertar_Ordenado (Var L : Lista_P ; P : rPelicula);
Var 
	 ant,act,aux: Lista_P;
Begin
	 new (aux);
	 aux^.dato := P; 
	 act := L;
	 While (act <> nil) and (P.cod > act^.dato.cod) do begin
		 ant := act;
		 act := act^.sig;
	 end;
	 if (act = L) then 
		 L := aux
	 else
		 ant^.sig := aux;
	 aux^.sig := act;
End;

Procedure Cargar_vector (Var V : Vector_P);
Var 
	 P : rPelicula;
Begin 
	 Inicializar_Vector (V);
	 Leer_Peliculas (P);
	 while (P.cod <> -1) do begin 
		 Insertar_Ordenado (V[P.gen] , P);
		 Leer_Peliculas (P);
	 end; 
End;
// -------------------------------------------------------------------

Procedure Imprimir_Vector (V : Vector_P);
Var 
	 i : integer;
Begin 
	 for i:=1 to CantGeneros do begin 
		 writeln ('Genero ', i, ' :');
		 while (V[i] <> nil) do begin;
			 writeln (V[i]^.dato.cod);
			 V[i] := V[i]^.sig;
		 end;
	 end;
End;
{ --- Punto b | merge --- }
Procedure Agregar_atras (Var L, ult : Lista_P ; min : rPelicula);
Var 
	 aux : Lista_P;
Begin
	 new (aux);
	 aux^.dato := min;
	 aux^.sig := nil;
	 if (L = nil) then 
		 L := aux
	 else 
		 ult^.sig := aux;
	 ult := aux;
End;

Procedure Minimo_Merge (Var V : Vector_P ; Var min_P : rPelicula ; Var min : integer);
Var 
	 minimoindice , i : integer;
Begin 
	 min := 999;
	 minimoindice := -1; 
	 for i:=1 to CantGeneros do begin 
		 if (V[i] <> nil) then 
			 if (V[i]^.dato.cod < min) then begin
				 minimoindice := i;
				 min := V[i]^.dato.cod;
			 end;
	 end;
	 if (minimoindice <> -1) then begin 
		 min_P.cod := V[minimoindice]^.dato.cod;
		 min_P.gen := V[minimoindice]^.dato.gen;
		 min_P.score := V[minimoindice]^.dato.score;
		 V[minimoindice] := V[minimoindice]^.sig;
	 end;
End;

Procedure Merge_Peliculas (Var V: Vector_P ; Var L_new: Lista_P);
Var 
	 ult : Lista_P;
	 Min_P : rPelicula;
	 min_i : integer; 
Begin
	 L_new := nil; 
	 ult := nil;
	 Minimo_Merge (V , Min_P , min_i);
	 while (min_i <> 999) do begin 
		 Agregar_Atras (L_new , ult , Min_P);
		 Minimo_Merge (V , Min_P , min_i);
	 end; 
End; 

Procedure Imprimir_Lista (L : Lista_P);
Begin 
     while( L <> nil) do begin
		 writeln(L^.dato.cod);
		 L := L^.sig;
	 end;
end;

{ -------------------- PROGRAMA PRINCIPAL ------------------- }
Var 
	 Vector : Vector_P;
	 Lista_Nueva : Lista_P;
Begin 
	 Cargar_vector (Vector);
	 writeln ('----- Carga realizada y quedó así: ----');
	 Imprimir_Vector (Vector);
	 ////////////////////////////////////////////////////
	 writeln ('Se generara una lista nueva');
	 Merge_Peliculas (Vector , Lista_Nueva);
	 writeln ('Ahora se imprimira la lista esta nueva');
	 Imprimir_Lista (Lista_Nueva);
	 writeln ('Que tenga un feliz dia c:');
End.
