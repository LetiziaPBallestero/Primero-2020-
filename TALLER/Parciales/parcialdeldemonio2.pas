// Entre los parciales variaba el punto b. y hasta dónde llegaba cada vector 
// Si 200 , 250 o 180 ventas a lo sumo. Lo único que hay que hacer , 
// en ese caso, es cambiar ventas Max 
// Lo otro que cambia en el punto b es conqué se busca o qué hace en el codigo recursivo
// en estos casos no tengo ninguna constante porque me olvido los nombres y me da paja
program ParcialDelDemonio; 
Const 
	sucursales = 5;
	ventasMax = 180;
	montoCorte = 300000;
	codFin = -1; 
Type 
	venta = record 
		cod : integer;
		cantV : integer; 
		monto : real; 
	end; 
	
	lista = ^nodo;
	nodo = record 
		dato : venta; 
		sig : lista; 
	end;
	
	vector = array [1..sucursales] of lista;
	
	r2 = record 
		montoT: real; 
		cadaCod : integer; 
	end;
	lista2 = ^nodito;
	nodito = record 
		datito : r2; 
		siguiente : lista2;
	end; 
{ ------------------------------------------ ZONA DE MODULOS ----------}
// hacer el isjfdsfnhdg vector 
Procedure leerVentas (var V : venta);
Begin 
	write ('Codigo: ' ); 
	// readln (V.cod);
	V.cod := random (200); 
	if (V.cod <> codFin) then begin 
		write ('Cantidad vendidas: '); 
		V.cantV := random (100);
		// readln (V.cantV);
		write ('Monto: '); 
		V.monto := (random (1000) * 20.5);
		// readln (V.monto);
	end; 
End; 

Procedure agregarAtras (var L : lista ; V : venta); 
Var 
	aux, act, ant : lista;
Begin
	new (aux);
	aux^.dato := V;
	aux^.sig := nil; 
	if ( L = nil) then 
		L := aux
	else begin 
		act := L;
		ant := L;
		while ( act <> nil) do begin
			ant := act ;
			act := act^.sig;
		end;
		ant^.sig := aux;
	end;
End;

Procedure inicializarVector (Var V : Vector); 
Var 
 i : integer;
Begin 
	 for i:= 1 to sucursales do 
		  V[i] := nil;
end;

Procedure vectorVentas (Var V : vector);
Var 
	R : Venta; 
	i , cont : integer;
Begin 
	inicializarVector (V);
	for i:=1 to sucursales do begin 
		cont := 0;
		writeln ('Sucursal :', i);
		leerVentas (R);
		while ((cont < ventasMax) and (R.cod <> codFin)) do begin 
			agregarAtras (V[i] , R);  
			cont:= cont + 1;
			writeln ('-----');
			leerVentas (R); 
		end; 
	end; 
End;

Procedure imprimirVector (V : Vector);
Var 
	i : integer; 
Begin
	for i:= 1 to sucursales do begin 
		writeln ('Sucursal: ', i);
		while (V[i] <> nil) do begin
			write ('Codigo de producto: ', V[i]^.dato.cod); 
			write (' - Cantidad vendida: ', V[i]^.dato.cantV); 
			writeln (' - Monto: $',V[i]^.dato.monto:2:2); 
			V[i] := V[i]^.sig;
		end;
	end;
End; 
// punto a : merge o merge acumulador para generar una lista que contenga 
// el monto total vendido para cada producto. Ordenada x cod. de producto
Procedure agregarAtrasL2 (Var L : lista2 ; var ult : lista2 ; R : r2);
Var 
	 aux : lista2; 
Begin
	new (aux);
	aux^.datito := R; 
	aux^.siguiente := nil; 
	if (L = nil) then 
		L := aux 
	else 
		ult^.siguiente := aux;
	ult := aux;
End; 

Procedure Minimo (Var V : Vector ; Var codigo_producto : integer ; Var montoTotal : real);
Var 
	 indice_suc , i : integer; 
