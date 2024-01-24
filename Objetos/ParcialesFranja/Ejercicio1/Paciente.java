
package ParcialesFranja.Ejercicio1;

public class Paciente {
    private String nombre;
    private boolean obraSocial;
    private double costoSesion;
    
    public Paciente(String unNombre, boolean tieneObra, double unCosto){
        setNombre(unNombre);
        setObraSocial(tieneObra);
        setCostoSesion(unCosto);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean tieneObraSocial() {
        return obraSocial;
    }

    public void setObraSocial(boolean obraSocial) {
        this.obraSocial = obraSocial;
    }

    public double getCostoSesion() {
        return costoSesion;
    }

    public void setCostoSesion(double costoSesion) {
        this.costoSesion = costoSesion;
    }
    
    
}
