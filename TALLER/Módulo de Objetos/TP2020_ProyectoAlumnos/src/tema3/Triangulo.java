/* Definir una clase para representar triángulos. Un triángulo se caracteriza por el tamaño de sus
3 lados (double), el color de relleno (String) y el color de línea (String).
El triángulo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (métodos get# y set#)
▪ Calcular el área y devolverla (método calcularArea)
▪ Calcular el perímetro y devolverlo (método calcularPerimetro)  */

package tema3;

public class Triangulo { // declaro los datos que va a manejar mi triangulo com privados
     private double lado1;
     private double lado2;
     private double lado3; 
     private String cLinea; 
     private String cRelleno; 
 
     // constructor 
     public Triangulo (double lado1 , double lado2 , double lado3 , String linea , String relleno) {
              this.lado1 = lado1;
              this.lado2 = lado2;
              this.lado3 = lado3;
              this.cLinea = linea; 
              this.cRelleno = relleno;
     }
     // 
     public Triangulo () {
     }
         // los getters siempre que hay un get hay return
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
             return "Sus lados miden " + lado1 + " , " + lado2 + " , " + lado3 + " centímetros";
         }
         // metodos 
         public double calcularArea () {
             double a = (lado1 + lado2 + lado3) / 2;
             return a;
         }
         public double calcularPerimetro () {
             return lado1 + lado2 + lado3; 
         }
         
     }  