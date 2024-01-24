package tema1.Ejercicios;

import PaqueteLectura.Lector;
/**
 *
 * @author samsungII
 */
public class Ej04 {
    public static void main(String[] args) {
        int [][] matriz = new int[8][4];
        int i,j, piso, oficina;
        System.out.println("Ingrese el numero de piso al que debe concurrir el trabajador(0..7)");
        piso = Lector.leerInt();
        while (piso != 8){
                    System.out.println("Ingrese el numero de oficina al que debe concurrir el trabajador(0..3)");
                    oficina = Lector.leerInt();
                    matriz[piso][oficina] += 1;
                    System.out.println("Ingrese el numero de piso al que debe concurrir el trabajador(0..7)");
                    piso = Lector.leerInt();       
        }
        
        for (i = 0; i<8; i++){
            System.out.println("-------------");
            for(j=0; j<4; j++){
                System.out.print("|" + matriz[i][j] + "|");
            }
            System.out.println();
        }
        
    }
    
}
