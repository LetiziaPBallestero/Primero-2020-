/*A- Agregar la clase Triángulo a la jerarquía de clases vista en el tema 5 (paquete tema5
del proyecto). Triángulo debe heredar de Figura todo lo que es común y definir su
constructor y sus atributos y métodos propios. Además debe redefinir el método toString.
 */

package tema5;

import tema3.*;

public class Triangulo_2 extends Figura {
     private double lado1;
     private double lado2;
     private double lado3; 
     // ahora estos van a venir de la super-clase figura
     // private String cLinea; 
     // private String cRelleno; 
 
     // constructor 
     public Triangulo_2 (String colorRelleno , String colorLinea , double lado1 , double lado2 , double lado3) {
              super (colorRelleno, colorLinea); // y se cambian los nombres
              this.lado1 = lado1;
              this.lado2 = lado2;
              this.lado3 = lado3;
              // esto está de la práctica pasada, se remplaza por lo de la línea 20 acá 
              // this.cLinea = linea; 
              // this.cRelleno = relleno;
     }
     
         // los getters siempre que hay un get hay return
         // son propios de la sub-clase triángulo
         public double getLado1(){
         return lado1;
         }
         public double getLado2 () {
             return lado2;
         }
         public double getLado3 () {
             return lado3;
         }
         // los setters 
         public void setLado1 (double lado1){
             this.lado1 = lado1;
         }
         public void setLado2 (double lado2){
             this.lado2 = lado2;
         }
         public void setLado3 (double lado3){
             this.lado3 = lado3;
         }
         
         // impresioens 
     @Override
         public String toString (){
             return "Sus lados miden " + lado1 + " , " + lado2 + " , " + lado3 + " centímetros." 
             + super.toString();
         }
         // metodos 
     @Override
         public double calcularArea () {
             double a = (lado1 + lado2 + lado3) / 2;
             return a;
         }
     @Override
         public double calcularPerimetro () {
             return lado1 + lado2 + lado3; 
         }
         
     }  