Begin 
	 indice_suc := -1; 
	 Codigo_producto := 9999;
	 for i:= 1 to sucursales do begin 
		 if (V[i] <> nil ) then  
			 if (V[i]^.dato.cod <= Codigo_producto) then begin 
				 Codigo_Producto := V[i]^.dato.cod;
				 indice_suc := i;
			 end;
	 end;
	 if (indice_suc <> -1) then begin 
		 montoTotal := ((V[indice_suc]^.dato.monto) * (V[indice_suc]^.dato.cantV));
		 V[indice_suc] := V[indice_suc]^.sig;
	 end;
End;

Procedure mergeAcumulador (VS : Vector ; Var L , ult : Lista2);
Var 
	 monto_V : real;
	 codigo_prod : integer;
	 montoAcumulado : real;
	 R : r2;
	 Actual : integer;
Begin 
	 L := nil;
	 Ult := nil;
	 Minimo (VS , codigo_prod , monto_V);
	 while (codigo_prod <> 9999) do begin 
		 Actual := codigo_prod;
		 montoAcumulado := 0;
		 while ((codigo_prod <> 9999 ) and (codigo_prod = actual)) do begin 
			 montoAcumulado := montoAcumulado + monto_V;
			 Minimo (VS , Codigo_prod , monto_V);
		 end;
		 R.cadaCod := actual;
		 R.montoT:= montoAcumulado;
		 AgregarAtrasL2 (L, ult , R);

	 end;
End; 

Procedure imprimirLista (L : Lista2);
Begin
  While( L <> nil)do Begin
    Writeln ('Codigo: ', L^.datito.cadaCod ,' total: ', L^.datito.montoT:2:2);
    L := L^.siguiente;
  end;
End;

// b: Realizar un módulo recursivo que reciba la lista generada en el punto a y retorne la cantidad de
// productos para los cuales el monto total vendido es inferior a 300.000 pesos.}
procedure cantidadMenorA ( L : Lista2 ; Var cant : integer);
Begin
	If (L <> nil) then begin 
		if (L^.datito.montoT < montoCorte )then
			cant:= cant + 1;
		cantidadMenorA (L^.siguiente, cant);
	end;
end;
{ --------------- ESTOS MÓDULOS SON DE OTROS PARCIALES ------------------- }
{Realizar un módulo recursivo que reciba la lista generada en el punto a y retorne
 la suma de las cantidades vendidas para los productos con código menor que 80}
// en este caso solo hay que cambiar la constante montoCorte por una con un nombre
// más apropiado y de valor 80, enel merge no GUARDO el monto ( no se usa) pero guardo
// la cantidad vendidas
procedure cantidadVendida ( L : lista2 ; var cant : integer);
//este cant esta inicializado como 0 antes 
begin 
	if ( L <> nil) then begin 
		if (L^.datito.cadaCod < 80) then 
			cant := cant + L^.datito.cantVentas
		cantidadVendida ( L : lista2 ; var cant : integer);
	end; 
end; 
{un módulo recursivo que reciba la lista generada en el punto a 
y retorne la cantidad de productos  para los cuales la cantidad total vendida
 supera las 500 unidades} 
 procedure cantidadVendidamayor ( L : lista2 ; var cant : integer )
 // este está inicializado como 0 antes 
 begin 
 	if ( L <> nil) then begin 
 		if (L^.datito.cantVentas > 500) then 
 			cant := cant + 1; 
 		cantidadVendidamayor (L , cant); 
 	end; 
 end;

{ ---------------------------------------- programa principal ---------}
Var
	V : Vector;
	L2 , ult : Lista2; 
	cant : integer;
Begin 
	writeln ('La cargasion (?) del vector de listas ---');
	L2 := nil; 
	vectorVentas (V);
	writeln ('');
	imprimirVector (V);
	
	writeln;
	mergeAcumulador (V , L2 , ult);
	writeln;
	imprimirLista (L2);
	
	writeln;
	cant := 0; 
	cantidadMenorA (L2, cant);
	// cantidadVendida (L2 , cant); 
	writeln ('Hay ', cant ,' productos menores a $300.000');
End.
