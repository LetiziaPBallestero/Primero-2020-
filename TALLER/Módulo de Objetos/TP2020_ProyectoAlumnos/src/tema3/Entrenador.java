/* A- Definir una clase para representar entrenadores de un club de fútbol. Un entrenador se
caracteriza por su * nombre, 
* sueldo básico y 
* la cantidad de campeonatos ganados.

▪ Defina métodos para obtener/modificar el valor de cada atributo.
▪ Defina el método calcularSueldoACobrar que calcula y devuelve el sueldo a cobrar por el
entrenador. El sueldo se compone del sueldo básico, al cual se le adiciona un plus por
campeonatos ganados (5000$ si ha ganado entre 1 y 4 campeonatos; $30.000 si ha ganado
entre 5 y 10 campeonatos; 50.000$ si ha ganado más de 10 campeonatos). */ 
package tema3;

public class Entrenador {
    private String nombre; 
    private double sueldoBasico; 
    private int campeonatosGanados; 
  // constructores: 
    public Entrenador (String nombre, double sueldoBasico , int campeonatosGanados) {
        this.nombre = nombre; 
        this.sueldoBasico = sueldoBasico; 
        this.campeonatosGanados = campeonatosGanados; 
        
    }
    public Entrenador (String nombre , double sueldoBasico) {
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico; 
    }
    
    public Entrenador (String nombre , int campeonatosGanados) {
        this.nombre = nombre;
        this.campeonatosGanados = campeonatosGanados;
    }
    public Entrenador (String nombre) {
        this.nombre = nombre; 
    }
    public Entrenador () {
    }
    
    //Getters: 
    public String getNombre () {
        return nombre;
    }
    
    public double getSueldoBasico () {
        return sueldoBasico;
    }
    
    public int getCampeonatosGanados () {
        return campeonatosGanados;
    }
    
    // Setters: 
    public void setNombre (String nombre) {
        this.nombre = nombre; 
    }
    public void setSueldoBasico (double sueldoBasico) {
        this.sueldoBasico = sueldoBasico; 
    }
    public void setCampeonatosGanados (int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados; 
    }
    
    // metodos generales
    public double calcularSueldoACobrar (){
        double adicional = 0; 
        if ((campeonatosGanados >= 1) && (campeonatosGanados <= 4)) {
            adicional = 5000;
            }
        else if ((campeonatosGanados >= 5) && (campeonatosGanados <=10)) {
            adicional = 30000;
            }
        else if (campeonatosGanados > 10) {
            adicional = 50000;
        }
        return sueldoBasico + adicional;
    }
    
     public String toString (){
             return nombre + " gana $" + calcularSueldoACobrar();
         }
}