Program Ejercicio_12; {Merge acumulador}
Const
	 DimF = 4; {sucursales}
Type 
	 SubR = 1..DimF;
	 
	 fecha_c = record 
		 dia : 1..31;
		 mes : 1..12;
		 anio : integer;
	 end;

	 Venta = record 
		 fecha : fecha_c;
		 cod_prod : integer;
		 cod_suc : integer;
		 cant_ventas : integer;
	 end; 
	 
	 Lista = ^Nodo;
	 Nodo = record
		 dato : Venta; 
		 sig : Lista; 
	 end; 
	 
	 Sucursales = array [SubR] of Lista; 
{ -------------------- ZONA DE MODULOS ----------------------- } 
{ --- Punto a | Generar la estructura --- }
Procedure Leer_Venta (Var R : Venta); 
Begin 
	 Writeln ('Ingrese el codigo de la sucursal:');
	 read (R.cod_suc);
	 if (R.cod_suc <> 0) then begin
		 writeln ('Ingrese la fecha de la venta ...');
		 write ('Dia:');
		 //read (R.fecha.dia);
		 R.fecha.dia := random (30) + 1;
		 write ('Mes:');
		 //read (R.fecha.mes);
		 R.fecha.mes := random (12) + 1;
		 write ('Anio:');
		 //read (R.fecha.anio);
		 WRITELN ('');
		 R.fecha.anio := random (2020) + 1;
		 writeln ('Ingrese el codigo del producto');
		 //read (R.cod_prod);
		 R.cod_prod := random (100) + 1;
		 writeln ('Ingrese la cantidad de ventas');
		 //readln (R.cant_ventas);
		 R.cant_ventas := random (100) + 1;
	 end; 
End;

Procedure Inicializar_Vector (Var S : Sucursales);
Var 
	 i : integer;
Begin
	 for i:=1 to DimF do 
		 S[i] := nil;
end; 

Procedure Insertar_Ordenado (Var L : Lista ; R : Venta);
Var 
	 ant,act,aux : Lista; 
Begin 
	 new (aux);
	 aux^.dato := R; 
	 act := L; 
	 while (act <> nil) and (R.cod_prod > act^.dato.cod_prod) do begin 
		 ant := act;
		 act := act^.sig;
	 end; 
	 if (act = L) then
		 L := aux
	 else
		 ant^.sig := aux;
	 aux^.sig := act;
End;

Procedure Cargar_Vector ( Var S : Sucursales);
Var 
	 R : Venta; 
Begin 
	 Inicializar_Vector (S);
	 Leer_Venta (R);
	 while (R.cod_suc <> 0) do begin 
		 Insertar_Ordenado (S[R.cod_suc], R);
		 Leer_Venta (R);
	 end;
End;
{ --- Punto b | merge y acumular }
Procedure Agregar_Atras ( Var L , ult : Lista ; R : Venta);
Var 
	 aux : Lista;
Begin 
	 new (aux);
	 aux^.dato := R; 
	 aux^.sig := nil;
	 if (L = nil) then 
		 L := aux
	 else
		 ult^.sig := aux;
	 ult := aux;
End;

Procedure Minimo (Var S : Sucursales ; Var Codigo_producto : integer ; Var Cantidad_Ventas : integer);
Var 
	 indice_suc , i : integer; 
Begin 
	 indice_suc := -1; 
	 Codigo_producto := 9999;
	 for i:= 1 to DimF do begin 
		 if (S[i] <> nil ) then  
			 if (S[i]^.dato.cod_prod <= Codigo_producto) then begin 
				 Codigo_Producto := S[i]^.dato.cod_prod;
				 indice_suc := i;
			 end;
	 end;
	 if (indice_suc <> -1) then begin 
		 Cantidad_Ventas := S[indice_suc]^.dato.cant_ventas;
		 S[indice_suc] := S[indice_suc]^.sig;
	 end;
End;

Procedure Merge_Acumulador (VS : Sucursales ; Var L , ult : Lista);
Var 
	 Cant_v : integer;
	 codigo_prod : integer;
	 Ventas_totales : integer;
	 R : Venta;
	 Actual : integer;
Begin 
	 L := nil;
	 Ult := nil;
	 Minimo (VS , codigo_prod , Cant_V);
	 while (codigo_prod <> 9999) do begin 
		 Actual := codigo_prod;
		 Ventas_totales := 0;
		 while ((codigo_prod <> 9999 ) and (codigo_prod = actual)) do begin 
			 Ventas_Totales := Ventas_Totales + Cant_V;
			 Minimo (VS , Codigo_prod , Cant_V);
		 end;
		 R.cod_prod := actual;
		 R.cant_ventas:= Ventas_Totales;
		 Agregar_Atras (L, ult , R);

	 end;
End; 

Procedure Imprimir_Lista (L : Lista);
Begin 
     while( L <> nil) do begin
		 writeln(L^.dato.cod_prod);
		 L := L^.sig;
	 end;
end;
{ ------------------ PROGRAMA PRINCIPAL ---------------------- }
Var 
	 VS : Sucursales; 
	 L , ult : Lista; 
Begin 
	 Cargar_Vector (VS);
	 Writeln ('Se genero el vector de listas');
	 Writeln ('********************************************');
	 
	 Merge_Acumulador (VS , L , ult);
	 Writeln ('Se genero la nueva lista');
	 
	 Imprimir_Lista (L);
end.
