/*
Una urna de referéndum es una urna que se caracteriza además por mantener un contador de votos a
favor y un contador de votos en contra.
*/
package EjerciciosTeoria;

public class T3_Urna_referendum extends T3_urna {
    private int votosAFavor;
    private int votosEnContra;
    
    public T3_Urna_referendum (int numeroDeUrna) {
        super.setNumeroDeUrna (numeroDeUrna);
    }
    
    // getters
    public int getVotosAFavor() {
        return votosAFavor;
    }

    public int getVotosEnContra() {
        return votosEnContra;
    }
    // setters
    public void setVotosAFavor(int votosAFavor) {
        this.votosAFavor = votosAFavor;
    }

    public void setVotosEnContra(int votosEnContra) {
        this.votosEnContra = votosEnContra;
    }

    // impri
    public String toString() {
        return super.toString() + " Votos a favor: " + getVotosAFavor() + " Votos en contra: " + getVotosEnContra();
    }
    
    // métodos
    public void votarAFavor(){
        votosAFavor++;
    }

    public void votarEnContra(){
        votosEnContra++;
    }

    public void votar(int n) {
        if(n == 0){
            votarEnBlanco();
        } else if(n > 0){
            votarAFavor();
        } else {
            votarEnContra();
        }
    }

    public boolean huboEmpate(){
        return getVotosAFavor() == getVotosEnContra();
    }

    public int calcularGanador() {
        if(!huboEmpate()){
            return getVotosAFavor() > getVotosEnContra() ? 1 : 0;
        }
        return -1;
    }

    public int calcularTotalVotos() {
        return getVotosAFavor() + getVotosEnContra() + getVotosEnBlanco();
    }

}
