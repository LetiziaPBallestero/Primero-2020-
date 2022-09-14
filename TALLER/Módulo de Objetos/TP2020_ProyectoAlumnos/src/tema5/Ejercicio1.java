/*
Escriba un programa que instancie un triángulo y un cuadrado, con información leída
desde teclado. Luego muestre en consola el área y perímetro de cada uno y su
representación en String.
 */
package tema5;

import PaqueteLectura.Lector;

public class Ejercicio1 {
    public static void main (String[] args ) {
        System.out.println ("A continuación se establezerán las tres figuras");
        
        System.out.println ("Empezaremos por el triángulo, introduzca el color de relleno, el de línea y los tres lados" );
        Triangulo_2 triangulo = new Triangulo_2 (Lector.leerString () , Lector.leerString () , Lector.leerDouble () , Lector.leerDouble () , Lector.leerDouble ());
        System.out.println ("Vamos con el cuadrado, de nuevo: la medida de uno de sus lados, el color de relleno y el de su linea");
        Cuadrado cuadrado = new Cuadrado (Lector.leerDouble () , Lector.leerString () , Lector.leerString());
         
        System.out.println ("Datos del triángulo");
        System.out.println ("Perímetro: " + triangulo.calcularPerimetro());
        System.out.println ("Además ... " + triangulo.toString() ) ;
        
        System.out.println ("Datos del cuadrado");
        System.out.println ("Perímetro: " + cuadrado.calcularPerimetro());
        System.out.println ("Además ... " + cuadrado.toString());
    }
    
}
