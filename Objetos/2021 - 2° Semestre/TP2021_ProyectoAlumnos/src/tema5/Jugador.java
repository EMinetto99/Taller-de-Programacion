package tema5;
public class Jugador extends Empleado {
    private int partidosJugados;
    private int golesAnotados;
    public Jugador(String nom, float sueldo_b, int partidosJugados, int golesAnotados){
        super(nom,sueldo_b);
        this.partidosJugados=partidosJugados;
        this.golesAnotados=golesAnotados;
    }

    public int getPartidosJugados() {
        return partidosJugados;
    }
    public void setPartidosJugados(int partidosJugados) {
        this.partidosJugados = partidosJugados;
    }
    public int getGolesAnotados() {
        return golesAnotados;
    }
    public void setGolesAnotados(int golesAnotados) {
        this.golesAnotados = golesAnotados;
    }
    
    public float calcularSueldoACobrar(){
        float sueldoBruto=getSueldoBasico();
        float prom=golesAnotados/partidosJugados;
        if (prom>0.5){
            sueldoBruto*=2;
        }
        return sueldoBruto;
    }
    public String toString(){
        String aux=super.toString()+" | Partidos jugados: "+partidosJugados+" | Goles anotados: "+golesAnotados;
        return aux;
    }
}