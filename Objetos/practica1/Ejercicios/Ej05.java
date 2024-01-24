/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1.Ejercicios;
import PaqueteLectura.Lector;
/**
 *
 * @author samsungII
 */
public class Ej05 {
    public static void main(String[] args) {
        int [] vectorReseñas = new int [4];
        double [] vectorSumas = new double[4];
        int i, cliente = 1;
        do {            
            System.out.println("Ingrese la puntuacion de la Atencion al cliente");
            vectorReseñas[0] = Lector.leerInt();
            System.out.println("Ingrese la puntuacion de la calidad de la comida");
            vectorReseñas[1] = Lector.leerInt();
            System.out.println("Ingrese la puntuacion del precio de la comida");
            vectorReseñas[2] = Lector.leerInt();
            System.out.println("Ingrese la puntuacion del ambiente del restaurante");
            vectorReseñas[3] = Lector.leerInt();
            System.out.println();
            for (i= 0; i<4; i++){
                vectorSumas[i] += vectorReseñas[i];
            }   
            cliente++;
        } while (cliente != 6);
        for (i = 0; i<4; i++){
            System.out.println("La puntuacion Promedio del aspecto " + i + " es: " + vectorSumas[i]/5.0);
        } 
    }
}
