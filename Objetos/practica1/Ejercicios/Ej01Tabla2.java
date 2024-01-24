
package tema1.Ejercicios;
import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
       
        i = 1 + GeneradorAleatorio.generarInt(DF);
        while (i != DF){
            i = 1 + GeneradorAleatorio.generarInt(DF);
            tabla2[GeneradorAleatorio.generarInt(DF)]=i;
        }
        for (i=0;i<DF;i++)
                System.out.println(tabla2[i]);
        
        for (i = 0; i<DF; i++)
            System.out.print(tabla2[i]*2 + " ");
    }
    
}
