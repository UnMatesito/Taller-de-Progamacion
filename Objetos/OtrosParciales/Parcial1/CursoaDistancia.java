
package OtrosParciales.Parcial1;

public class CursoaDistancia extends Curso{
    private String linkSala;

    public CursoaDistancia(int unAñoCursada, int unaCantAlumnos, String unLink) {
        super(unAñoCursada, unaCantAlumnos);
        setLinkSala(unLink);
    }

    public String getLinkSala() {
        return linkSala;
    }

    public void setLinkSala(String linkSala) {
        this.linkSala = linkSala;
    }

    public boolean puedeRendir(Alumno a){
        return a.getAsistencias() >= 1 && a.getAutoevaluacionesAprobadas() >= 3;
    }

}
