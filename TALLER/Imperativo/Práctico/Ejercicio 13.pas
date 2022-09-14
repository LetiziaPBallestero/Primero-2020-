{Un teatro tiene funciones los 7 días de la semana. Para cada día se tiene una lista con las
entradas vendidas. Se desea procesar la información de una semana.
Implementar un programa que:
a. Genere 7 listas con las entradas vendidas para cada día. De cada entrada se lee día (de
1 a 7), código de la obra, asiento y monto. La lectura finaliza con el código de obra igual a
0. Las listas deben estar ordenadas por código de obra de forma ascendente.

b. Genere una nueva lista que totalice la cantidad de entradas vendidas por obra. Esta
lista debe estar ordenada por código de obra de forma ascendente.}

Program Ejercicio13;
Const 
	 DimF = 7;
Type 
	 SubR = 1..DimF; 
	 
	 Entradas = record 
		 dia : SubR; 
		 Cod : integer; 
		 asiento : integer;
		 monto : real;
	 end; 
	 
	 Lista = ^Nodo;
	 Nodo = record 
		 dato : Entradas;
		 sig : Lista;
	 end; 
	 
	 Vector = array [SubR] of Lista; 
	 
	 Obras = record 
		 entradas : integer;
		 codigo : integer;
	 end; 
	 
	 Lista_2 = ^Nodo_2;
	 Nodo_2 = record 
		 data : Obras; 
		 sig : Lista_2;
	 end; 
///////////////////////////////////// MODULOS //////////////////////////
// -- Punto a : generar la lista, insertando en el vector. 
Procedure Leer_Entrada ( Var R : Entradas); 
Begin  
	 write ('Ingrese codigo de obra:');
	 readln (R.cod);
	 if (R.cod <> 0) then begin 
		 writeln ('Dia:');
		 // readln (R.dia);
		 R.dia := random (6) + 1;
		 writeln ('Codigo de asiento:');
		 // readln (R.asiento);
		 R.asiento := random (50) + 1;
		 writeln ('Ingrese monto:');
		 // readln (R.monto); 
		 R.monto := (100) + 1;
	 end;  
End;

Procedure Inicializar_Vector (Var V : Vector);
Var 
	 i : integer; 
Begin 
	 for i:=1 to DimF do 
		 V[i] := nil; 
End; 

Procedure Insertar_Ordenado (Var L : Lista ; R : Entradas);
Var 
	 ant,act,aux : Lista; 
Begin 
	 new (aux);
	 aux^.dato := R; 
	 act := L; 
	 while (act <> nil) and (R.cod > act^.dato.cod) do begin 
		 ant := act;
		 act := act^.sig;
	 end; 
	 if (act = L) then
		 L := aux
	 else
		 ant^.sig := aux;
	 aux^.sig := act;
End;

Procedure Cargar_Vector ( Var V : Vector); 
Var 
	 En: Entradas;
Begin 
	 Inicializar_Vector (V);
	 Leer_Entrada (En);
	 while (En.cod <> 0) do begin 
		 Insertar_Ordenado (V[En.dia] , En);
		 Leer_Entrada (En);
	 end;
End;

// Dato: está bien implementado todo, pero a la hora de imprimir,
// me imprime por día, así que está bien ordenado según el DÍA. 
Procedure Imprimir_Vector (V : Vector);
Var 
	 i : integer;
Begin 
	 for i:=1 to DimF  do begin 
		 writeln ('Obra ', i, ' :');
		 while (V[i] <> nil) do begin;
			 writeln ('Codigo de obra: ', V[i]^.dato.Cod);
			 writeln ('Asiento: ', V[i]^.dato.asiento);
			 writeln ('Dia: ', V[i]^.dato.dia);
			 writeln ('Monto: ', V[i]^.dato.monto:2:2);
			 writeln ('--------------------------------');
			 V[i] := V[i]^.sig;
		 end;
	 end;
End;
// -- Punto b : merge. totalice la cantidad de entradas vendidas por obra. Esta
// lista debe estar ordenada por código de obra de forma ascendente.
Procedure Agregar_Atras ( Var L , ult : Lista_2 ; R : Obras);
Var 
	 aux : Lista_2;
Begin 
	 new (aux);
	 aux^.data := R; 
	 aux^.sig := nil;
	 if (L = nil) then 
		 L := aux
	 else
		 ult^.sig := aux;
	 ult := aux;
End;

Procedure Minimo (Var V : Vector ; Var Nodito : Obras);
Var 
	 i , indice : integer;
Begin 
	 indice := -1;
	 Nodito.codigo := 999;
	 Nodito.entradas := 0;
	 for i:= 1 to DimF do begin
		 if (v[i] <> nil) then
			 If (v[i]^.dato.cod < Nodito.codigo) then begin
				 Nodito.codigo:= v[i]^.dato.cod;
				 Nodito.entradas:= nodito.entradas + 1;
				 indice :=i;
			 end;
	 end; 
	 if (indice <> -1) then 
		 v[indice]:= v[indice]^.sig 
End;

Procedure Merge_Acumulador (V:vector ; var L: Lista_2);
Var 
	 Obra_min : Obras;
	 ult : Lista_2;
	 Actual : integer;
	 Cant_entradas : integer; 
	 Definitivo : Obras;
Begin 
	 L := Nil; 
	 Ult := Nil; 
	 Minimo (V , Obra_min);
	 while (Obra_min.codigo <> 999) do begin 
		 Actual := Obra_min.codigo;
		 Cant_entradas :=0;
		 While ((Obra_min.codigo <> 999) and (Obra_min.codigo = Actual)) do begin
			 Cant_entradas := Cant_entradas + Obra_min.entradas;
			 Minimo ( V , Obra_min);
		 end;
		 Definitivo.codigo := actual; 
		 Definitivo.entradas := Cant_entradas;
		 Agregar_Atras (L , ult , Definitivo);
	 end;
End;
 
Procedure Imprimir_Lista (L : Lista_2);
Begin 
     while( L <> nil) do begin
		 writeln('Codigo: ', L^.data.codigo);
		 writeln ('Cantidad: ', L^.data.entradas);
		 L := L^.sig;
	 end;
end;

//////////////////////////// PROGRAMA PRINCIPAL ///////////////////////
Var 
	 V : Vector; 
	 L : Lista_2;
Begin 
	 writeln ('Se realizara la carga del vector'); 
	 Cargar_Vector (V);
	 Imprimir_Vector (V);
	 writeln ('------------------------------------------');
	 Merge_Acumulador (V , L);
	 Imprimir_Lista (L);
End.
