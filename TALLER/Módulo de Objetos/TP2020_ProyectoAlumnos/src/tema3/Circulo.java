/*4-A- Generar una clase para representar círculos. Los círculos se caracterizan por su radio (double),
el color de relleno (String) y el color de línea (String). El círculo debe saber:
▪ Devolver/modificar el valor de cada uno de sus atributos (get# y set#)
▪ Calcular el área y devolverla. (método calcularArea)
▪ Calcular el perímetro y devolverlo. (método calcularPerimetro)
NOTA: la constante PI es Math.PI
 */
package tema3;
public class Circulo {
    private double radio;
    private String cRelleno;
    private String cLinea;
    
    // Constructores
    public Circulo (double radio , String cRelleno , String cLinea) {
        this.radio = radio;
        this.cRelleno = cRelleno;
        this.cLinea = cLinea;
    }
    
    public Circulo () {
    }
    
    // Getters 
    public double getRadio () {
        return radio;
    }
    public String getcRelleno () {
        return cRelleno;
    }
    public String getcLinea () {
        return cLinea;
    }
    
    // Setters
    public void setRadio (double radio) {
        this.radio = radio;
    }
    public void setcRelleno (String cRelleno) {
        this.cRelleno = cRelleno;
    }
    public void setcLinea (String cLinea) {
        this.cLinea = cLinea;
    }
    
    // Metodos 
    public double calcularArea () {
        return Math.PI * radio * radio; 
    }
    public double calcularPerimetro (){
        return 2 * Math.PI * radio; 
    }
}
