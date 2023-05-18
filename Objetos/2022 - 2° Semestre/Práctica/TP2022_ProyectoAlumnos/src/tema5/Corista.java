package tema5;

public class Corista {
    private String nombre;
    private int dni;
    private int edad;
    private int tono;

    public Corista(String nombre, int dni, int edad, int tono) {
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
        this.tono = tono;
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

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getTono() {
        return tono;
    }

    public void setTono(int tono) {
        this.tono = tono;
    }

@Override
public String toString(){
    String str = "Nombre: "+getNombre()+", DNI: "+getDNI()+", edad: "+getEdad()+", tono fundamental: "+getTono()+".";
    return str;
}
}