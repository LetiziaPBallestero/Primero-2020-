
package Visor;

import tema5.Figura;


public class VisorFiguras {
    private int guardadas;
    private int mostradas;
    
    private Figura [] vector;
    
    public VisorFiguras(){
    mostradas=0;
    }
    
    public void mostrar(Figura f){
        // modf
    int i;
   
    
    System.out.println(f.toString());
    mostradas++;
    }
    
    public void guardar (Figura f) {
        // completar 
    }
    
    public int getMostradas() {
        return mostradas;
    }
    
    public boolean quedaEspacio(){
        //completar
    }
    
    public int getGuardadas() {
        return guardadas;
    }
}

