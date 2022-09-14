{Se lee información acerca de las ventas de productos realizadas en las sucursales de una empresa. 
De cada venta se conoce fecha, código de producto, cantidad vendida y monto total de la venta. 
La lectura finaliza cuando se lee el código de producto -1, el cual no se procesa.

Implementar un programa para que a partir de la información leida, resuelva los siguientes ítems: 

a) Generar un árbol binario de búsqueda ordenado por código de producto, 
donde cada nodo contenga el código del producto y la cantidad total vendida. 
El código de producto no puede repetirse en el árbol. 

b) Realizar un módulo que reciba el árbol generado en a. y dos códigos de producto y retorne la suma de todas las cantidades vendidas para los códigos de productos comprendidos en el rango. 

Nota: La información se lee en forma desordenada. Puede existir mas de una venta para un mismo código de producto.  }

// Nota: En ninguna parte dice que se lee de alguna estructura. Tampoco se hace nada con el monto ni la fecha. Así que me enfoco en el árbol
// modificarlo es bastante fácil. Hacer una lista con el registro como piden, y un repeat-ultil (l = nil) dónde se lea la lista y cargue el árbol
program ParcialV2; 
Const 
	codFin = -1; 
Type 
	ventas = record 
		cod : integer;
		cantV : integer;
		fecha : integer; // lo ideal seria otro registro fecha, pero como no se va a usar...
		montoT : real;  
	end; 

	registro = record 
		codigo : integer; 
		cantidad_ventas : integer; 
	end; 
	
	arbol = ^nodo; 
	nodo = record 
		dato : registro; 
		hi : arbol; 
		hd : arbol; 
	end; 
{ ------------------------------- ZONA DE MODULOS ---------------------}
// armado del arbol 
Procedure Armar_Nodo (Var A : Arbol ; V: ventas);
Begin 
     if (A = nil) then begin 
         new (A); 
         A^.dato.codigo := V.cod;
         A^.dato.cantidad_ventas := V.cantV;  
         A^.hi := nil; 
         A^.hd := nil; 
     end 
     else 
         if (V.cod < A^.dato.codigo) then 
             Armar_Nodo (A^.hi , V)
         else  // así ingresamos sin repetir valor 
             if (V.cod >  A^.dato.codigo) then 
                 Armar_Nodo (A^.hd,V);
End;

Procedure Leer (Var V : Ventas); 
// se lee un registro de 4 campos y solo se pasan dos 
Begin 
	 writeln ('Ingrese el codigo del producto. Para finalizar ingrese -1: '); 
	 readln (V.cod); 
	 if (V.cod <> codFin) then begin
		write ('La cantidad vendida: ');
		readln (V.cantV);
		write ('La fecha: '); 
		readln (V.fecha);
		write ('El monto total de ventas: '); 
		readln (V.montoT); 
	 end; 
End; 

Procedure Armar_Arbol (Var A : Arbol);
Var 
     V : ventas;
Begin 
     Leer (V);
     while (V.cod <> codFin ) do begin 
         Armar_Nodo (A , V );
         Leer (V);
     end; 
End; 
// imprimo para ver que esté todo bien 
Procedure Imprimir ( a : arbol );
begin
   if ( a<> nil ) then begin
    Imprimir (a^.HI);
    write (a^.dato.codigo ,' - ');
    Imprimir (a^.HD);
   end;
End;
// b) Realizar un módulo que reciba el árbol generado en a.
 //y dos códigos de producto y retorne la suma de todas las cantidades vendidas 
 //para los códigos de productos comprendidos en el rango. 
 { --- recorrer rangos --- } 
procedure Recorrer (a:arbol; codMin, codMax: integer ; var cantVendidos : integer);
begin
	if (a <> nil) then begin
		if ((a^.dato.codigo >= codMin) and (a^.dato.codigo <= codMax)) then
			cantVendidos := cantVendidos + A^.dato.cantidad_ventas;
		Recorrer(a^.HI, codMin, codMax , cantVendidos);
		Recorrer(a^.HD, codMin, codMax , cantVendidos);
	end;
end;
 
 
 Procedure buscarRango (A : arbol); 
 Var 
	codMin , codMax , cantVendidos : integer; 
Begin 
	write ('Escribir el codigo por el cual se empezara a buscar ');
	readln (codMin); 
	write ('Escribir el codigo en que finalizara la busqueda ');
	readln (codMax);
	writeln (' ');
	
	cantVendidos := 0;
	Recorrer (A, codMin , codMax , cantVendidos);
	writeln ('La cantidad de productos vendidos entre ', codMin ,' y ', codMax ,' es de: ', cantVendidos);
End; 
{ ---------------------------------------- PROGRAMA PRINCIPAL ---------}
Var 
	A : arbol;
Begin 
	Randomize () ; 
	A := nil;
	Armar_Arbol (A);
	writeln ('---------------------------------------------------------');
	writeln ('Se va a imprimir el arbol para ver que este todo bien :)');
	Imprimir (A);
	writeln ('Matenme si no lo esta');
	writeln ('---------------------------------------------------------');
	buscarRango (A);
End. 
