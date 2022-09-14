{Modifique para hacer un merge de vector de listas}
/////////////// ¡!¡!¡! LO QUE HICE ACÁ NO ES UN EJEMPLO DE CARGAR VECTORES DE LISTAS
// ESTÁ TOTALMENTE ALEATORIZADO EL VECTOR DE LISTAS y posiblemente mal
// pero bueh, estoy harta. 
Program Merge;
Const
	 DimF = 5; // 5 estantes 
Type 
	 SubR = 1..DimF; 
	 Lista = ^Nodo; // cada estante
	 Nodo = record 
		 dato : string; // cada libro 
		 sig : Lista; 
	 end; 
	 
	 Vector = array [SubR] of Lista; // los 5 estantes
{ -------------------------------------------- ZONA DE MODULOS ------- }
/////////////////////// CARGAR EL VECTOR DE LISTAS /////////////////////
{ Al estar el proceso aleatorizado no necesito de este modulillo
* Procedure Leer_titulo ( Var T : string);
Begin 
	 Write ('Ingrese el título del libro o zzz para finalizar');
	 readln (T);
	 writeln ('');
End; }

Procedure Insertar_Ordenado (Var L : Lista ; T : string);
Var 
	 aux, ant ,act : Lista; 
Begin 
	 act := L;
	 ant := act;
	 while (act <> nil) and (act^.dato < T) do begin 
		 ant := act;
		 act := act^.sig;
	 end;
	 
	 new(aux);
	 aux^.dato := T; 
	 
	 if (ant = act) then begin 
		 aux^.sig := L;
		 L := aux; 
	 end
	 else begin 
		 ant^.sig := aux;
		 aux^.sig := act;
	 end; 
End;

{ ni de este 
* Procedure Cargar_Lista (Var L : Lista); // Un estante
Var 
	 ult : Lista; 
	 T : string; 
Begin 
	 L := nil; 
	 Leer_titulo (T);
	 while (T <> 'zzz') do begin 
		 Insertar_Ordenado (L , T); 
		 Leer_Titulo (T);
	 end;
End; }

//////// esto módulos son para aletorizar la carga de datos ... 
 
Procedure Titulo_Aleatorio ( Var T : string ; Var num : integer);
Begin 
	 num := num + Random (5);
	 T := 'Titulo' + chr (num) + chr (num) + chr (num);
End;

Procedure Generar_aleatorio (Var L : Lista); // Genera un estante aleatorio
Var 
	 pri , cant , i : integer;
	 Titulo : string;
	 ult : Lista;
Begin 
	 cant := random (20); // estante de a lo sumo 20 libros
	 L := nil; // el esante; 
	 pri := 65;
	 for i:= 1 to cant do begin
		 Titulo_Aleatorio (Titulo , pri);
		 Insertar_Ordenado (L , Titulo);
	 end; 
End;

/////// fin del proceso de aleatorización ....

Procedure Inicializar_Vector (Var V : Vector); 
Var 
	 i : integer; 
Begin 
	 for i:=1 to DimF do 
		 V[i] := nil; 
End;

Procedure Generar_Estante (Var V : Vector); //Todos los estantes 
Var 
	 i : integer;
Begin 
	 Inicializar_Vector (V);
	 randomize; 
	 for i:=1 to DimF do 
		 Generar_aleatorio (V[i]);
end;

////// PROCESOS PARA IMPRIMIR 

Procedure Imprimir_unaLista (L : Lista);
Var 
	 Cant : integer; 
Begin
	 cant := 0; 
	 while (L <> nil) do begin 
		 cant := cant + 1;
		 writeln ('Libro', cant, '-Titulo: ', L^.dato);
		 L := L^.sig;
	 end;
End;

Procedure Imprimir_VectorL (V : Vector);
Var 
	 i : integer; 
Begin 
	 for i:=1 to DimF do begin 
		 writeln ('-----------------------');
		 writeln ('Estante numero ', i);
		 Imprimir_UnaLista (V[i]);
	 end; 
End;

//////////////////////// MERGE comunacho /////////////////////

Procedure Agregar_Atras (Var L, ult : Lista ; dato : string);
Var 
	 aux : Lista; 
Begin 
	 new (aux);
	 aux^.dato := dato; 
	 if (L = nil) then 
		 L := aux
	 else 
		 ult^.sig := aux;
	 ult := aux;
End;

Procedure Minimo (Var V : Vector ; Var min : string); // devuelve el vector pues de ahí "saca" los libros
Var 
	 pos , i : integer; 
Begin 
	 min := 'ZZZ';
	 pos := -1;
	 for i:= 1 to DimF do 
		 if ((V[i] <> nil) and (V[i]^.dato <= min)) then begin
			 min := V[i]^.dato;
			 pos :=i;
		 end; 
	 if (pos <> -1) then // Si encontré un mínimo, avanzo en el estante
		 V[pos] := V[pos]^.sig;
End;

Procedure Merge (V : Vector ; Var L :Lista);
Var 
	 min : string; 
	 ult : Lista; 
Begin 
	 L := Nil;
	 Minimo (V , min);
	 while (min <> 'ZZZ') do begin 
		 Agregar_Atras (L, ult , min);
		 Minimo (V , min); 
	 end;
End;

///// ME QUEDÉ EN IMPRIMIR, SIGO MAÑANA 
{ ----------------------------------- PROGRAMA PRINCIPAL ------------- }
Var 
	 V : Vector; // Mi biblioteca
	 L : Lista; // mi nuevo estante
Begin 
	 Generar_Estante (V);
	 Imprimir_VectorL (V);
	 writeln ('********************************');
	 Merge (V , L);
	 writeln ('Estante mergeado');
	 writeln ('');
	 Imprimir_unaLista (L);
End.
	 
