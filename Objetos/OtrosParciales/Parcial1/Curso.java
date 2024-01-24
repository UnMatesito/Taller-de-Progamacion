
package OtrosParciales.Parcial1;

public abstract class Curso {
    private int añoCursada;
    private int cantAlumnos;
    private int dimL = 0;
    private Alumno [] infoAlumnos;

    public Curso(int unAñoCursada, int unaCantAlumnos) {
        setAñoCursada(unAñoCursada);
        setCantAlumnos(unaCantAlumnos);
        infoAlumnos = new Alumno[unaCantAlumnos];
    }

    public int getAñoCursada() {
        return añoCursada;
    }

    public void setAñoCursada(int añoCursada) {
        this.añoCursada = añoCursada;
    }

    public int getCantAlumnos() {
        return cantAlumnos;
    }

    public void setCantAlumnos(int cantAlumnos) {
        this.cantAlumnos = cantAlumnos;
    }
    
    public boolean agregarAlumno(Alumno a){
        boolean seAgrego = true;
        if (dimL < cantAlumnos && seAgrego){
            infoAlumnos[dimL] = a;
            dimL++;
        }
        else
            if (dimL > cantAlumnos)
                seAgrego = false;
        return seAgrego;
    }
    
    public abstract boolean puedeRendir(Alumno a);
    
    public int cantDeAlumnosQuePuedenRendir(){
        int cant = 0;
        for (int i = 0; i < cantAlumnos; i++){
            if (infoAlumnos[i] != null && puedeRendir(infoAlumnos[i]))
                cant++;
        }
        return cant;
    }
    
}
