
package Empleados_club;

import PaqueteLectura.GeneradorAleatorio; 
import PaqueteLectura.Lector;

public class Programa {
    public static void main (String[] args) {
        double sBasico = 5000;
        System.out.println ("--------------- ENTRENADOR ----------------"); 
        System.out.println ("Nombre"); 
        int campeonatos = GeneradorAleatorio.generarInt(15);
        Entrenador entrenador = new Entrenador (Lector.leerString() , sBasico , campeonatos);
        System.out.println (entrenador.toString() + " que con el plus queda de " + entrenador.calcularSueldoACobrar() );
        System.out.println ("---- datos aleatorios: "); 
        System.out.println ("Campeonatos: " + campeonatos);
        
        System.out.println ("--------------- JUGADOR ----------------"); 
        System.out.println ("Nombre"); 
        int goles  = GeneradorAleatorio.generarInt(40);
        int partidos = GeneradorAleatorio.generarInt (15);
        Jugadores jugador = new Jugadores (Lector.leerString() , sBasico , partidos , goles);
        System.out.println (jugador.toString() + " que con el plus queda de " + jugador.calcularSueldoACobrar() );
        System.out.println ("---- datos aleatorios: "); 
        System.out.println ("Partidos " + partidos + ". Goles: " + goles);
    }
}
