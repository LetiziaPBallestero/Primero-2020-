/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Space Unicorn
 */
public class Autor {
    //
    private String nombre;
    private String biografia;
// constructor
    public Autor(String nombre, String biografia){
        this.nombre = nombre;
        this.biografia = biografia;
    }

    public Autor(String nombre){

    }
// getters 
    public String getNombre(){
        return nombre;
    }

    public String getBiografia(){
        return biografia;
    }
// setters 
    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    public void setBiografia(String biografia){
        this.biografia = biografia;
    }
}
