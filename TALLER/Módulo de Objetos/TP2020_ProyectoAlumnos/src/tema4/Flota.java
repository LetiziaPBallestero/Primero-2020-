/*Definir una clase para representar flotas de micros. Una flota se caracteriza por
conocer a los micros que la componen (a lo sumo 15). Defina un constructor para crear
una flota vacía (sin micros).
Implemente métodos para:
i. devolver si la flota está completa (es decir, si tiene 15 micros o no).
ii. agregar a la flota un micro recibido como parámetro.
iii. eliminar de la flota el micro con patente igual a una recibida como parámetro, y
retornar si la operación fue exitosa.
iv. buscar en la flota un micro con patente igual a una recibida como parámetro y
retornarlo (en caso de no existir dicho micro, retornar null).
v. buscar en la flota un micro con destino igual a uno recibido como parámetro y
retornarlo (en caso de no existir dicho micro, retornar null).

 */
package tema4;

public class Flota {
     private final int max = 15;
     private Micros[] micro = new Micros [max]; // usa el objeto micro
     private int microsEnFlota;
// constructor, flota vacia 
    public Flota(){ 
        microsEnFlota = 0;
    }
// imprimiiiir ~ 
    public void toStringMicros () {
        for (int i = 0; i < microsEnFlota; i++) {
            System.out.println (micro[i].toString());
        }
    }
  // getter   
    public int getMicrosEnFlota () {
        return microsEnFlota;
    }

// Metodos 
    // i. si la flota está completa 
    public boolean estaCompleta () {
        return microsEnFlota == max;
    }
    // ii. agregar 
    private boolean agregar (Micros Micros) {
        micro [microsEnFlota++] = Micros;
        return true;
    }
    public boolean agregarVerificar (Micros micros) {
        return microsEnFlota < max ? agregar (micros) : false;
    }
    // iii. elimina una patente e informa qué tal la operación con -1 
    public int buscarMicro (String patente){
        int i = 0;
        while ( i < microsEnFlota && !micro[i].getPatente().equals(patente)){
            i++;
        }
        return i >= microsEnFlota ? -1 : i;
    }
    // elimina el micro
    public boolean eliminarDeFlota (String patente) {
         int pos = buscarMicro(patente) ;
         if (pos != -1) {
             microsEnFlota--;
             for (int i = pos; i < microsEnFlota; i++) {
                 micro[i] = micro[i + 1];
            }
             return true;
        } return false;
    }
    // iv. busca una patente y regresa null en caso de no existir 
    public Micros buscarPatente (String patente) {
        int i = 0;
        while( i < microsEnFlota && !(micro[i].getPatente().equals(patente))) {
            i++;
        }
        return i >= microsEnFlota ? null : micro[i];
    }
    // v. busca blablabla por destino 
    public Micros buscarDestino (String destino) {
         int i = 0;
         while(i < microsEnFlota && !(micro[i].getDestino().equalsIgnoreCase(destino))){
            i++;
        }
         return i >= microsEnFlota ? null : micro[i];
    }

}
