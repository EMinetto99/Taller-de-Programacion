package TurnoD_Tema1;
public class Alumno {
    private String nombre;
    private int dni;
    private int asistencias = 0;
    private int cantAutoAprobadas = 0;
    
    public Alumno(String nombre, int dni){
        this.nombre = nombre;
        this.dni = dni;
        asistencias = 0;
        cantAutoAprobadas = 0;
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public int getDNI() {
        return dni;
    }
    public void setDNI(int dni) {
        this.dni = dni;
    }
    public int getAsistencias() {
        return asistencias;
    }
    public void setAsistencias(int asistencias) {
        this.asistencias = asistencias;
    }
    public int getCantAutoAprobadas() {
        return cantAutoAprobadas;
    }
    public void setCantAutoAprobadas(int cantAutoAprobadas) {
        this.cantAutoAprobadas = cantAutoAprobadas;
    }

}