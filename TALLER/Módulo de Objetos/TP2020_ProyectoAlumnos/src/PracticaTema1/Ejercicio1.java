package PracticaTema1;

import PaqueteLectura.Lector;

public class Ejercicio1 {
     public static void main (String [] args) {
         int num, i , numN = 0; // i es mi índice, num el numero ingresado y numN el factorial
         System.out.println ("Ingrese un numero para obtejer su factorial");
         num = Lector.leerInt (); // podria inicializar num con int num acá, pero no
         for (i = 1; i<= num; i++) {
             if (numN == 0) {
                 numN = i ;
             }
             else {
                 numN = numN * i; 
             }
         }
         System.out.println ("El factorial de " + num + " es " + numN);
    }
}