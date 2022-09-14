/*Un edificio de oficinas está conformado por 8 pisos y 4 oficinas por piso. 
Realice un programa que permita informar la cantidad de personas que 
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de 
personas al edificio de la siguiente manera: a cada persona se le pide el nro. 
de piso y nro. de oficina a la cual quiere concurrir. La llegada de personas 
finaliza al indicar un nro. de piso 9. Al finalizar la llegada de personas, informe lo pedido. */
package PracticaTema1;
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;


public class Ejercicio5 {
     public static void main (String [] args ) {
         GeneradorAleatorio.iniciar();
         int dimF = 8; // pisos , filas 
         int dimC = 4; // oficinas , columnas
         
         int [][] edificio = new int [dimF][dimC]; // la matriz q rep. al edificio
         
         System.out.println ("Comenzara a llegar gente ...");
         int piso , oficina; // esto es el nro que se le pide
         System.out.println ();
         System.out.println ("Ingrese el piso al cual quiere ingresar");
         piso = Lector.leerInt();
         while (piso != 8) {
             System.out.println ("Oficina a la cual desea ingresar");
             oficina = Lector.leerInt();
             edificio[piso][oficina] ++; // funciona como contador, ahí le agrego uno
             System.out.println ("Ingrese el piso al cual quiere ingresar");
             piso = Lector.leerInt(); }
         
         int f , c; 
         for (f = 0 ; f < dimF ; f++) {
             for (c = 0 ; c < dimC ; c++) {
                 System.out.println ("Llegaron " + edificio[f][c] + " personas al piso " + f + " y la oficina " + c );
             }
         }
     }
}
    
 
    
    

