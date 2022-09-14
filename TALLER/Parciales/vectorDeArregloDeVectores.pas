program practicoTaller;
const
	DF = 200;
	valor_alto = 9999;
	CANT_SUCURSALES = 5;
type
	ventas = record
		codProducto : integer;
		cantVendida : integer;
		montoTotal  : real;
	end;
	
	vectorVentas = array [1..DF] of ventas;
		
	infoSucursal = record
		datos: vectorVentas;
		dimL: integer;
	end;
		
	ventasPorProducto = record
		codProducto: integer;
		cantVendida: integer;
	end;
		
	lista = ^nodo;
	nodo = record
		dato : ventasPorProducto;
		sig  : lista;
	end;
		
	infoSucursales = array [1..CANT_SUCURSALES] of infoSucursal;
	vectorPosiciones = array[1..CANT_SUCURSALES] of integer;

procedure cargarVector(var v: infoSucursales);
	
	procedure leoRegistro(var v: ventas);
	begin
		with v do begin
			codProducto := random(9)-1;
			writeln('CODIGO DE PRODUCTO: ', codProducto);
			if (codProducto <> -1) then begin
				cantVendida := random(550)+1;
				writeln('CANTIDAD VENDIDA: ', cantVendida);
				montoTotal := random(100) + random(); //Sin parametros para que convierta en real
				writeln('MONTO TOTAL: ', montoTotal:2:2);
			end;
			writeln(' ');
		end;
	end;
	
    procedure CargarInfoSucursal(var sucu: infoSucursal);
    var
		ve: ventas;
    begin
		sucu.dimL := 0;
		leoRegistro(ve);
		while (ve.codProducto <> -1) and (sucu.dimL < DF) do begin
			sucu.dimL := sucu.dimL + 1;//incremento en 1 dimL
			sucu.datos[sucu.dimL] := ve;//insertar en el vector, la venta
			leoRegistro(ve);
		end;
	end;		
var
	i: integer;
begin
	for i:=1 to CANT_SUCURSALES do begin
		CargarInfoSucursal(v[i]);
	end;
end;

///////////////////////////////////////////////////////////////

procedure mergeAcumulador(v: infoSucursales; var listaNueva: lista);

	procedure minimo(var sucus: infoSucursales; var min: ventas;var posActual: vectorPosiciones );
	var
		i, indicemin : integer;
	begin
		min.codProducto := valor_alto;
		for i := 1 to CANT_SUCURSALES do begin
			if (posActual[i] <= sucus[i].dimL ) then
				if (sucus[i].datos[posActual[i]].codProducto < min.codProducto) then begin
					indicemin := i;
					min := sucus[i].datos[posActual[i]];//guardo la venta
				end;
		end;
		if (min.codProducto <> valor_alto) then
			posActual[indicemin] := posActual[indicemin] + 1; //avanzo en el que dio minimo
	end;
	
	procedure agregarAtras(var l, ult: lista; ve: ventasPorProducto);
	var
		aux : lista;
	begin
		new(aux);
		aux^.dato := ve;
		aux^.sig := nil;
		if (l = nil) then
			l := aux
		else
			ult^.sig := aux;
		ult := aux;
	end;
	
var
	datoNuevo : ventasPorProducto;
	min : ventas;
	ult : lista;
	posActual: vectorPosiciones;
	i : integer;
begin
	for i:=1 to CANT_SUCURSALES do
		posActual[i] := 1;
	listaNueva := nil; ult := nil;
	minimo(v, min, posActual);
	while (min.codProducto <> valor_alto) do begin
		datoNuevo.codProducto := min.codProducto;
		datoNuevo.cantVendida := 0;
		while (min.codProducto <> valor_alto) and (min.codProducto = datoNuevo.codProducto) do begin
			datoNuevo.cantVendida := datoNuevo.cantVendida + min.cantVendida;
			minimo(v, min, posActual);
		end;
		agregarAtras(listaNueva, ult, datoNuevo);
	end;
end;

function buscarProductos(l: lista; dato: integer): integer;
begin
	if (l = nil) then
		buscarProductos := 0
	else
		if (dato < l^.dato.cantVendida) then
			buscarProductos := buscarProductos(l^.sig, dato) + 1
		else
			buscarProductos := buscarProductos(l^.sig, dato) + 0;
end;

var
	v : infoSucursales;
	lNue : lista;
	dato : integer;
begin
	Randomize;
	cargarVector(v);
	mergeAcumulador(v, lNue);
	dato := 500;
	writeln('Cantidad de productos que superan las 500 cantidades vendidas: ',buscarProductos(lNue, dato));
end.
