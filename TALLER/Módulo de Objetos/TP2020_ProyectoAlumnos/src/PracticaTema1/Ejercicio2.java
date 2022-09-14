package PracticaTema1;

import PaqueteLectura.Lector;

public class Ejercicio2 {
     public static void main (String[] args) {
         int fac , i , j;
         System.out.println ("Comenzaremos ...");
         for (i=1 ; i<=9 ; i++) {
             j = i;
             fac = 1;
             while (j !=0 ) {
                 fac = j * fac;
                 j--;
             }            
             System.out.println ("El factorial de " + i + "es " + fac);
             }
     }
}

/*              for (j=1 ; j<=i ; j++) {
                 fac = fac * j;
                 } */ 