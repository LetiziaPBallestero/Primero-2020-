{MODULOS LISTAS}

{DECLARACION LISTA}

	elemento=record
		cod:integer;
	end;
	lista=^nodo;
	nodo=record
		datos: elemento;
		sig: lista;
	end;
	
	
{CREAR LISTA Y AGREGAR ADELANTE}

Procedure CrearListaAgregarAdelante(var L:lista);
	Procedure AgregarAdelante(var L:lista; elem:elemento);
	var 
		nue:lista;
	begin
		new(nue);
		nue^.datos:=elem;
		nue^.sig:=L;
		L:=nue;
	end;
{CrearListaAgregarAdelante body}
var 
	E:elemento;
begin
	L:=nil;
	{MODULO PARA LEER DATOS}
	while()do begin {CONDICION DE CORTE DE LECTURA}
		AgregarAdelante(L, E);
		{MODULO PARA LEER DATOS}
	end;
end;	

{CREAR LISTA Y AGREGAR ATRAS}

Procedure CrearListaAgregarAtras(var L:lista);
	Procedure AgregarAtras (var pri:lista; var ult: lista; elem: elemento); {CAMBIAR TIPO DE ELEM}
	var
		nue : lista;
	begin
		new (nue);
		nue^.datos:= elem;
		nue^.sig := NIL;
		if (pri <> nil) then
			ult^.sig := nue
		else
			pri := nue;
		ult := nue;
	end;

{CrearListaAgregarAtras body}
var
	E:elemento; {CAMBIAR TIPO}
	ult:lista;
begin
	L:=nil;
	Leer(E);{MODULO PARA LEER DATOS}
	while()do begin {CONDICION DE CORTE DE LECTURA}
		AgregarAtras(L,ult,E);
		Leer(E);{MODULO PARA LEER DATOS}
	end;
end;
 
{CREAR LISTA ORDENADA}
Procedure CrearListaOrdenada(var L:lista);
	Procedure InsertarEnLista ( var pri: lista; elem: elemento); {CAMBIAR TIPO DE ELEM}
	var
	  ant, nue, act: lista;
	begin
	  new (nue);
	  nue^.datos := elem;
	  act := pri;
	  while (act<>NIL) and (act^.datos.cod < elem.cod) do begin {CAMBIAR DEPENDIENDO LA CONDICION DE ORDEN}
		ant := act;
		act := act^.sig ;
	  end;
	  if (act = pri)  then
		pri := nue
	  else
		ant^.sig := nue;
	  nue^.sig := act ;
	end;
 
 {CrearListaOrdenada body}
var
	E:elemento; {CAMBIAR TIPO} 
begin
	L:=nil;
	Leer(E);{MODULO PARA LEER DATOS}
	while()do begin {CONDICION DE CORTE DE LECTURA}
		InsertarEnLista(L,E);
		Leer(E);{MODULO PARA LEER DATOS}
	end;
end;

{ELIMINAR EN UNA LISTA}

Procedure EliminarElementoLista(L:lista);
	Procedure BorrarElemento (var pri:lista; valor:integer; var exito: boolean); {SI ES NECESARIO CAMBIAR TIPO DE VALOR}
	var 
		ant, act: lista;
	begin
		exito := false;
		act := pri;
		while  (act <> NIL)  and (act^.datos.cod <> valor) do begin
			ant := act;
			act := act^.sig
		end;
		if (act <> NIL) then begin
			exito := true;
			if (act = pri) then
				pri := act^.sig
			else
				ant^.sig:= act^.sig;
			dispose (act);
		end;
	end;

{EliminarElementoEnLista body}
var
	ok:boolean; 
	valor:integer; {CAMBIAR TIPO DE VALOR SI ES NECESARIO}
begin
	write('Ingrese valor a buscar y eliminar: ');
	readln(valor);
	BorrarElemento(L,valor,ok);
end;

{ELIMINAR EN LISTA ORDENADA}

Procedure EliminarElementoEnListaOrdenada(var L:Lista);
	Procedure BorrarElementoEnOrden (var pri:lista; valor:integer; var exito: boolean); {CAMBIAR TIPO DE VALOR SI ES NECESARIO}
	var
		ant,act: lista;
	begin
		exito := false;
		ant := pri;
		act := pri;
		while  (act <> NIL)  and (act^.datos.cod < valor) do begin
			ant := act;
			act := act^.sig
		end;
		if (act^.datos.cod > valor)or(act = NIL) then
			exito := false
		else begin
			exito := true;
			if (act = pri) then
				pri := act^.sig
			else
				ant^.sig:= act^.sig;
			dispose (act);
		end;
	end;

