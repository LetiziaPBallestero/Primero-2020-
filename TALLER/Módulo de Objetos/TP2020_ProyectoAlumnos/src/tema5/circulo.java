/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema5;

/**
 *
 * @author Space Unicorn
 */
public class circulo extends Figura{
    
    private double radio;
    
    // Constructores
    public circulo (String cRelleno , String cLinea , double radio) {
        super (cRelleno , cLinea);
        setRadio (radio);
    }

    
    // Get
    public double getRadio () {
        return radio;
    }
    
    // Set
    public void setRadio (double radio) {
        this.radio = radio;
    }
    
    // Metodos 
    @Override
    public double calcularArea () {
        return (Math.PI * getRadio() * getRadio());
    }
    @Override
    public double calcularPerimetro (){
        return (2 * Math.PI * getRadio()); 
    }
}
