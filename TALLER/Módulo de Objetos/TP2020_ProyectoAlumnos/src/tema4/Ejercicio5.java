/* Genere un programa que cree una flota vacía. Cargue micros (sin pasajeros) a la flota
con información leída desde teclado (hasta que se ingresa la patente “ZZZ000” o hasta
completar la flota). Luego lea una patente y elimine de la flota el micro con esa patente;
busque el micro con dicha patente para comprobar que ya no está en la flota. Para
finalizar, lea un destino e informe la patente del micro que va a dicho destino. */ 
package tema4;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ejercicio5 {
    public static void main(String[] args) {
        // variables: 
        String destino; 
        String horario;
        String patente; 
        
        GeneradorAleatorio.iniciar();
        Flota flota = new Flota ();

        // leeer datos 
        System.out.println ("El destino es: ");
        destino = Lector.leerString ();
        System.out.println ("El horario de partida es: ");
        horario = Lector.leerString ();
        System.out.println ("La patente del micro es: ");
        patente = Lector.leerString ();
        
        Micros micro = new Micros (patente, destino, horario); 
        
        while (!flota.estaCompleta() && !micro.getPatente().equals("ZZZ 000")) {
            flota.agregarVerificar(micro);
            
            // leeer datos 
            System.out.println ("El destino es: ");
            destino = Lector.leerString ();
            System.out.println ("El horario de partida es: ");
            horario = Lector.leerString ();
            System.out.println ("La patente del micro es: ");
            patente = Lector.leerString ();
            
            micro = new Micros (patente, destino, horario);  
        }
        System.out.println ("Fin de la carga de micros.");
        flota.toStringMicros();
        System.out.println ("_________________________________________________");
        
        System.out.println ("¿Qué micro desea eliminar de la flota?");
        String patenteaEliminar = Lector.leerString ();
        if (flota.eliminarDeFlota(patenteaEliminar)) {
            System.out.println ("Se lo sacó, por gil.");
        } else if (flota.buscarPatente(patenteaEliminar) == null) { // no existe 
            System.out.println ("El micro nunca existio, aceptalo.");
        }

        System.out.println ("Ingrese el destino al cuál quiere ir ");
        String destinoBuscar = Lector.leerString ();
        Micros buscado = flota.buscarDestino (destinoBuscar);
        if (buscado != null) {
            System.out.println ("El micro " + buscado.getPatente() + " va hacía allá.");
        } else {
            System.out.println ("Ninguno va.");
        }
    }
}
