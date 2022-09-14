
/* A – Definir una clase para representar balanzas comerciales (para ser utilizadas en verdulerías,
carnicerías, etc). Una balanza comercial sólo mantiene el monto y la cantidad de items
correspondientes a la compra actual (es decir, no almacena los ítems de la compra). La balanza
debe responder a los siguientes mensajes:
▪ iniciarCompra(): inicializa el monto y cantidad de ítems de la compra actual.
▪ registrarProducto(pesoEnKg, precioPorKg): recibe el peso en kg del ítem comprado y su precio
por kg, debiendo realizar las actualizaciones en el estado de la balanza.
▪ devolverMontoAPagar(): retorna el monto de la compra actual.
▪ devolverResumenDeCompra(): retorna un String del siguiente estilo “Total a pagar X por la
compra de Y productos” , donde X es el monto e Y es la cantidad de ítems de la compra.

-------------------

5-A- Modifique el ejercicio 2-A. Ahora la balanza debe poder generar un resumen de compra más
completo. Para eso agregue a la balanza la característica resumen (String). Modifique los métodos:
▪ iniciarCompra para que además inicie el resumen en el String vacío.
▪ registrarProducto para que reciba un objeto Producto (que se caracteriza por peso en kg y
descripción) y su precio por kg. La operación debe realizar las actualizaciones en monto
/cantidad de ítems y adicionar al resumen (string) la descripción y el monto pagado por este
producto.
▪ devolverResumenDeCompra() para que retorne un String del siguiente estilo: “Naranja 100
pesos – Banana 40 pesos – Lechuga 50 pesos – Total a pagar 190 pesos por la compra de 3
productos” . La sección subrayada es el contenido de resumen.
Realice las modificaciones necesarias en el programa principal solicitado en 2-B para corroborar el
funcionamiento de la balanza.
NOTA: dispone en la carpeta tema 3 de la clase Producto ya implementada. Para adicionar la
información del producto recibido al resumen use concatenación de Strings (operación +)*/ 
package tema3;

public class Balanza {
    // variables de la balanza 
    private double monto; 
    private int items; 
    private String resumen;

    // variables necesarios para el item 
    private double pesoKG = 0;
    private double precioxKG = 0;
    
    // getters y setters 
    public void setPeso (double pesoKG) {
        this.pesoKG = pesoKG;
    }      
    public void setPrecio (double precioxKG) {
        this.precioxKG = precioxKG;
    }
    public double getPrecio(){
         return precioxKG;
         }
    public double getPeso (){
         return pesoKG;
         }
    
    // metodos de la balanza 
    public void iniciarCompra(){
        monto = 0;
        items = 0;
        resumen = "";
    }

    public void registrarProducto(Producto producto){
        items++;
        monto += producto.getPrecio() * producto.getPeso();
        resumen += producto.getDescripcion() +" - ";
    }

    public double devolverMontoAPagar(){
        return monto;
    }

    public String devolverResumenDeCompra(){
        return resumen + "Total a pagar " + monto + " por la compra de " + items + " productos.";
    }
    
}