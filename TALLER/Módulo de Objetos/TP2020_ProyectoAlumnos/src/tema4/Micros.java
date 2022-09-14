/* A- Definir una clase para representar micros. Un micro conoce su patente, destino, hora
salida, el estado de sus 20 asientos (es decir si está o no ocupado) y la cantidad de asientos
ocupados al momento. Lea detenidamente a) y b) y luego implemente.
a) Implemente un constructor que permita iniciar el micro con una patente, un destino y
una hora de salida (recibidas por parámetro) y sin pasajeros.

b) Implemente métodos para:
i. devolver/modificar patente, destino y hora de salida
ii. devolver la cantidad de asientos ocupados
iii. devolver si el micro está lleno
iv. validar un número de asiento recibido como parámetro (es decir, devolver si está
en rango o no)
v. devolver el estado de un nro. de asiento válido recibido como parámetro
vi. ocupar un nro. de asiento válido recibido como parámetro
vii. liberar un nro. de asiento válido recibido como parámetro
viii. devolver el nro. del primer asiento libre */ 

package tema4;

public class Micros {
    private String patente;
    private String destino;
    private String hora;
    private int cantidadAsientos = 20; // para mi vector 
    private boolean [] asientos; // los asientos 
    private int ocupados;

// Constructor de micros sin pasajeros  (a)
    public Micros (String patente , String destino , String hora) {
        this.patente = patente;
        this.destino = destino;
        this.hora = hora;
        asientos = new boolean [cantidadAsientos];
        ocupados = 0;
    }

    // Getters (b i)
    public String getPatente () {
        return patente;
    }
    public String getDestino () {
        return destino;
    }
    public String getHora () {
        return hora;
    }
    // b ii
    public int getOcupados () {
        return ocupados;
    }

    // Setters (b i)
    public void setPatente (String patente) {
        this.patente = patente;
    }
    public void setDestino (String destino) {
        this.destino = destino;
    }  
    public void setHora (String hora) {
        this.hora = hora;
    }

    // Métodos
    // si el micro esta lleno b iii 
    public boolean microLleno(){
        return ocupados == cantidadAsientos;
    }

    // si el asiento existe b iv 
    public boolean asientoExiste (int asiento){
        return ((asiento >= 0) && (asiento < 20));
    }

    // si el asiento está ocupado b v
    public boolean asientoOcupado (int asiento){
        return asientos [asiento] == true;
    }
    // cambiar el estado del asiento y sumarlo a los ocupados b vi
    public void ocuparAsiento(int asiento){
        asientos [asiento] = true;
        ocupados++;
    }
    // cambiar el estado del asiento y restarlo de los ocupados b vii
    public void liberarAsiento (int asiento){
        asientos [asiento] = false;
        ocupados--;
    }
    // cual es el libre más proximo , voy a tener que recorrer e lvector  b viii
    public int primerAsientoLibre (){
        int i = 0;
        while((i < cantidadAsientos) && (asientos[i] != false)){
            i++;
        }
        return asientos[i] == false ? i : -1;
    }

    @Override
    public String toString() {
        return "El micro de la patente  " + patente + " va hasta " + destino + " saliendo a las " + hora + " hs.";
    } 
}
