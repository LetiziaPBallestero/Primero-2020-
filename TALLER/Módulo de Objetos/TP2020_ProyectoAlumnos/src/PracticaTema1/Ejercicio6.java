/* Escriba un programa que simule el ingreso de personas a un banco. 
Cada persona que ingresa indica la operación que desea realizar 
(0: “cobro de cheque” 1: “depósito/ extracción en cuenta” 2: “pago de impuestos o servicios” 
3: “cobro de jubilación” 4: “cobro de planes”). 
La recepción de personas culmina cuando un empleado ingresa la operación 5 (cierre del banco). 
Informar la cantidad de personas atendidas por cada operación y la operación más solicitada. */ 

package PracticaTema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio6 {
     public static void main (String [] args ) { 
         GeneradorAleatorio.iniciar();
         int codigo = 5; // mi constante de codigo
         int operacion; 
         int [] banco = new int [codigo]; // vector del banco 
         
         System.out.println ("Banco abierto");
         System.out.println ("Que operacion desea hacer?");
         operacion = GeneradorAleatorio.generarInt(6);
         while (operacion != codigo) {
             banco [operacion] ++; 
             operacion = GeneradorAleatorio.generarInt (6);} 
         
         
         System.out.println ("----------------");
         int i , maxP = 0 , maxI =0; // no hace falta en -1 xq el valor mínimo es 0
         for (i = 0; i < codigo ; i++) {
             if (banco[maxI] < banco[i]) { // 
                 maxP = banco[i];
                 maxI = i; 
             }
             System.out.println ("Para la operacion " + i + " se presentaron " + banco[i]);
         }
         System.out.println ();
         System.out.println ("La operacion " + maxI + " fue la mas solicitada con " + maxP + " personas.");   
     }
}
