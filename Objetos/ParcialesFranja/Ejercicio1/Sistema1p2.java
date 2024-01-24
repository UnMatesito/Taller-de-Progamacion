
package ParcialesFranja.Ejercicio1;

public class Sistema1p2{
    private int dias = 5;
    private int turnos = 6;
    private Paciente [][] agenda = new Paciente[dias][turnos];
    
    public Sistema1p2(){
        for (int i = 0; i < dias; i++){
            for (int j = 0; j < turnos; j++){
                agenda[i][j] = null;
            }
        }
    }
    
    public void agregarPaciente(Paciente p, int unTurno){
        int i = 0;
        boolean seAgrego = false;
        while(i < dias && !seAgrego){
            if (agenda[i][unTurno] == null){
                    agenda[i][unTurno] = p;
                    seAgrego = true;
                    System.out.println("Se agrego el paciente en el dia: " + i);
                }
             else
                 i++;
        }
    }
    
    public void eliminarTurnos(int unDia, String unNombre){
        for (int i = 0; i < turnos; i++){
            if (agenda[unDia][i] != null && agenda[unDia][i].getNombre().equals(unNombre)){
                agenda[unDia][i] = null;
                System.out.println("Se elimino al paciente que tenia un turno en " + i);
            }
        }
    }
    
    public int cantidadTurnos(String unNombre){
        int cant = 0;
        for (int i = 0; i < dias; i++){
            for (int j = 0; j < turnos; j++){
                if(agenda[i][j] != null && agenda[i][j].getNombre().equals(unNombre))
                    cant++;
            }
        }
        return cant;
    }

    
}
