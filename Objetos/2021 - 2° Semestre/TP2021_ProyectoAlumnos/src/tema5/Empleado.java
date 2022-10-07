package tema5;
abstract class Empleado {
    private String nombre;
    private float sueldoBasico;
    public Empleado(String nombre, float sueldoBasico){
        this.nombre=nombre;
        this.sueldoBasico=sueldoBasico;
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public float getSueldoBasico() {
        return sueldoBasico;
    }
    public void setSueldoBasico(float sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }
    
    public abstract float calcularSueldoACobrar();
    
    public String toString(){
        String aux="Nombre: "+nombre+" | Sueldo: "+calcularSueldoACobrar();
        return aux;
    }
}