package TurnoB_Tema1;

public class Goleador {
    private String nombre;
    private String nombreEquipo;
    private int cantGoles = 0;

    public Goleador(String nombre, String equipo, int cantGoles){
        this.nombre = nombre;
        nombreEquipo = equipo;
        this.cantGoles = cantGoles;
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getNombreEquipo() {
        return nombreEquipo;
    }
    public void setNombreEquipo(String nombreEquipo) {
        this.nombreEquipo = nombreEquipo;
    }
    public int getCantGoles() {
        return cantGoles;
    }
    public void setCantGoles(int cantGoles) {
        this.cantGoles = cantGoles;
    }

    @Override
    public String toString() {
        return "{"+getNombre()+", "+getNombreEquipo()+", "+getCantGoles()+'}';
    }
}