package Empleados_club;

public class Entrenador extends Empleado {
    // atributos
    private int campeonatosGanados;
    
    // get 
    public int getCampeonatosGanados () {
        return campeonatosGanados;
    }
    
    // set 
    public void setCampeonatosGanados (int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    // constructor
    public Entrenador (String nombre , double basico , int campeonatosGanados) {
        super (nombre , basico);
        setCampeonatosGanados (campeonatosGanados);
    }
    
    // metodos 
    @Override
    public double calcularSueldoACobrar () {
        double plus = 0;
        
        if (campeonatosGanados >= 1 && campeonatosGanados <=4) {
            plus  = 5000;
        } else if (campeonatosGanados >=5 && campeonatosGanados <=10) {
            plus = 30000;
        } else if (campeonatosGanados > 10) {
            plus = 50000;
        }
        
        return getBasico() + plus;
    }
}
