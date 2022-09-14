/*
Una urna electoral es una urna que se caracteriza además por la cantidad de listas existentes y por
mantener un contador de votos para cada lista (son “L” listas, y están numeradas desde 0).

 */
package EjerciciosTeoria;

public class T3_Urna_Electoral extends T3_urna {
    private int cantListas;
    private int[] votos;

    public T3_Urna_Electoral(int numeroDeUrna, int cantListas){
        super.setNumeroDeUrna(numeroDeUrna);
        setCantListas(cantListas);
    }
    // get
    public int getCantListas() {
        return cantListas;
    }
    // set 
    public void setCantListas(int cantListas) {
        this.cantListas = cantListas;
        votos = new int[cantListas];
    }

    // impr.
    public String toString() {
        return super.toString() + " Cantidad de listas: " + getCantListas();
    }
    // Métodos
    public boolean validarNumeroLista(int n){
        return (n >= 0) && (n < cantListas);
    }

    public void votarPorLista(int L){
        votos[L]++;
    }

    public void votar(int L){
        if(validarNumeroLista(L)){
            votarPorLista(L);
        } else {
            votarEnBlanco();
        }
    }

    public int devolverVotosPorLista(int L){
        return votos[L];
    }

    public int calcularGanador() {
        int indice = 0;
        int max = votos[0];        
        for(int i = 1; i < getCantListas(); i++){
            if(votos[i] > max){
                max = devolverVotosPorLista(i);
                indice = i;
            }
        }
        return indice;
    }

    public int calcularTotalVotos() {
       int total = getVotosEnBlanco();
       for(int i = 0; i < getCantListas(); i++){
            total += devolverVotosPorLista(i);
       }
       return total;
    }


}

