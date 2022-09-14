
package BarrioPrivado;

public class Persona {
    String nombre; 
    int DNI; 
    int edad; 
    
public Persona(String nombre, int DNI, int edad){
       setNombre (nombre);
       setDNI (DNI);
       setEdad (edad);
    }
    
     // getters 
    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }
    // setters
    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    // impri
    public String toString(){
        return "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años.";
    }
    
    
    
    
}
