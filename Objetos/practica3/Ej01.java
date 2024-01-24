/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author samsungII
 */
public class Ej01 {
    public static void main(String[] args) {
        Triangulo t = new Triangulo();
        System.out.println("Ingrese el lado 1 del triangulo");
        t.setLado1(Lector.leerDouble());
        System.out.println("Ingrese el lado 2 del triangulo");
        t.setLado2(Lector.leerDouble());
        System.out.println("Ingrese el lado 3 del triangulo");
        t.setLado3(Lector.leerDouble());
        System.out.println("Ingrese el color de relleno del triangulo");
        t.setColorRelleno(Lector.leerString());
        System.out.println("Ingrese el color de la lineas del triangulo");
        t.setColorLinea(Lector.leerString());
        System.out.println();
        
        System.out.println("El perimetro del triangulo es: " + t.calcularPerimetro());
        System.out.println("El area del triangulo es: " + t.calcularArea());
    }
}
