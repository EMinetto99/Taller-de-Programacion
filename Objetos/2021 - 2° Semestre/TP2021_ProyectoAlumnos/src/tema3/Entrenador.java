package tema3;
public class Entrenador {
    //Atributos
    String nombre;
    double sueldoBasico;
    int cantPartidosGanados;
    
    //Metodos
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
