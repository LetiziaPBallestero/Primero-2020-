program	dos;
const
	dimf= 8;
type
	codigo=1..dimf;
	pelicula= record
		codpeli:integer;
		codgen: codigo;
		promedio: real;
	end;
	lista= ^nodo;
	nodo=record
		dato: pelicula;
		sig: lista;
	end;
	vector= array [codigo] of lista;
	vector2= array[codigo] of pelicula;


procedure leerpelicula (var p:pelicula);
begin
	write ('codigopelicula:');
	readln (p.codpeli);
	if (p.codpeli <>-1)then begin
		write ('codigo de genero: ');
		readln (p.codgen);
		write ('puntaje: ');
		readln(p.promedio);
	end;
end;

procedure agregaratras (var l,ult:lista; p:pelicula);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:=p;
	nue^.sig:=nil;
	if(l=nil)then
		l:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;

procedure inicializarvector (var v:vector);
var
	i:codigo;
begin
	for i:= 1 to dimf do
		v[i]:=nil;
end;

procedure inicializarvector2 (var v2:vector2);
var
	i:codigo;
begin
	for i:= 1 to dimf do
		v2[i].promedio :=-9999;
end;
	
procedure cargarlista (var v:vector);
var
	p:pelicula;ult:vector;
begin
	inicializarvector(v);
	leerpelicula(p);
	while (p.codpeli <>-1) do begin
		agregaratras (v[p.codgen],ult[p.codgen],p);
		leerpelicula(p);
	end;
end;

procedure llenarvector (v:vector;var v2:vector2);
var
	i:codigo;aux:lista;
begin
	inicializarvector2(v2);
	for I:=1 to DimF do begin
			aux:=v[I];
		while (aux<>nil) do begin
			if (aux^.dato.promedio>v2[I].promedio)then
				v2[I]:=aux^.dato;
			aux:=aux^.sig;
		end;
	end;
end;

procedure ordenarvector (var v2:vector2);
var
	i:codigo;
	actual: pelicula;
	anterior: integer;
begin	
	for i:= 2 to dimf do begin 
		actual := v2[i];
		anterior := i-1;
		while (anterior >0) and (v2[anterior].promedio > actual.promedio) do begin
			v2[anterior +1] := v2[anterior];
			anterior:=anterior-1;
		end;
		v2[anterior+1]:= actual;
	end;
	writeLN('El promedio de menor puntaje de todos los géneros es: ',V2[1].codpeli);
	writeLN('El promedio de mayor puntaje de todos los géneros es: ',V2[DimF].codpeli);
end;

var	
	v:vector;v2:vector2;
begin
	cargarlista(v);
	llenarvector(v,v2);
	ordenarvector(v2);
end.
;
end;

var	
	v:vector;v2:vector2;
begin
	cargarlista(v);
	llenarvector(v,v2);
	ordenarvector(v2);
end.
