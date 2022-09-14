/*B- Realice un programa que cree un micro con patente “ABC123”, destino “Mar del Plata” y
hora de salida 5:00. Cargue pasajeros al micro de la siguiente manera. Leer nros. de
asientos desde teclado que corresponden a pedidos de personas. La lectura finaliza cuando
se ingresa el nro. de asiento -1 o cuando se llenó el micro. Para cada nro. de asiento leído
debe: validar el nro; en caso que esté libre, ocuparlo e informar a la persona el éxito de la
operación; en caso que esté ocupado informar a la persona la situación y mostrar el nro.
del primer asiento libre. Al finalizar, informe la cantidad de asientos ocupados del micro.
 */
package tema4;
import PaqueteLectura.Lector;
public class Ejercicio4 {
    public static void main(String[] args) {
        Micros micro = new Micros ("ABC123", "Mar del Plata", "5:00");

        System.out.print("Asiento número: ");
        int asiento = Lector.leerInt();
        while(asiento != -1 && !micro.microLleno()){
            if(micro.asientoExiste(asiento) && !micro.asientoOcupado(asiento)){
                System.out.println("Asiento libre");
                micro.ocuparAsiento(asiento);
            } else {
                System.out.println("Asiento no válido u ocupado");
                System.out.println("Pero, el asiento número " + micro.primerAsientoLibre() + " está libre, yay 4you");
            }
            System.out.print("Número de asiento: ");
            asiento = Lector.leerInt();
        }

        System.out.println("Cantidad de asientos ocupados del micro: " + micro.getOcupados());
    }
}
