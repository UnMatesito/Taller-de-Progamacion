/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2.Ejercicios;
import PaqueteLectura.Lector;

public class Ej04 {
    public static void main(String[] args) {
        Persona [][] Matriz = new Persona[5][8];
        
        int dia;
        int i=0, j=0;
        boolean continuar = true;
        while((i < 5) && (continuar)){
                while ((j < 8) && (continuar)){
                    System.out.println("Ingrese el nombre de la persona");
                    String nombre = Lector.leerString();
                    if (!nombre.equals("ZZZ")){
                        System.out.println("Ingrese el DNI de la persona");
                        int dni = Lector.leerInt();
                        System.out.println("Ingrese la edad de la persona");
                        int edad = Lector.leerInt();
                        System.err.println("Ingrese un dia para que se le asigne un turno");
                        dia = Lector.leerInt();
                        Matriz[dia][j] = new Persona(nombre, dni, edad);
                        j++;
                        System.out.println();
                    }
                    else
                        continuar = false;
                }
        }
        
        dia = 0;
        int turno = 0;
        while (dia < i){
            int cant  = 0;
            while(turno < j){
                cant++;
            }
            System.out.println("En el dia " + dia + " se inscribieron " + cant + " personas");
            turno = 0;
            dia++;
        }
    }
}
