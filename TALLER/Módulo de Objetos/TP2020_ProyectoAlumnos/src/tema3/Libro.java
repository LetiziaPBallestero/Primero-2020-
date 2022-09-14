package tema3;

import tema4.Autor;

public class Libro {
   private String titulo;
   private Autor primerAutor; 
   private String editorial;
   private int añoEdicion;
   private String ISBN; 
   private double precio; /*en dolares*/
     
   // getters 
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }

    public Autor getPrimerAutor(){ // el otro objeto 
        return primerAutor;
    } 
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
   // setters  
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
 
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
  
    public void setPrimerAutor(Autor unPrimerAutor){
         primerAutor = unPrimerAutor;
    } 
    public void setISBN(String unISBN){
         ISBN = unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio = unPrecio;
    }
  
    // constructor
    public Libro (String unTitulo , String unaEditorial , int unAño , Autor unPrimerAutor , String unISBN , double unPrecio) {
        this.titulo = unTitulo;
        this.editorial = unaEditorial;
        this.añoEdicion = unAño;
        this.primerAutor = unPrimerAutor;
        this.ISBN = unISBN;
        this.precio = unPrecio;
    }
    
    public Libro(  String unTitulo,  String unaEditorial, Autor unPrimerAutor, String unISBN){
        titulo = unTitulo;
        editorial = unaEditorial; 
        añoEdicion= 2015;
        primerAutor = unPrimerAutor;
        ISBN =  unISBN;
        precio = 100;
   }
    
     public Libro(){
  
   }
    
    // impresiones 
   @Override
    public String toString(){
        String aux;
        aux= titulo + " por " + primerAutor + " - " + añoEdicion + " - " + " ISBN: " + ISBN;
       return ( aux);
    }
        
}
