package tema5;

public class Director {
    private String nombre;
    private int dni;
    private int edad;
    private int antiguedad;

    public Director(String nombre, int dni, int edad, int antiguedad) {
        this.nombre = nombre;
        this.dni = dni;
        this.edad = edad;
        this.antiguedad = antiguedad;
    }

    

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public int getDNI(){
        return dni;
    }
    public void setDNI(int dni){
        this.dni = dni;
    }
    public int getEdad(){
        return edad;
    }
    public void setEdad(int edad){
        this.edad = edad;
    }

    public int getAntiguedad(){
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString(){
    String str = "Director: "+getNombre()+", edad: "+getEdad()+", DNI: "+getDNI()+", antiguedad: "+getAntiguedad()+".";
    return str;
    }
}