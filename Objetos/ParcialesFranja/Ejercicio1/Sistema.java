
package ParcialesFranja.Ejercicio1;

public class Sistema{
    private int dias = 5;
    private int turnos = 6;
    private Paciente [][] agenda = new Paciente[dias][turnos];
    
    public Sistema(){
        for (int i = 0; i < dias; i++){
            for (int j = 0; j < turnos; j++){
                agenda[i][j] = null;
            }
        }
    }
    
    public void agregarPaciente(Paciente p, int unDia, int unTurno){
        agenda[unDia][unTurno] = p;
    }
    
    public void eliminarTurnos(String unNombre){
        for (int i = 0; i < dias; i++){
            for (int j = 0; j < turnos; j++){
                if(agenda[i][j] != null && agenda[i][j].getNombre().equals(unNombre)){
                    agenda[i][j] = null;
                    System.out.println("Turno eliminado");
                }
            }
        } 
    }
    
    public boolean estaAgendado(int unDia, String unNombre){
        boolean encontrado = false;
        int j = 0;
        while (j < turnos && !encontrado){
            if (agenda[unDia][j] != null && agenda[unDia][j].getNombre().equals(unNombre))
                encontrado = true;
            else
                j++;
        }
        return encontrado;
    }
    
}
