/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package estacionamiento;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
/**
 *
 * @author Lucas
 */
public class main {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        boolean seguir = true;
        int [] [] estacionamiento = new int[5][10];
        int patente;
        int piso;
        int plaza;
        while (seguir == true) {
            //hacemos una patente
            patente = GeneradorAleatorio.generarInt(10);
            System.out.println("Se ingreso la patente "+patente);
            //donde se estaciona
            System.out.println("Ingrese el piso que quiere estacionar");
            piso = Lector.leerInt();
            System.out.println("Ingrese la plaza del piso "+piso+" donde quiere estacionar");
            plaza = Lector.leerInt();
            //lo estaciono
            estacionamiento[piso - 1][plaza - 1] = patente;
            //queres estacionar otro auto?
            System.out.println("Quiere ingresar otro auto? (FALSE/TRUE)");
            seguir = Lector.leerBoolean();
            
        }
        
        int contador = 0; //contador auxiliar
        int autosMax = 0; //la cantidad de autos que tiene el piso con mas autos
        int pisoMax = 0; //el piso con mas autos
        for (int i=0;i<=4;i++){
            //se loopea los pisos
            System.out.println("PISO "+(i+1));
            for (int j=0;j<=9;j++){
                //se loopea las plazas
                
                //si la plaza esta ocupada entonces contador++
                if (estacionamiento[i][j] != 0){
                    contador++;
                    }
                System.out.println("PLAZA "+(j+1)+" : "+estacionamiento[i][j]);
            }
            
            //si la cantidad de plazas supera la del maximo, actualizo el maximo
            if (autosMax < contador) {
                    pisoMax = i; //abemus un nuevo maximo!
                    autosMax = contador;
                }
            System.out.println(" - AUTOS EN EL PISO "+(i+1)+" = "+contador);
            contador=0;
        }
        System.out.println("PISO MAS OCUPADO : "+(pisoMax+1)+" con "+autosMax+" autos");
    }
}
