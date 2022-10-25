package TurnoB_Tema2;
public class Comprador {
    private String nombre;
    private int DNI;
    private String apellido;
    private String ciudad;
    
    public Comprador(String nombre, int DNI, String apellido, String ciudad){
        this.nombre = nombre;
        this.DNI = DNI;
        this.apellido = apellido;
        this.ciudad = ciudad;
    }

    // Getters
    public String getNombre() {
        return nombre;
    }
    public int getDNI() {
        return DNI;
    }
    public String getApellido() {
        return apellido;
    }
    public String getCiudad() {
        return ciudad;
    }

    // Setters
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public void setDNI(int DNI) {
        this.DNI = DNI;
    }
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    @Override
    public String toString() {
        return "Comprador: {"+"Nombre: "+nombre+", DNI: "+DNI+", apellido: "+apellido+", ciudad: "+ciudad+'}';
    }
}