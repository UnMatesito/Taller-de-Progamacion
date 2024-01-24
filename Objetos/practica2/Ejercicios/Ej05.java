/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2.Ejercicios;
import PaqueteLectura.Lector;

public class Ej05 {
    public static void main(String[] args) {
        Partido vectorPartidos[] = new Partido[20];
        
        int i=0;
        boolean continuar = true;
        while ((i < 20) && (continuar)){
            System.out.println("Ingrese el equipo local del partido");
            String local = Lector.leerString();
            System.out.println("Ingrese el equipo visitante del partido");
            String visitante = Lector.leerString();
            if (!visitante.equals("ZZZ")){
                System.out.println("Ingrese los goles del equipo local");
                int golesLocal = Lector.leerInt();
                System.out.println("Ingrese los goles del equipo visitante");
                int golesVisitante = Lector.leerInt();
                vectorPartidos[i] = new Partido(local, visitante, golesLocal, golesVisitante);
                i++;
                System.out.println();
            }
            else
                continuar = false;
        }
        
        System.out.println();
        System.out.println("Resultados");
        int j;
        for (j = 0; j<i; j++){
            String local = vectorPartidos[j].getLocal();
            String visitante = vectorPartidos[j].getVisitante();
            int golesLocal = vectorPartidos[j].getGolesLocal();
            int golesVisitante = vectorPartidos[j].getGolesVisitante();
            System.out.println(local + "-" + golesLocal + " VS " + visitante + "-" + golesVisitante);
            System.out.println();
        }
        
        int victorias = 0;
        for (j = 0; j<i; j++){
            if (vectorPartidos[j].getGanador().equals("River"))
                victorias++;
        }
        System.out.println("River gano " + victorias + " partido/os");
        
        int totalGoles = 0;
        for (j = 0; j<i; j++){
            if (vectorPartidos[j].getLocal().equals("Boca"))
                totalGoles += vectorPartidos[j].getGolesLocal();
            else{
                if (vectorPartidos[j].getVisitante().equals("Boca"))
                    totalGoles += vectorPartidos[j].getGolesVisitante();
            }
        }
        System.out.println("Boca metio " + totalGoles + " goles en todo el campeonato");
    }
}
