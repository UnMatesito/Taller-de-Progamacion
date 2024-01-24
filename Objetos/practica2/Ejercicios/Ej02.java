/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2.Ejercicios;

import PaqueteLectura.GeneradorAleatorio;

public class Ej02 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Persona vector[] = new Persona[15];
       
        
        int i = 0;
        boolean continuar = true;
        
        while ((i < 15) && (continuar)){
            int edad = GeneradorAleatorio.generarInt(101);
            if (edad != 0){
                String nombre = GeneradorAleatorio.generarString(1 + GeneradorAleatorio.generarInt(10));
                int dni = GeneradorAleatorio.generarInt(100000);
                vector[i] = new Persona(nombre, dni, edad);
                i++;
            }
            else
                continuar = false;
        }
        
        int j, cant = 0;
        for(j = 0; j < i; j++){
            if (vector[j].getEdad() > 65) 
                cant++;
        }
        
        System.out.println("La cantidad de personas mayores de 65 son: " + cant);
        int minDni = 99999999;
        for(j = 0; j < i; j++){
            if (vector[j].getDNI() < minDni){
                minDni = j;
            }
        }
        System.out.println("Imprimir la representacion de la persona con el menor DNI");
        System.out.println(vector[minDni].toString());
    }
}
