package tema4;
public abstract class Empleado {
    private String nombre;
    private double sueldo = 0;
    private int antiguedad;

    public Empleado(){
    }
    public Empleado(String nom, double sueldo, int antiguedad){
        nombre = nom;
        this.sueldo = sueldo;
        this.antiguedad = antiguedad;
    }

    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public void setSueldo(double sueldo){
        this.sueldo = sueldo;
    }
    public void setAntiguedad(int antiguedad){
        this.antiguedad = antiguedad;
    }

    public String getNombre(){
        return nombre;
    }
    public double getSueldo(){
        return sueldo;
    }
    public int getAntiguedad(){
        return antiguedad;
    }

    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
    
    public String toString(){
        return getNombre()+", sueldo a cobrar: $"+calcularSueldoACobrar()+", efectividad del %"+calcularEfectividad()+".";
    }
}