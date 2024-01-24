
package ParcialesFranja.Ejercicio1;

public class Ej01p2 {

    public static void main(String[] args) {
        Paciente p = new Paciente("Papa", true, 5000);
        Paciente p2 = new Paciente("Jo", false, 231223);
        
        Sistema1p2 s = new Sistema1p2();
        
        s.agregarPaciente(p, 3);
        s.agregarPaciente(p2, 2);
        s.agregarPaciente(p2, 3);
        s.agregarPaciente(p, 2);
        
        s.eliminarTurnos(1, "Papa");
        
        System.out.println(s.cantidadTurnos("Jo"));
    }
}
