/* 3- A- Definir una clase para representar entrenadores de un club de fútbol. Un entrenador se
caracteriza por su nombre, sueldo básico y la cantidad de campeonatos ganados.
▪ Defina métodos para obtener/modificar el valor de cada atributo.
▪ Defina el método calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar por el
entrenador. El sueldo se compone del sueldo básico, al cual se le adiciona un plus por
campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 si ha ganado
entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos).
B- Realizar un programa principal que instancie un entrenador, cargándole datos leídos desde
teclado. Pruebe el correcto funcionamiento de cada método implementado */ 

package tema3;

import PaqueteLectura.Lector;

public class Ejercicio3 {
    public static void main(String[] args) {
        // vamos a probar los diferentes constructores, yay! 
        // el vacio   
        Entrenador entrenador = new Entrenador ();
        
         System.out.println ("Nombre del entrenador: ");
         String nombre = Lector.leerString ();
         entrenador.setNombre (nombre);
         
         System.out.println ("Sueldo de " + nombre + ": ");
         double sueldo = Lector.leerDouble ();
         entrenador.setSueldoBasico (sueldo);
         
         System.out.println ("Campeonatos ganados por " + nombre + ": ");
         int campeonato = Lector.leerInt ();
         entrenador.setCampeonatosGanados (campeonato);
         
         System.out.println (entrenador.toString());
         
         // lleno llenito 
         System.out.println ("Nombre, sueldo y campeonatos ganados por el entrenador");
         Entrenador entrenador2 = new Entrenador (Lector.leerString() , Lector.leerDouble() , Lector.leerInt());
         System.out.println (entrenador2.toString());
         
         // nombre + sueldo 
         System.out.println ("Nombre y sueldo del entrenador");
         Entrenador entrenador3 = new Entrenador (Lector.leerString() , Lector.leerDouble());
         System.out.println (entrenador3.toString());
         
         // nombre + campeonatos ganados 
         Entrenador entrenador4 = new Entrenador (nombre , campeonato);
         System.out.println (entrenador4.toString()); 
         
         //nombre solamente 
         Entrenador entrenador5 = new Entrenador (nombre); 
         System.out.println (entrenador5.toString());
    }
}
