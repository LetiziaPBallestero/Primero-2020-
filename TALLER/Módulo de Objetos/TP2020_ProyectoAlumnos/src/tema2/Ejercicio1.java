/* Se dispone de una clase Persona (ya implementada en la carpeta tema2). 
Un objeto persona puede crearse sin valores iniciales o enviando en el 
mensaje de creación el nombre, DNI y edad (en ese orden). 
Un objeto persona responde a los siguientes mensajes:

Realice un programa que cree un objeto persona con datos leídos desde teclado. 
Luego muestre en consola la representación de ese objeto en formato String.
Piense y responda: ¿Qué datos conforman el estado del objeto persona? 
¿Cómo se implementan dichos datos? ¿Qué ocurre cuando se le envía un mensaje al objeto? */ 


package tema2;

import PaqueteLectura.Lector;

public class Ejercicio1 {
     public static void main (String [] args) { 
         // declaro .... 
          String nombre = Lector.leerString (); // nombre 
          int dni = Lector.leerInt (); // dni 
          int edad = Lector.leerInt (); // edad 
          Persona personita = new Persona (nombre, dni, edad); // objeto 
          
          Persona p = new Persona (); // construyo un vacio 
          p.setDNI (dni);
          p.setNombre (nombre);
          p.setEdad (edad);
          
          Persona a = new Persona ();
          a.setDNI (dni);
          a.setNombre (nombre);
          p.setEdad (edad);
          
          System.out.println(p.toString());
          System.out.println(a.toString());
     }
}
