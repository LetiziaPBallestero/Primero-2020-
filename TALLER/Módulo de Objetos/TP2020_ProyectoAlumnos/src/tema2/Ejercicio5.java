/* Realice un programa que cargue un vector con 10 strings leídos desde teclado. 
El vector generado tiene un mensaje escondido que se forma a partir de la primera 
letra de cada string. Muestre el mensaje escondido en consola.

NOTA: La primera letra de un string se obtiene enviándole el mensaje charAt(0) 
al objeto string. Probar con: humo oso lejos ala menos usado nene de ocho ! 
Debería imprimir: holamundo!
*/

package tema2;

import PaqueteLectura.Lector;

public class Ejercicio5 {
     public static void main (String [] args) { 
         int dimF = 10;
         String[] aaa = new String[dimF]; // el vector de las palabras, declarado y creado 
         
         int i; 
         for (i = 0 ; i < dimF ; i++) {
             System.out.println ("¿Qué palabra desea poner?");
             aaa[i] = new String (Lector.leerString());
         }
         
         for (i = 0 ; i < dimF ; i++) {
             System.out.print (aaa[i].charAt(0));
         }
     }
}
    