{EliminarElementoEnListaOrdenada body}

var
	valor:integer; {CAMBIAR TIPO DE VALOR SI ES NECESARIO} 
	ok:boolean;
begin
	write('Ingrese un valor a borrar de la lista: '); 
	readln(valor);
	BorrarElementoEnOrden(L,valor,ok);
	if(ok)then
		writeln('Se elimino la primera ocurrencia del valor ', valor,' con exito de la lista')
	else
		writeln('No se encontro el valor ingresado');
end;

{IMPRIMIR UNA LISTA}

Procedure ImprimirLista(L:Lista);
begin
  while(L<>nil)do begin
    writeln(L^.datos.cod); {CAMBIAR DEPENDIENDO DE QUE HAY QUE IMPRIMIR}
    L:=L^.sig;
  end;
end;

{BUSCAR EN UNA LISTA}

Function BuscarEnLista (pri: lista; x:string):boolean; {CAMBIAR TIPO DE "X" SI ES NECESARIO}
var
	encontre: boolean;
begin
	encontre := false;
	while (not encontre) and (pri <> NIL) do
		if x = pri^.datos.nom then 
			encontre:= true
		else
			pri:= pri^.sig;
	BuscarEnLista := encontre
end;

{IMPRIMIR LISTA EN ORDEN DE GUARDADO - RECURSIVO}

Procedure ImprimirEnOrden (L:lista);
begin
	if(L<>nil)then begin
		 writeln(L^.datos.cod); {CAMBIAR DEPENDIENDO QUE HAY QUE IMPRIMIR}
	  	 ImprimirEnOrden(L^.sig);
	end;
end;
 
{IMPRIMIR LISTA EN ORDEN INVERSO - RECURSIVO}
 
Procedure ImprimirOrdenInverso(L:lista);
begin
	 if(L<>nil)then begin
		ImprimirOrdenInverso(L^.sig);
		writeln(L^.datos.cod); {CAMBIAR DEPENDIENDO QUE HAY QUE IMPRIMIR}
	 end;
end;


{DATO MAXIMO DE UNA LISTA - RECURSIVO}

Procedure MaximoR(L:lista;var max:integer); {CAMBIAR DEPENDIENDO DEL TIPO DE DATO MAXIMO QUE HAYA QUE ENCONTRAR}
begin
	if(L<>nil)then begin 
		if(L^.datos.cod>max)then {CAMBIAR DEPENDIENDO DE QUE VALOR MAXIMO HAY QUE BUSCAR}
			max:=L^.datos.cod;
		MaximoR(L^.sig, max);
	end;
end;

{DATO MINIMO DE UNA LISTA - RECURSIVO}

Procedure MinimoR(L:lista;var min:integer); {CAMBIAR DEPENDIENDO DEL TIPO DE DATO MINIMO QUE HAYA QUE ENCONTRAR}
begin        
	if(L<>nil)then begin 
		if(L^.datos.cod<min)then {CAMBIAR DEPENDIENDO DE QUE VALOR MINIMO HAY QUE ENCONTRAR}
			min:=L^.datos.cod;
		L:=L^.sig;
		MinimoR(L, min);
	end;
end;

{BUSCAR EN LISTA - RECURSIVO}

Function BuscarEnListaRecursivo(L:lista; dato:integer):boolean;
begin
	if(L=nil)then
		BuscarEnListaRecursivo:=false
	else
		if(dato=L^.datos.cod)then {CAMBIAR DEPENDIENDO DEL CAMPO DEL REGISTRO DATOS QUE HAYA QUE BUSCAR}
			BuscarEnListaRecursivo:=true
		else 
			BuscarEnListaRecursivo:=BuscarEnListaRecursivo(L^.sig,dato);
end;

{MERGE}{LISTAS}

Procedure Merge(L1,L2:lista; var L:lista);
	Procedure AgregarAtras (var pri:lista; var ult: lista; elem: DATO); {CAMBIAR TIPO DE ELEM}
	var
		nue : lista;
	begin
		new (nue);
		nue^.datos:= elem;
		nue^.sig := NIL;
		if (pri <> nil) then
			ult^.sig := nue
		else
			pri := nue;
		ult := nue;
	end;

	Procedure Minimo(var E1,E2:lista; var min:DATO); {CAMBIAR TIPO DE DATO DE MIN}
	begin
		min := ‘ZZZ’; {CAMBIAR DEPENDIENDO DEL TIPO DE DATO}
		if (e1 <> nil) and (e2 <> nil)then
			if (e1^.dato <= e2 ^.dato ) then 
			begin
				min:= e1^.dato;
				e1:= e1 ^.sig; 
			end; 
		else begin
			min:= e2 ^.dato;
			e2:= e2 ^.sig;
		end 
		else (e1 <> nil) and (e2 = nil) then begin
			min:= e1^.dato;
			e1:= e1 ^.sig;
		end 
		else (e1 = nil) and (e2 <> nil) then begin
			min:= e2 ^.dato;
			e2:= e2 ^.sig; 
		end;
	end;

