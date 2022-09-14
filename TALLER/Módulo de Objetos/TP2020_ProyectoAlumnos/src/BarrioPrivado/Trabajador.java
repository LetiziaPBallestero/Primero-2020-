
package BarrioPrivado;

public class Trabajador extends Persona {
    String trabajo;
    
    public Trabajador (String nombre , int DNI , int edad , String trabajo) {
        super (nombre , DNI, edad);
        setTrabajo (trabajo);
    }
    
    // get
    public String getTrabajo () {
        return trabajo;
    }
    // set
    public void setTrabajo (String trabajo) {
        this.trabajo = trabajo;
    }
    
    // impr. 
    public String toString () {
        return super.toString() + "Y mi trabajo es " + getTrabajo ();
    }
    
}
