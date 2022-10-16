package tema4;
public class Jugador extends Empleado{
    private int partidosGanados = 0;
    private int golesAnotados = 0;

    public Jugador(){
    }
    public Jugador(String nom, double sueldo, int antiguedad, int partidosG, int golesA) {
        super(nom, sueldo, antiguedad);
        partidosGanados = partidosG;
        golesAnotados = golesA;
    }

    public int getPartidosGanados() {
        return partidosGanados;
    }
    public void setPartidosGanados(int partidosGanados) {
        this.partidosGanados = partidosGanados;
    }
    public int getGolesAnotados() {
        return golesAnotados;
    }
    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }

    @Override
    public double calcularEfectividad(){
        double promedio = getPartidosGanados()/getGolesAnotados();
        return promedio;
    }
    @Override
    public double calcularSueldoACobrar(){
        double sueldo = getSueldo();
        sueldo += (getSueldo()*getAntiguedad())*0.10f;
        double prom = calcularEfectividad();
        if (prom > 0.5){
            sueldo *= 2;
        }
        return sueldo;
    }

@Override
    public String toString(){
        return "Jugador "+super.toString();
    }
}