{MERGE DE LISTAS BODY}
var
	min:DATO; {CAMBIAR TIPO DE DATOS} 
	ult:lista; 
begin
	L:=nil;
    ok:=true;
    Minimo(L1,L2, min);
    while( min.nom <> 'ZZZ' )  do begin {CAMBIAR DEPENDIENDO DEL TIPO DE DATO}
        AgregarAtras(L,ult,min);
        Minimo(L1,L2, min);
    end;
end;

{MERGE ACUMULADOR - VECTOR DE LISTAS}


Procedure MergeAcumulador(V:vector; var L:lista2);
	Procedure AgregarAtras (var pri:lista2; var ult: lista2; t:real; tipo:string); {CAMBIAR DATOS DE TIPO Y T}
	var
		nue : lista2;
	begin
		new (nue);
		nue^.datos.tipo:= tipo;
		nue^.datos.total:= t;
		nue^.sig := NIL;
		if (pri <> nil) then
			ult^.sig := nue
		else
			pri := nue;
		ult := nue;
	end;

	Procedure ActualizarLista(var L:lista);
	begin
		L:=L^.sig;
	end;
  
	Procedure Minimo(var v:vector; var min:consumoT; var ok:boolean); {CAMBIAR TIPO DE MIN}
	var 
		pos:integer;
		i:integer; 
		minimo:string; {CAMBIAR DEPENDIENDO DEL PROBLEMA}
		minimoMonto:real; {CAMBIAR DEPENDIENDO DEL MINIMO}
	begin
		minimo:='zzz'; {CAMBIAR DEPENDIENDO TIPO DE DATOS}
		for i:= 1 to DimF do begin {DIMF ES EL TAMAÑO DEL VECTOR DE LISTAS}
			if(v[i]<>nil)then
				if(V[i]^.datos.tipo<minimo)then begin {CAMBIAR DEPENDIENDO DEL CAMPO DE LA LISTA QUE NECESITEMOS EL MINIMO}
					minimo:=V[i]^.datos.tipo;  {CAMBIAR DEPENDIENDO DEL CAMPO DE LA LISTA QUE NECESITEMOS EL MINIMO}
					minimoMonto:=V[i]^.datos.monto;  {CAMBIAR DEPENDIENDO DEL CAMPO DE LA LISTA QUE NECESITEMOS EL MINIMO}
					pos:=i;
				end;	
		end;
        min.tipo:=minimo;
		min.total:=minimoMonto;
		if(minimo<>'zzz')then  {CAMBIAR DEPENDIENDO TIPO DE DATOS}
			ActualizarLista(V[pos])
		else
			ok:=false
	end;
  
var
	min:consumoT; {CAMBIAR TIPO DE MIN}
	ult:lista2; 
	ok:boolean; 
	act:string; {CAMBIAR DEPENDIENDO DEL PROBLEMA}
	minT:real; {CAMBIAR DEPENDIENDO TIPO DE DATOS}
begin
	L:=nil;
    ok:=true;
	Minimo(v, min,ok);
    while( ok )  do begin
		act:=min.tipo;
		minT:=0;
		while(act=min.tipo)do begin
			minT:=minT+min.total;
			Minimo(v, min, ok);
		end;
		AgregarAtras(L,ult,minT,act);
	end;
end;


{MERGE}{VECTOR DE LISTAS}


Procedure Merge(var v:vector; dimL:integer; var L:lista);
	Procedure AgregarAtras (var pri:lista; var ult: lista; elem: elemento2); {CAMBIAR TIPO DE ELEM}
	var
		nue : lista;
	begin
		new (nue);
		nue^.datos:= elem;
		nue^.sig := NIL;
		if (pri <> nil) then
			ult^.sig := nue
		else
			pri := nue;
		ult := nue;
	end;

	Procedure ActualizarLista(var L:lista);
	var
		act:lista;
	begin
		act:=L;
		L:=L^.sig;
		dispose(act);
	end;


	Procedure Minimo(var v:vector; DimL:integer; var min:elemento2; var ok:boolean);
	var
		pos:integer; 
		i:integer; 
		minimo:integer; {CAMBIAR DEPENDIENDO DEL PROBLEMA}
	begin 
		minimo:=999; {CAMBIAR DEPENDIENDO TIPO DE DATOS}
		for i:= 1 to DimL do begin
			if(v[i]<>nil)then
				if(V[i]^.datos.cod<minimo)then begin {CAMBIAR .COD POR EL CAMPO QUE NECESITEMOS}
					minimo:=V[i]^.datos.cod;  {LO MISMO DE ARRIBA}
					pos:=i;
				end;
		end;
		min.cod:=minimo;
		if(minimo<>999)then
			ActualizarLista(v[pos])
		else
			ok:=false;
	end;

