/* Se dispone de la clase Partido (ya implementada en la carpeta tema2). 

Un objeto partido representa un encuentro entre dos equipos (local y visitante). 
Un objeto partido puede crearse sin valores iniciales 
o enviando en el mensaje de  creación el nombre del equipo local, el nombre del visitante, 
la cantidad de goles del local y del visitante (en ese orden). 

Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en el campeonato. 
La información de cada partido se lee desde teclado hasta ingresar uno con nombre de visitante “ZZZ” 
o alcanzar los 20 partidos. 

Luego de la carga informar: 
- La cantidad de partidos que ganó River. 
- El total de goles que realizó Boca jugando de local. 
- El porcentaje de partidos finalizados con empate.

 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ejercicio6 {
     public static void main (String [] args) { 
         GeneradorAleatorio.iniciar();
         int dimF = 20; // partidos
         Partido [] campeonato = new Partido [dimF]; 
         int cantPart = 0; // para saber si alcancé los 20 partidos 
         
         String local , visitante; 
         int golesLocal , golesVisitante; 
         
         // cargo los datos del partidos 
         System.out.println ("Ingrese el equipo local");
         local = Lector.leerString ();
         System.out.println ("Ingrese el equipo visitante");
         visitante = Lector.leerString ();
         System.out.println ("Ingrese los goles del equipo local");
         golesLocal = Lector.leerInt ();
         System.out.println ("Ingrese los goles del equipo visitante");
         golesVisitante = Lector.leerInt ();
         // genero el objeto 
         Partido partido = new Partido (local , visitante , golesLocal , golesVisitante);
         
         // comienzo a cargar el campeonato 
         while ((cantPart < dimF) && !(visitante.equals("ZZZ"))) { 
             campeonato[cantPart ++] = partido; 
             
             // cargo los datos del partidos 
            System.out.println ("Ingrese el equipo local");
            local = Lector.leerString ();
            System.out.println ("Ingrese el equipo visitante");
            visitante = Lector.leerString ();
            System.out.println ("Ingrese los goles del equipo local");
            golesLocal = Lector.leerInt ();
            System.out.println ("Ingrese los goles del equipo visitante");
            golesVisitante = Lector.leerInt ();
            // genero el objeto 
            partido = new Partido (local , visitante , golesLocal , golesVisitante);
         }
         
         System.out.println ("------------------------------------------------");
         
         int i , empatados = 0 , golesBoca = 0 , ganoRiver = 0;
         for (i = 0 ; i < cantPart ; i++) {
             if (campeonato[i].hayEmpate()) {
                 empatados++;
             } else if (campeonato[i].getGanador().equals ("River")) {
                 ganoRiver++;
             }
             
             if (campeonato[i].getLocal().equals("Boca")) {
                 golesBoca = golesBoca + campeonato[i].getGolesLocal();
             }
             
             int a = i;
             
             System.out.println("Partido número " + (a+1) + ": " + campeonato[i].getLocal() + " || " + campeonato[i].getVisitante());
             System.out.println("Resultado: "+ campeonato[i].getGolesLocal() + " || " + campeonato[i].getGolesVisitante());
             System.out.println();
             }
         
         double empates = (empatados*100) / cantPart;
         System.out.println (empates+"% de empates. Con un total de " + empatados + " partidos empatados.");
         System.out.println ("Cantidad de goles de Boca siendo local: " + golesBoca);
         System.out.println ("Cantidad de partidos que ganó River: " + ganoRiver);
         }
}
