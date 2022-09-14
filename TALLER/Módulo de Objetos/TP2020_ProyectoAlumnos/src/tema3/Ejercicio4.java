/* 4-A- Generar una clase para representar círculos. Los círculos se caracterizan por su radio (double),
el color de relleno (String) y el color de línea (String). El círculo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (get# y set#)
▪ Calcular el área y devolverla. (método calcularArea)
▪ Calcular el perímetro y devolverlo. (método calcularPerimetro)
NOTA: la constante PI es Math.PI
B- Realizar un programa principal que instancie un círculo, le cargue información leída de teclado
e informe en consola el perímetro y el área. */ 
package tema3;

import PaqueteLectura.Lector;

public class Ejercicio4 {
    public static void main(String[] args) {
     System.out.println ("Radio , color de relleno y línea del círculo:"); 
     Circulo circulito = new Circulo (Lector.leerDouble () , Lector.leerString () , Lector.leerString ());
     
     System.out.println ("Nuestro círculo es de radio " + circulito.getRadio() + " color de línea " + circulito.getcLinea () + " y relleno " + circulito.getcRelleno());
     System.out.println ("El area es dicho circulo es de " + circulito.calcularArea() + " y el perimetro es de " + circulito.calcularPerimetro());
  
    }
}
