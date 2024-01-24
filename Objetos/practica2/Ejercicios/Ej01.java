/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2.Ejercicios;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej01 {
    public static void main(String[] args) {
        Persona Yo = new Persona();
        
        System.out.println("Ingrese un nombre");
        Yo.setNombre(Lector.leerString());
        System.out.println("Ingrese un DNI");
        Yo.setDNI(Lector.leerInt());
        System.out.println("Ingrese una Edad");
        Yo.setEdad(Lector.leerInt());
        System.out.println(Yo.toString());
        
        GeneradorAleatorio.iniciar();
        
        Yo.setNombre(GeneradorAleatorio.generarString(20));
        Yo.setDNI(GeneradorAleatorio.generarInt(100000));
        Yo.setEdad(GeneradorAleatorio.generarInt(101));
        System.out.println(Yo.toString());
    }
}
