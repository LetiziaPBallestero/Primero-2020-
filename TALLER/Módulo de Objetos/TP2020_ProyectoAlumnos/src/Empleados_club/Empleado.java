/*
 Cualquier empleado se caracteriza por su nombre y sueldo básico.
▪ Los jugadores son empleados que se caracterizan por el número de partidos jugados y
el número de goles anotados.
▪ Los entrenadores son empleados que se caracterizan por la cantidad de campeonatos
ganados.
A- Implemente la jerarquía de clases, con los atributos de cada clase y métodos para
obtener/modificar el valor de los mismos.
 */
package Empleados_club;

public abstract class Empleado {
    // atributos 
    private String nombre;
    private double basico; 
    
    // getter
    public String getNombre () {
        return nombre;
    }
    
    public double getBasico () {
        return basico;
    }
    
    // setters 
    public void setNombre (String nombre) {
        this.nombre = nombre;
    }
    
    public void setBasico (double basico) {
        this.basico = basico; 
    }
    
        // constructor 
    public Empleado (String nombre, double basico) {
        setNombre (nombre);
        setBasico (basico);
    }
    
    // métodos 
    public abstract double calcularSueldoACobrar();
    
    
    @Override
    public String toString () {
        return getNombre () + " cobra unos " + getBasico() + "$ de básico.";
    }
}