var
	min:elemento2; {CAMBIAR TIPO DE DATO} 
	ult:lista; 
	ok:boolean;
begin
    L:=nil;
    ok:=true;
    Minimo(v, dimL, min,ok);
    while( ok ) do begin
        AgregarAtras(L,ult,min);
        Minimo(v, dimL, min, ok)
    end;
end;


{CREAR VECTOR DE LISTAS}

Procedure CrearListas(var V:vector);
	Procedure InsertarEnLista ( var pri: lista; elem: ELEMENTO); {CAMBIAR TIPO DE DATO DE ELEM}
	var
		ant, nue, act: lista;
	begin
		new (nue);
		nue^.datos := elem;
		act := pri;
		while (act<>NIL) and (act^.datos.tipo < elem.tipo) do begin {CAMBIAR DEPENDIENDO DE CAMPO DEL REGISTRO POR EL QUE HAYA QUE ORDENAR}
			ant := act;
			act := act^.sig ;
		end;
		if (act = pri)  then
			pri := nue
		else
			ant^.sig := nue;
		nue^.sig := act ;
	end;

	Procedure LeerDatos(var E:ELEMENTO); {CAMBIAR TIPO DE DATOS}
	begin
		write('INGRESAR DATO: ');
		readln(E.tipo); {CAMBIAR NOMBRE DE VARIABLE DEPENDIENDO DEL REGISTRO XD}
		if(E.tipo <> 'N') then begin {CONDICION DE CORTE}
			write('INGRESAR DATO: ');
			readln(E.DATO); {CAMBIAR NOMBRE DE VARIABLE DEPENDIENDO DEL REGISTRO XD}
			write('INGRESAR DATO: ');
			readln(E.DATO); {CAMBIAR NOMBRE DE VARIABLE DEPENDIENDO DEL REGISTRO XD}
		end;	
	end;

Var
   i:integer;
   E: ELEMENTO; {CAMBIAR TIPO DE DATOS}
begin
	for i:=1 to dimF do begin {DIMF ES EL TAMAÑO MAXIMO DEL VECTOR DE LISTAS}
		writeln('Lista Actual:  ', i);
		LeerDatos(E);
		while(E.tipo <> 'N')do begin {CONDICION DE CORTE}
			InsertarEnLista(V[i],E); {PUEDE IR CUALQUIER AGREGAR EN LISTA, ESTE ES ORDENADO}
			LeerDatos(E);
		end;
    end;
end;


Procedure CrearVectorListas(var V:vector);
	Procedure InicializarListasDelVector(var V:vector);
	var
		i:integer;
	begin
		for i:=1 to DimF do {DIMF ES EL TAMAÑO MAXIMO DEL VECTOR DE LISTAS}
			V[i]:=nil;
	end;

Begin
	InicializarListasDelVector(V);
	CrearListas(V); 
End;


{GEN LISTA A PARTIR DE ARBOL}

Procedure CrearListaOrdenadaAPartirDeArbol(a:arbol; var L:lista);
	Procedure InsertarEnLista ( var pri: lista; elem: elemento); {CAMBIAR TIPO DE ELEM}
	var
		ant, nue, act: lista;
	begin
		new (nue);
		nue^.datos := elem;
		act := pri;
		while (act<>NIL) and (act^.datos.TIPO < elem.TIPO) do begin {CAMBIAR DEPENDIENDO DE CAMPO DEL REGISTRO POR EL QUE HAYA QUE ORDENAR}
			ant := act;
			act := act^.sig ;
		end;
		if (act = pri)  then
			pri := nue
		else
			ant^.sig := nue;
		nue^.sig := act ;
	end;

  Procedure CrearListaOrdenadaRecursivo(a:arbol; var L:lista);
  begin
    if(a<>nil)then begin
      InsertarEnLista(L,a^.elem); {elem o datos}
      CrearListaOrdenadaRecursivo(a^.hijoIzq,L);
      CrearListaOrdenadaRecursivo(a^.hijoDer,L);
    end;
  end;
{crearlistaOrdenadaAPartirDeArbol}

begin
   L:=nil;
   CrearListaOrdenadaRecursivo(a,L);
end;



