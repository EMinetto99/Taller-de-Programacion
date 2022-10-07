package tema3;
public class Entrenador_Desarrollo {
    //Atributos
    private String nombre;
    private double sueldoBasico;
    private int cantPartidosGanados;
    
    //Metodos
    public Entrenador_Desarrollo(String nom, double sueldo_b, int cant_partidos){
        nombre=nom;
        sueldoBasico=sueldo_b;
        cantPartidosGanados=cant_partidos;
    }
    public Entrenador_Desarrollo(){
        
    }
    public void setNombre(String nom){
        nombre=nom;
    }
    public String getNombre(){
        return nombre;
    }
    public void setSueldoBasico(double sueldo){
        sueldoBasico=sueldo;
    }
    public double getSueldoBasico(){
        return sueldoBasico;
    }
    public void setCantPartidosGanados(int ganados){
        cantPartidosGanados=ganados;
    }
    public int getCantPartidosGanados(){
        return cantPartidosGanados;
    }
    public double calcularSueldoACobrar(){
        double sueldoBruto=sueldoBasico;
        if (cantPartidosGanados>=1 && cantPartidosGanados<=4){
            sueldoBruto+=5000;
        }
        else {
            if (cantPartidosGanados>=5 && cantPartidosGanados<=10){
            sueldoBruto+=30000;
            }
            else {
                sueldoBruto+=50000;
            }
        }
        return sueldoBruto;
    }
}
