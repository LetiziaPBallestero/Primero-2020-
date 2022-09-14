
package Empleados_club;

public class Jugadores extends Empleado {
    private int partidos; 
    private int goles; 
    
    // getters
    public int getPartidos () {
        return partidos;
    }
    public int getGoles () {
        return goles; 
    }
    
    // setters
    public void setPartidos (int partidos) {
        this.partidos = partidos;
    }
    public void setGoles (int goles) {
        this.goles = goles; 
    }
    
    // constructor 
    public Jugadores (String nombre , double basico , int partidos , int goles) {
        super (nombre , basico);
        setPartidos (partidos);
        setGoles (goles);
       
    }
    
    // metodos 
    public double promedioXGoles () {
        return goles/partidos;
    }
    public double calcularSueldoACobrar () {
        return promedioXGoles () > 0.5 ? getBasico() * 2 : getBasico ();
    }
}
