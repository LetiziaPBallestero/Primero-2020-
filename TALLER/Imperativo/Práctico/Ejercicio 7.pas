Program Ejercicio_7; 
{ ----------------------------- Módulos ----------------------------- }
Procedure Binario (Num : integer); 
Begin 
     If (num <> 0) then Begin
         Binario (num DIV 2);
         write (num MOD 2);
     end; 
End;
{ ----------------------- Programa principal  ----------------------- }
Var 
     num : integer;
Begin 
     writeln ('Ingrese numero entero para mostrarlo en binario');
     read (num);
     writeln ();
     writeln ('************************************************');
     writeln ('El numerio binario es:');
     writeln ();
     Binario (num);
End. 
