package tema3;
public class Cliente {      // Reemplazado por la clase Persona de la practica 2
    private String nombre;
    private int dni;
    private int edad;
    
    // Metodos - Constructores
    public Cliente(){
    }
    public Cliente(String nombre){
        this.nombre = nombre;
    }
    public Cliente(String nombre, int dni){
        this(nombre);
        this.dni = dni;
    }
    public Cliente(String nombre, int dni, int edad){
        this(nombre, dni);
        this.edad = edad;
    }

    // Metodos - Getters
    public String getNombre() {
        return nombre;
    }
    public int getDNI() {
        return dni;
    }
    public int getEdad() {
        return edad;
    }

    // Metodos - Setters
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public void setDNI(int dni) {
        this.dni = dni;
    }
    public void setEdad(int edad) {
        this.edad = edad;
    }

@Override
    public String toString(){
        return "Nombre: "+getNombre()+", DNI: "+getDNI()+", edad: "+getEdad();
    }
}