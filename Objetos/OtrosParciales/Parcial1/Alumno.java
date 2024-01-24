
package OtrosParciales.Parcial1;

public class Alumno {
    private int dni;
    private String nombre;
    private int asistencias;
    private int autoevaluacionesAprobadas;

    public Alumno(int unDni, String unNombre) {
        setDni(unDni);
        setNombre(unNombre);
        setAsistencias(0);
        setAutoevaluacionesAprobadas(0);
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getAsistencias() {
        return asistencias;
    }

    public void setAsistencias(int asistencias) {
        this.asistencias = asistencias;
    }

    public int getAutoevaluacionesAprobadas() {
        return autoevaluacionesAprobadas;
    }

    public void setAutoevaluacionesAprobadas(int autoevaluacionesAprobadas) {
        this.autoevaluacionesAprobadas = autoevaluacionesAprobadas;
    }
    
    public void incrementarAsistencia(int unDni){
            if(getDni() == unDni)
                this.asistencias++;
        }
    
    public void aprobarAutoevaluacion(int unDni){
            if(getDni() == unDni)
                this.autoevaluacionesAprobadas++;
        }
    }

