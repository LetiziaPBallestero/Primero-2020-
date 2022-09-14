/* Se realizará un casting para un programa de TV.
El casting durará a lo sumo 5 días y en cada día se entrevistarán a 8 personas en distinto turno

a) Simular el proceso de inscripción de personas al casting. 
A cada persona se le pide nombre, DNI y edad y se la debe asignar en un día y turno 
de la siguiente manera: 
las personas primero completan el primer día en turnos sucesivos, 
luego el segundo día y así siguiendo. 

La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos de casting.

Una vez finalizada la inscripción:
b) Informar para cada día y turno el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona y pensar en la estructura de datos a utilizar.

 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ejercicio4 {
     public static void main (String [] args) { 
         GeneradorAleatorio.iniciar ();
         int dimF = 5; // dias , acordate que arranca en 0
         int dimC = 8; // turnos 
         int cupoMax = 3; // 40 cupos 
         Persona [][] matrizCasting; // declaro la matriz del casting 
         matrizCasting = new Persona [dimF][dimC]; // creo la matriz 
         
         int cupos = 0; // los cupos que di 
         int f = 0 ; // los dias 
         int c = 0; // blabla
         
         int edad, dni; 
         String nombre; 
         
         Persona personita = new Persona ();
         System.out.println ("Ingresar nombre:");
         nombre = Lector.leerString();
         personita.setNombre (nombre);
         System.out.println ("Ingresar edad:");
         edad = Lector.leerInt();
         personita.setEdad (edad);
         System.out.println ("Ingresar dni:");
         dni = Lector.leerInt();
         personita.setDNI (dni);
         
         while ((cupoMax > cupos) && !(personita.getNombre().equals("ZZZ")) ) {
             if (c == dimC) { // si se completó el día, se pasa al siguiente 
                 c = 0;
                 f ++;
             }
             
             matrizCasting[f][c++] = personita; // le asigno en el mismo día distintos turnos 
             cupos ++; // y lleno los cupos 
             
             // cargo una nueva persona 
             personita = new Persona ();
             System.out.println ("Ingresar nombre:");
             nombre = Lector.leerString();
             personita.setNombre (nombre);
             System.out.println ("Ingresar edad:");
             edad = Lector.leerInt();
             personita.setEdad (edad);
             System.out.println ("Ingresar dni:");
             dni = Lector.leerInt();
             personita.setDNI (dni);
   
         }
         for  (f = 0 ; f < dimF ; f++) {
             for ( c = 0 ; c < dimC ; c++) {
                 System.out.println (matrizCasting[f][c].getNombre() + " tiene turno el día " + (f + 1) + " en el turno " + (c + 1)); } }
         }   
     }    

