package PracticaTema1;
// Corregido en clase.
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio4 {
     public static void main (String [] args ) {
         GeneradorAleatorio.iniciar ();
         int [][] matriz; // Definí matriz
         matriz = new int [9][9]; // cree la matriz 
         System.out.println ("Se cargara la matriz"); // carga de matriz
         int f , c; 
         for (f=0 ; f<9 ; f++) {
             for (c=0 ; c<9 ; c++) {
                 matriz [f][c] = GeneradorAleatorio.generarInt(200);
             }
         }
         System.out.println ();
         System.out.println ("La carga se realizo, a continuacion se mostraran los elementos");
         for (f=0 ; f < 9 ; f++) { // se imprimirá los elementos de la matriz
             for (c=0 ; c < 9 ; c ++) {
                 System.out.print( matriz [f][c] + " ");
             }
         }
         System.out.println (); 
          // Ahora voy a realizar la suma de todos los elementos de las filas 2, 9 y columnas 0 y 3
         int suma = 0; // inicializo la suma 
         for (f=0 ; f<=3 ;f++) {
             for (c=0 ; c<9 ; c++)
                 suma = suma + matriz [f][c]; } 
         System.out.println ("La suma de las filas 2 y 9, y las colmunas 0 y 3 es: " + suma);
         
         System.out.println ();
         int sumaColumna; // la variable que tendrá la suma de mi columna
         int [] vector; // declaro  el vector 
         vector = new int [9]; // creo el vector 
         for (f=0 ; f<9 ; f++) { // recorro la fila 
             sumaColumna = 0; // para cada fila recorrida, la suma de la columna arranca en 0
             for (c=0 ; c<9 ; c++) { // recorro toda la columna 
                 sumaColumna = sumaColumna + matriz [f][c];} // sumo esa columna
             vector [f] = sumaColumna;  // la pongo en el vector 
         }
         for (f=0 ; f<9 ; f++) { // imprimo el vector resultante 
             System.out.print ( vector [f] + " ");
         }
         
         System.out.println ();
         boolean encontre = false; // esta variable es para decirte si lo encontre o no
         int num , posC = 0 , posF = 0; // numero a encontrar 
         f = 0; 
         c = 0;
         System.out.println ("Ingrese el numero a buscar");
         num = Lector.leerInt();
         while ((encontre != true) && (f<9)) {
             while ((encontre != true) && (c < 9)) {
                 if (matriz [f][c] == num) {
                     encontre = true; 
                     posC = c ; 
                     posF = f;}
                 c++;
                 }
             f++;
             }
         if (encontre == true) {
             System.out.println ("El numero ingresado (" + num + ") se encontro en la fila " + posF + " y la columna " +  posC);
         }
         else 
             System.out.println ("No se encontro el nunero ingresado" + num); 
     }    
}
