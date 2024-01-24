/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import tema2.Ejercicios.Persona;

public class Ej04 {
    public static void main(String[] args) {
        Persona p = new Persona("Pepito Mengano", 32432432, 30);
        Habitacion hh = new Habitacion();
        Hotel h = new Hotel(5);
        h.agregarCliente(1, p);
        h.agregarCliente(0, p);
        for (int i = 0; i < 5; i++) {
            h.toString(i);
        }
    }
}
