/* Cualquier urna se caracteriza por su número de urna y un contador de votos en blanco.
- Una urna electoral es una urna que se caracteriza además por la cantidad de listas existentes y por
mantener un contador de votos para cada lista (son “L” listas, y están numeradas desde 0).
- Una urna de referéndum es una urna que se caracteriza además por mantener un contador de votos a
favor y un contador de votos en contra
*/
package EjerciciosTeoria;

public abstract class T3_urna {
    private int numeroDeUrna;
    private int votosEnBlanco; 
    
    // getters
    public int getNumeroDeUrna() {
        return numeroDeUrna;
    }

    public int getVotosEnBlanco() {
        return votosEnBlanco;
    }
    // setters
    public void setNumeroDeUrna(int numeroDeUrna) {
        this.numeroDeUrna = numeroDeUrna;
    }

    public void setVotosEnBlanco(int votosEnBlanco) {
        this.votosEnBlanco = votosEnBlanco;
    }
    //impr.
    public String toString() {
        return " Numero de Urna: " + getNumeroDeUrna() + "Votos en blanco: " + getVotosEnBlanco();
    }
    // metodos 
    public void votarEnBlanco(){
        votosEnBlanco++; 
    }
    
    public abstract void votar(int n);
    
    public abstract int calcularGanador();
    
    public abstract int calcularTotalVotos();

}
