package tema4;
public class Entrenador extends Empleado{
    private int campeonatosGanados = 0;

    public Entrenador(){
    }
    public Entrenador(String nom, double sueldo, int antiguedad, int campeonatosG) {
        super(nom, sueldo, antiguedad);
        campeonatosGanados = campeonatosG;
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }
    public void setCampeonatosGanados(int campeonatosG) {
        campeonatosGanados = campeonatosG;
    }

    @Override
    public double calcularEfectividad(){
        double promedio = getCampeonatosGanados()/super.getAntiguedad();
        return promedio;
    }
    @Override
    public double calcularSueldoACobrar(){
        double sueldo = getSueldo();
        sueldo += (getSueldo()*getAntiguedad())*0.10f;
        int camp = getCampeonatosGanados();
        if ((camp >= 1) && (camp <= 4)){
            sueldo += 5000;
        } else if ((camp >= 5) && (camp <= 10)){
            sueldo += 30000;
        } else if (camp > 10){
            sueldo += 50000;
        }
        return sueldo;
    }

@Override
    public String toString(){
        return "Entrenador "+super.toString();
    }
}