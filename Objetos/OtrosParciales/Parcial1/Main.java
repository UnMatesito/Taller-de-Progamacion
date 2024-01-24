
package OtrosParciales.Parcial1;

public class Main {
    public static void main(String[] args) {
        CursoPresencial cp = new CursoPresencial(2022, 7, 4);
        CursoaDistancia cd = new CursoaDistancia(2022, 10, "G3DSCE2DA");
        Alumno a = new Alumno(324234, "Pepe");
        a.incrementarAsistencia(324234);
        a.aprobarAutoevaluacion(324234);
        a.incrementarAsistencia(324234);
        a.aprobarAutoevaluacion(324234);
        a.incrementarAsistencia(324234);
        a.aprobarAutoevaluacion(324234);
        System.out.println(a.getAsistencias() + " " + a.getAutoevaluacionesAprobadas());
        
        cd.agregarAlumno(a);
        cp.agregarAlumno(a);
        System.out.println(cd.cantDeAlumnosQuePuedenRendir() + "\n"
                                          + cp.cantDeAlumnosQuePuedenRendir());

    }
}
