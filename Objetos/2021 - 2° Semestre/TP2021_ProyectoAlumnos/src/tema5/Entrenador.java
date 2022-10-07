package tema5;
public class Entrenador extends Empleado {
    //Atributos
    private int cantPartidosGanados;
    
    //Metodos
    public Entrenador(String nom, float sueldo_b, int cant_partidos){
        super(nom,sueldo_b);
        cantPartidosGanados=cant_partidos;
    }
    public void setCantPartidosGanados(int ganados){
        cantPartidosGanados=ganados;
    }
    public int getCantPartidosGanados(){
        return cantPartidosGanados;
    }
    public float calcularSueldoACobrar(){
        float sueldoBruto=getSueldoBasico();
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
    public String toString(){
        String aux=super.toString()+" | Partidos ganados: "+cantPartidosGanados;
        return aux;
    }
}