
package ParcialesFranja.Ejercicio1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej01p1 {
    public static void main(String[] args) {
        Sistema s = new Sistema();
        for (int i = 0; i < 15; i++){
            Paciente p = new Paciente(GeneradorAleatorio.generarString(1 + GeneradorAleatorio.generarInt(15)), 
                                                            GeneradorAleatorio.generarBoolean(), GeneradorAleatorio.generarDouble(10000));
            s.agregarPaciente(p, GeneradorAleatorio.generarInt(5), GeneradorAleatorio.generarInt(6));
            System.out.println(p.getNombre());
        }
        Paciente p1 = new Paciente("AAA", true, 3000);
        s.agregarPaciente(p1, 0, 0);
        s.agregarPaciente(p1, 3, 2);
        System.out.println(s.estaAgendado(0, "AAA"));
        
       s.eliminarTurnos("AAA");
    }
}
