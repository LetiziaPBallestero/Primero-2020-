/* Utilizando la clase Persona (ya implementada). 
Realice un programa que almacene en un vector 15 personas.
La información de cada persona debe leerse de teclado. 
Luego de almacenar la información: 
- Informe la cantidad de personas mayores de 65 años. 
- Muestre la representación de la persona con menor DNI */ 

package tema2;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio2 {
     public static void main (String [] args) { 
         GeneradorAleatorio.iniciar ();
         int finPersonas = 14 ; // 15 personas 
         int edad , dni;  // declaro variables
         String nombre; // declaro variable 
         Persona [] vectorPersonas; // declaro el vector del objeto 
         vectorPersonas = new Persona [finPersonas]; // creo el vector 
         
         System.out.println ("Se cargara el vector de personas con valores random");
         int i;
         for (i = 0 ; i < finPersonas ; i++) { 
             Persona personita = new Persona ();
             nombre = GeneradorAleatorio.generarString (6);
             personita.setNombre (nombre);
             edad = GeneradorAleatorio.generarInt (90);
             personita.setEdad (edad);
             dni = GeneradorAleatorio.generarInt (3000);
             personita.setDNI (dni);
             vectorPersonas [i] = personita; 
             System.out.println(personita.toString());
         }
         
         int sextagenario = 0; // a ver ... tecnicamente es de 65 para arriba PERO BUENO 
         int minDNI = 9999; 
         int pos = 0;
         
         for (i = 0 ; i < finPersonas ; i++) {
             if (vectorPersonas[i].getEdad () > 65) {
                 sextagenario ++;
             }
             if (vectorPersonas[i].getDNI () < minDNI) {
                 minDNI = vectorPersonas[i].getDNI ();
                 pos = i; 
             }
         }
         
         System.out.println ("Personas mayores de 65 años: " + sextagenario);
         System.out.println (vectorPersonas[pos].toString () + " es la persona con menor dni");
     }
}
