package PracticaTema1;
// NO SON ALTURAS REALES PORQUE EL ALEATORIO ME ODIA UN POQUITO, PERO BUENO 
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio3 {
     public static void main(String [] args ) {
         GeneradorAleatorio.iniciar(); // me da paja cargar las alturas 
         double [] vectorJugadores; //Vector de jugadores declarado 
         vectorJugadores = new double [14]; // Vector jugadores creado
         int i; // variable indice
         double num , prom , suma; // variables de altura y para sumar 
         suma = 0;
         for (i=0 ; i<14 ; i++) { //carga de datos y suma de alturas 
             System.out.println ("Ingresar altura");
             // num = Lector.leerDouble (); // leo la altura manualmente 
             num = GeneradorAleatorio.generarDouble(2); //  genero aleatoriamente la altura
             vectorJugadores[i] = num; // cargo la altura 
             suma = suma + num; // sumo las alturas 
         }
         prom = suma / 15; // la altura promedio
         System.out.println ("La altura promedio es de " + prom ); // informo el promedio
         double altAux; // declaro la variable que usaré para las alturas fuera del promedio

         for (i=0 ; i<14 ; i++) {
             altAux = vectorJugadores [i]; // le doy contenido a altura auxiliar
             if (altAux > prom) { // Si la altura auxiliar es mayor que el promedio 
                 System.out.println (altAux + "es mayor que el promedio");    
             } 
         }    
     }
}