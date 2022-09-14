/*
Realice un programa que instancie una urna electoral para la mesa “203” con 5 listas y una urna de
referéndum para la mesa “203”. Luego, lea DNIs de personas que llegan a votar a la mesa, hasta que se
ingresa el DNI 0. Cada persona vota en ambas urnas de la siguiente manera. Para la urna electoral, la persona
ingresa un nro. “N”: si “N” corresponde a una lista válida se debe votar por la lista “N” y en caso contrario se
debe votar en blanco. Para la urna de referéndum, la persona ingresa un número “M”: si “M” es positivo se
debe votar a favor, si es negativo se debe votar en contra, y si es 0 debe votar en blanco. Al finalizar la
votación, calcular la opción ganadora en ambas urnas y mostrar el resultado en consola. Además mostrar
para cada urna el porcentaje de votos que obtuvo la opción ganadora respecto al total de votos.
 */
package EjerciciosTeoria;

import PaqueteLectura.Lector;

public class T3_Ejercicio {
    public static void main (String[] args) {
        T3_Urna_Electoral urnaElectoral = new T3_Urna_Electoral (203 , 5); 
        T3_Urna_referendum urnaReferendum = new T3_Urna_referendum (203);
        
        int numUrna; 
        
        System.out.println("DNI ");
        String DNI = Lector.leerString();
        while(!DNI.equals("0")){
            System.out.println("Número de urna electoral ");
            numUrna = Lector.leerInt();
            urnaElectoral.votar(numUrna);

            System.out.println("Número de urna referendum...nal? (?)");
            numUrna = Lector.leerInt();
            urnaReferendum.votar(numUrna);

            System.out.println("DNI ");
            DNI = Lector.leerString();
        }
        
        // ganador de la unrna electoral 
        int ganador = urnaElectoral.calcularGanador (); 
        double porcentaje = (urnaElectoral.devolverVotosPorLista(ganador) / (double)urnaElectoral.calcularTotalVotos()) * 100;
        System.out.println("El ganador de las elecciones es la lista " + ganador);     
        System.out.println("Y su porcentaje es de " + porcentaje + "%");
        
        // ganador de la urna de referendum 
        ganador = urnaReferendum.calcularGanador ();
        
        if (ganador == 0) {
            System.out.println ("El referendum terminó en un empate");
        } else if (ganador == -1) {
            System.out.println ("Se votó en contra del referendum");
            porcentaje = (urnaReferendum.getVotosEnContra()/(double)urnaReferendum.calcularTotalVotos()) * 100;
            System.out.println ("Los votos negativos representan un " + porcentaje +  "% de los votos");
        } else {
            System.out.println ("Se votó a favor del referendum");
            porcentaje = (urnaReferendum.getVotosAFavor ()/(double)urnaReferendum.calcularTotalVotos()) * 100;
            System.out.println ("Los votos positivos representan un " + porcentaje +  "% de los votos");
        }
        
    }

}
