
package OtrosParciales.Parcial1;

public class CursoPresencial extends Curso{
    private int numeroAula;

    public CursoPresencial(int unAñoCursada, int unaCantAlumnos, int unNumeroAula) {
        super(unAñoCursada, unaCantAlumnos);
        setNumeroAula(unNumeroAula);
    }
    
    public int getNumeroAula() {
        return numeroAula;
    }

    public void setNumeroAula(int numeroAula) {
        this.numeroAula = numeroAula;
    }
    
    public boolean puedeRendir(Alumno a){
        return a.getAsistencias() >= 3;
    }
}
