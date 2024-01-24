/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1.Ejercicios;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [][] matriz = new int[5][5];
        int i;
        int j;
        for (i=0; i<5; i++){
            for(j=0; j<5; j++){
                matriz[i][j] = GeneradorAleatorio.generarInt(31);
            }
        }
        //Paso 4. mostrar el contenido de la matriz en consola
        
        for (i=0; i<5; i++){
            System.out.println("-------------------");
            for(j=0; j<5; j++){
                System.out.print("|" + matriz[i][j] + "|");
            }
        }
        System.out.println("-------------------");
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int suma = 0;
        for(i=0; i<5; i++)
            suma += matriz[i][0];
        System.out.println("Suma de los elementos de la fila 1: " + suma);
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        int [] vectorSumas = new int[5];
        vectorSumas[0] = suma;
        suma = 0;
        for (j=1; j<5; j++){
            for (i=0; i<5; i++){
                suma += matriz[i][j];
                vectorSumas[j] = suma;
            }
            suma = 0;
        }
        
        for (i=0; i<5; i++)
            System.out.println(vectorSumas[i]);
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.err.println("Ingrese un numero para buscar en la matriz");
        int num = Lector.leerInt();
        for (i=0; i<5; i++){
            for(j=0; j<5; j++){
                if (num == matriz[i][j])
                    System.out.println("Se encontro el elemento, su posicion es: (" + ++i + " , " + ++j + ")");
                else if ((i == 4) && (j == 4) && (matriz[i][j] != num))
                    System.out.println("No se encontro el elemento");
            }
        }
    }
}
