/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2.Ejercicios;

import PaqueteLectura.Lector;

public class Ej03 {
    public static void main(String[] args) {
        Persona [][] Inscripciones = new Persona[5][8];
        
        int dimFi = 0, dimCol = 0;
        int cantPersonas = 0;
        boolean continuar = true;
        
        
        while((cantPersonas <= 40) && (continuar)){
                    System.out.println("Ingrese el nombre de la persona");
                    String nombre = Lector.leerString();
                    if (!nombre.equals("ZZZ")){
                        System.out.println("Ingrese el DNI de la persona");
                        int dni = Lector.leerInt();
                        System.out.println("Ingrese la edad de la persona");
                        int edad = Lector.leerInt();
                        Inscripciones[dimFi][dimCol] = new Persona(nombre, dni, edad);
                        System.out.println();
                        System.out.println("Se ingreso en la pos " + dimFi + "," + dimCol);
                        cantPersonas++;
                        if (dimCol != 7)
                            dimCol++;
                        else{
                            dimCol = 0;
                            dimFi++;
                        }                           
                    }
                    else
                        continuar = false;
        }
        
        for (int i = 0; i <= dimFi; i++){
            for (int j = 0; j < dimCol; j++) {
                System.out.println(i + " "+j);
                System.out.println(Inscripciones[i][j].getNombre() + " se entrvisto el dia " + i + " en el turno " + j);
                System.out.println();
            }
        }

    }
}
