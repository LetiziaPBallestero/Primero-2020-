
/* 1- A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el tamaño de sus
3 lados (double), el color de relleno (String) y el color de línea (String).
El triángulo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (métodos get# y set#)
▪ Calcular el área y devolverla (método calcularArea)
▪ Calcular el perímetro y devolverlo (método calcularPerimetro) 

B- Realizar un programa principal que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.*/ 

package tema3;

import PaqueteLectura.Lector;

public class Ejercicio1 {
    public static void main (String [] args) {
        // ingreso de datos ... 
        System.out.println ("Lado 1: ");
        double lado1 = Lector.leerDouble ();
        System.out.println ("Lado 2: "); 
        double lado2 = Lector.leerDouble ();
        System.out.println ("Lado 3: ");
        double lado3 = Lector.leerDouble ();
        System.out.println ("Color de relleno: ");
        String relleno = Lector.leerString ();
        System.out.println ("Color de linea: ");
        String linea = Lector.leerString ();
        // creo el objeto
        Triangulo triangulito = new Triangulo (lado1 , lado2 , lado3 , linea , relleno);
        // calculo lo pedido 
        System.out.println ("El area es de " + triangulito.calcularArea());
        System.out.println ("El perimetro es de " + triangulito.calcularPerimetro());
        
        Triangulo triangulito2 = new Triangulo ();
    }
}