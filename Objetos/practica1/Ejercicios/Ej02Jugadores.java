
package tema1.Ejercicios;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {
    
  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double [] tablaAlturas;
        //Paso 3: Crear el vector para 15 double 
        tablaAlturas = new double[15];
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i, cant;
        double prom, altura, suma;
        suma = 0.0;
        prom = 0.0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for(i=0; i<15; i++){
             System.out.println("Ingrese la altura del jugador");
             altura = Lector.leerDouble();
             tablaAlturas[i] = altura;
             suma += altura;
         }
        
        System.out.println(suma);
        //Paso 7: Calcular el promedio de alturas, informarlo
        for(i=0; i<15; i++){
            prom = suma / 15;
        }
        System.out.println("El promedio de altura es: " + prom);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        cant = 0;
        for(i=0; i<15; i++){
            if (tablaAlturas[i] > prom)
                cant++;
        }
        //Paso 9: Informar la cantidad.
        System.out.println("Cantidad de Jugadores que superaron el promedio de altura: " + cant);
    }
}
