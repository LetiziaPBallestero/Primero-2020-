{MODULOS ARBOLES}

{ARBOLES DECLARACION}

  elemento=record
  
  end;
  arbol = ^nodoA;
  nodoA = record
           datos: elemento;
           hijoIzq: arbol;
           hijoDer: arbol;
  end;

{INSERTAR EN ARBOL}

Procedure Insertar(var a:arbol; d:elemento);
begin
  if(a=nil) then begin
     new(a);
     a^.datos:=d;
     a^.hijoIzq:=nil;
     a^.hijoDer:=nil;
  end
  else begin
     if(a^.datos>=d) then
        insertar(a^.hijoIzq,d)
     else
        insertar(a^.hijoDer,d);
  end;
end;
Procedure CrearABB(var a:arbol);
Procedure LeerDato(var D:elemento);
Begin
	write('Ingresar datos: ');
	readln(D);
end;

var
	D:elemento;
begin
	LeerDato(D);
	while(D<>-1)do begin {condicion de corte}
		Insertar(a,D);
		LeerDato(D);
	end;
end;


{ARBOL - IMPRIMIR}

{SUBA izq - RAIZ - SUBA der}

Procedure preOrden(a:arbol);
begin
	 if(a<>nil)then begin
 		writeln(a^.elem);
		preOrden(a^.hijoIzq);
		preOrden(a^.hijoDer);
	 end;
end;


{RAIZ - SUBA izq - SUBA der}

Procedure enOrden(a:arbol);
begin
	 if(a<>nil)then begin
		enOrden(a^.hijoIzq);
		writeln( a^.elem);
		enOrden(a^.hijoDer);
	 end;
end;

{SUBA izq - SUBA der - Raiz}

Procedure PostOrden(a:arbol);
begin
	 if(a<>nil)then begin
		PostOrden(a^.hijoIzq);
		PostOrden(a^.hijoDer);
        writeln( a^.elem);
	 end;
end;


{ARBOL - BUSQUEDA}


Function busqueda(T:arbol; y: integer):arbol;
begin
  if (T=nil) or (T^.datos=y) then
     busqueda:=T
  else
     if (T^.datos<y) then
        busqueda:=busqueda(T^.hijoDer,y)
     else
        busqueda:=busqueda(T^.hijoIzq,y);
end;

Procedure BuscareInformar(a:arbol);
var
    valor:integer;
begin
	write('Ingrese un valor a Buscar: ');
	readln(valor);
	if(busqueda(a,valor)=nil)then
		writeln('No se Encontro')
	else
		writeln('Se encontro el valor');
end;



{ARBOL - MAX Y MIN}


Procedure verMin(a:arbol; var min:integer);
Begin
    If (a<>nil) then
        if (a^.datos < min)then begin
            min:=a^.datos;
            verMin(a^.hijoIzq, min);
        end;
End;

Procedure verMax(a:arbol; var max:integer);
Begin
    If (a<>nil) then
        if (a^.datos > max)then begin
            max:=a^.datos;
            verMax(a^.hijoDer, max);
        end
End;


{CONTAR CANT REPETIDOS EN ARBOL}


Procedure ContarRepetidos(a:arbol);
procedure Contar(a:arbol; valor:integer; var cant:integer);
begin
	if(a<>nil)then begin
		if(a^.datos=valor)then
			cant:=cant+1;
		contar(a^.hijoIzq,valor,cant);
        contar(a^.hijoDer,valor,cant)
    end;
end;

var
	valor:integer; cant:integer; aux:arbol;
begin
	cant:=0;
    write('Ingrese un valor para ver cuantas veces esta en el arbol: ');
    readln(valor);
	aux:=busqueda(a,valor);
	if(aux<>nil)then begin
		cant:=cant+1;
		Contar(aux^.hijoIzq,valor,cant);
	end;
	if(cant=0)then
		writeln('No se encontro el valor.')
	else
        if(cant = 1)then
            writeln('El valor esta ', cant,' vez.')
        else
		      writeln('El valor esta ', cant,' veces.');
end;

{GEN LISTA A PARTIR DE ARBOL}

Procedure CrearListaOrdenada(a:arbol; var L:lista);
  Procedure InsertarEnLista ( var pri: lista; elem: elemento);
  var
    ant, nue, act: lista;
  begin
    new (nue);
    nue^.datos := elem;
    act := pri;
    while (act<>NIL) and (act^.datos.fab < elem.fab) do begin
      ant := act;
      act := act^.sig ;
    end;
    if (act = pri)  then
      pri := nue
    else
      ant^.sig := nue;
    nue^.sig := act ;
  end;

  Procedure crearlistaordenadaRec(a:arbol; var L:lista);
  begin
    if(a<>nil)then begin
      InsertarEnLista(L,a^.elem);
      CrearListaOrdenadaRec(a^.hijoIzq,L);
      CrearListaOrdenadaRec(a^.hijoDer,L);
    end;
  end;

begin
   L:=nil;
   crearlistaordenadaRec(a,L);
end;


{RECORRER ARBOL CONTALIZANDO VALORES MENORES AL QUE ME PASAN POR PARAMETRO}
procedure RecorrerABBCantMenores(a:arbol; valor:integer; var cant:real);
begin
	if(a<>nil)then begin
		if(a^.datos.cod <= valor)then
			RecorrerABBCantMenores(a^.hijoDer,valor,cant)		
		else begin
			cant:=cant+ a^.datos.total;
			RecorrerABBCantMenores(a^.hijoIzq, valor, cant);
			RecorrerABBCantMenores(a^.hijoDer, valor, cant);
		end;
    end;
end;	

{RECORRER ARBOL CONTALIZANDO VALORES MAYORES AL QUE ME PASAN POR PARAMETRO}
procedure RecorrerABBCantMayores(a:arbol; valor:integer; var cant:real);
begin
	if(a<>nil)then begin
		if(a^.datos.cod >= valor)then
			RecorrerABBCantMayores(a^.hijoIzq,valor,cant)		
		else begin
			cant:=cant+ a^.datos.total;
			RecorrerABBCantMayores(a^.hijoIzq, valor, cant);
			RecorrerABBCantMayores(a^.hijoDer, valor, cant);
		end;
    end;
end;	

{CREAR ARBOL BINARIO A PARTIR DE LISTA ORDENADA}

procedure InsertarArbol(var a:arbol; v:totalventa);
begin
	if(a=nil) then begin
		new(a);
		a^.datos:=v;
		a^.hijoIzq:=nil;
		a^.hijoDer:=nil;
	end
	else begin
		if(a^.datos.cod>v.cod) then
			InsertarArbol(a^.hijoIzq,v)
		else
			InsertarArbol(a^.hijoDer,v);
	end;
end;

procedure RecorrerLista(var l:lista; var tv:totalventa); 
var
	total:real;
begin
	tv.cod:=l^.datos.cod;
	total:=0;
	while(l<>nil)and(l^.datos.cod = tv.cod) do begi		
		total := total + l^.datos.montoT;
		l:=l^.sig;
	end;
	tv.total:=total;
end;


Procedure CrearABB(var a:arbol; l:lista);
var
	tv:totalventa; {RECORD DEL ARBOL}
begin
    a:=nil;	
	repeat
		RecorrerLista(l,tv);
		InsertarArbol(a,tv);
	until(l=nil);
end;