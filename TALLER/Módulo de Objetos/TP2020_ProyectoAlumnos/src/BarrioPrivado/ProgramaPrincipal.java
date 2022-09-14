package BarrioPrivado;

import PaqueteLectura.GeneradorAleatorio;



public class ProgramaPrincipal {
    public static void main (String [] args) {
        String trabajo = "aaaaa";
        String nombre = "Dolores";
        Persona persona = new Persona (nombre , GeneradorAleatorio.generarInt (90000000) , GeneradorAleatorio.generarInt(75) );
        Trabajador trabajador = new Trabajador (nombre , GeneradorAleatorio.generarInt (90000000) , GeneradorAleatorio.generarInt(75) , trabajo);
    
        System.out.println(persona);
        System.out.println(trabajador);
    }
}
