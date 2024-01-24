/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.GeneradorAleatorio;

public class Ej03 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estante est = new Estante();
        
        System.out.println(est.estaLleno());
        System.out.println(est.cantLibros());
        Autor aut = new Autor("Pepito Mengano", GeneradorAleatorio.generarString(20), GeneradorAleatorio.generarString(20));
        Libro l = new Libro("AAAA", GeneradorAleatorio.generarString(20), 2015, aut, GeneradorAleatorio.generarString(20), 5000);
        int i = 0;
        while (i < 20){
            est.agregarLibro(l);
            i++;
        }
        System.out.println(est.cantLibros());
        System.out.println(est.estaLleno());
        
        for (i = 0; i < est.cantLibros(); i++) {
            est.BuscarTitulo(i, "Mujercitas", l);
            System.out.println("El nombre del autor de Mujercitas es:");
            System.out.println(l.getPrimerAutor());
        }
    }
}
