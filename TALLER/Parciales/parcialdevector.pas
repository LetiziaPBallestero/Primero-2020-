{Se lee información acerca de las ventas de productos realizadas en las 5 sucursales de una empresa.
Cada sucursal realizó a lo sumo 180 ventas. De cada venta se conoce el código de producto, cantidad
vendida y monto total de la venta. 

Las ventas de cada sucursal se leen de manera consecutiva y
ordnadas por código de producto. 

La lectura por cada sucursal finaliza al completar las 180 ventas o
cuando se lee el código de producto -1, el cual no se procesa. Implementar un programa para que a
partir de la información leida, resuelva los siguientes ítems:

a) Utilizando la técnica de merge o merge acumulador según corresponda, generar una lista que
contenga el monto total vendido para cada código de producto, ordenada por código de producto.
b) Realizar un módulo recursivo que reciba la lista generada en el punto a y retorne la cantidad de
productos para los cuales el monto total vendido es inferior a 300.000 pesos.}

program AaAaAaAaAaAaAAAA; 
Const 
	limSucursales = 5; 
	limVentas = 180; 
	codFin = -1; 
	limInferior = 300000:; // monto inferior 
Type 
	ventas = record 
		codProd = integer; 
		cantVentas = integer; 
		montoTotal = double; 
	end; 

	vectorVentas = array [1..limVentas] of ventas; 

	sucursal = record 
		dimL : 1..limVentas; 
		vector : vectorVentas;
	end;

	vectorSucursal = array [1..limSucursales] of sucursal;

	ventasLista = record 
		codProdL = integer;
		montoTotalL = integer; 
	end; 

	lista = ^nodo; 
	nodo = record
		dato = ventaLista;
		sig = lista; 
	end; 
{-------------------------------------- ZONA DE MODULOS -------------}
// crear vector de ventas 
Procedure leerVenta (Var V: ventas); 
Begin 
	with V do Begin
		write ('Codigo de venta:');
		readln  (codProd);
		if (codProd <> codFin) then begin 
			write ('Cantidad de ventas:');
			readln (cantVentas);
			write ('Monto TOTAL:');
			readln (montoTotal);
		end;
	end;
End; 

Procedure agregarVectorVentas (var V : vectorVentas; var dimL : integer; R : ventas);
begin
	if (dimL < limVentas) then begin // verifico el espacio 
		dimL := dimL + 1;  
		V [dimL] := R; 
	end; 
End; 

Procedure crearVectorVentas (Var V : vectorVentas ; var DimL : integer); 
Var 
	r : venta; 
Begin 
	writeln ('Ingrese las ventas ordenadas por codigo de menor a mayor. -1 para cortar');
	LeerVenta (r);
	while (dimL < limVentas) and (r.codProd <> -1) do begin 
		agregarVectorVentas (V , DimL , r);
		if (dimL < limVentas) then 
			leerVenta(r); 
	end;
End;

Procedure crearVectorSucursales (Var V : vectorSucursal);
Var 
	 i : integer; 
	 sucursalAct : sucursal; 
Begin 
	for i:=1 to limSucursales do begin 
		writeln ('Vector de sucursal ', i, ': ');
		sucursalAct.dimL := 0; 
		crearVectorVentas (sucursalAct.vector , sucursalAct.dimL); 
		V[i] := ventasAct; 
	end;
End;
// punto del merge 
Procedure agregarAtrar (var pri: lista ; var ult: lista ; mt : real ; cod : integer); 
Var 
	aux : lista; 
begin 
	new (aux);
	aux^dato.codProdL := integer; 
	aux^.dato.montoTotalL := mt; 
	aux^.sig := nil;
	if (pri <> nil) then 
		ult^.sig := aux; 
	else
		pri := aux; 
	ult :=aux; 
end;
procedure borrarPos (Var V : vectorVentas ; var dimL : integer ; pos : integer); 
Var 
	i : integer; 
Begin 
	for i:= pos to dimL-1 do 
		v[i] := v[i+1];
	dimL := dimL - 1;
end;

procedure minimo (Var V : vectorSucursal ; var min : ventasLista);
Var 
	pos , i , minimo : integer; 
	minimoMonto : real; 
Begin 
	minimo := 999; 
	for i:= 1 to limSucursales do begin 
		if (V[i].dimL <> 0) then begin 
			if (V[i].vector[1].codProd < minimo) then begin 
				minimo := V[i].vector[1].codProd; 
				minimoMonto := V[i].vector[1].montoTotal;
				pos := i; 
			end; 
		end;
	end; 
	min.codProdL := minimo; 
	min.montoTotalL := minimoMonto; 

	if(minimo<>999)then
		BorraPos(v[pos].vector, v[pos].dimL, 1)
	else
		 ok:=false;
End;

Procedure mergeAcumulador (V : vectorSucursal ; var L : Lista); 
Var 
	min : ventaLista ; 
	ult : lista; 
	act : integer;  
	minT : real;
	ok : boolean; 
Begin 
	minimo (v , min , ok ); 
	while (ok) do Begin
		act := min.cod; 
		minT := 0; 
		while (act = min.codProdL) do begin 
			minT := minT + min.montoTotalL ; 
			Minimo (V , min , ok );
		end; 
		agregarAtrar (L , ult , minT , act); 
	end; 
End;

// punto b 
procedure menorA ( L : lista ; var cant : integer); 
Begin 
	if ( L <> nil ) then begin 
		if (L^.dato.montoTotalL < limInferior) then 
			cant := cant + 1; 
		menorA (L^.sig , cant); 
	end; 
End; 

// modulos para imprimir 
procedure imprimirLista ( L : Lista);
begin
  while ( L <> nil ) do Begin
	writeln ('Codigo: ', L^.dato.codProdL ,' $', L^.dato.montoTotalL:2:2);
    L := L^.sig;
  end;
End;

procedure imprimirVectorVentas (v : sucursal );
var
	i : integer;
begin
	for i:= 1 to v.dimL do 
		writeln('codigo ', v.vector[i].codProd ,'. Cantidad vendida', v.vector[i].cantVentas, ' . $', v.vector[i].montoTotal:2:2);
end;

procedure imprimirVector (v : vectorSucursales);
var
	i : integer;
begin
	for i:=1 to limSucursales do begin
		writeln ('Sucursal numero', i,':');
		imprimirVectorVentas(v[i]);
	end;
end;
{--------------------------- PROGRAMA PRINCIPAL ---------------------}
Var
	VectorS : vectorSucursal;
	L    : lista;
	cant : integer; 
Begin
	cant := 0; 
	L := nil; 
	cargarVectorSucursales (VectorS);
	imprimirVector (VectorS); 
	mergeAcumulador (VectorS , L);
	imprimirLista (L); 
	menorA (l , cant);
	writeln ('La cantidad de productos que no superan los $300.000 son ', cant);
	readln; 
End.