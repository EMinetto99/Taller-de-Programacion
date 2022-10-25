package TurnoB_Tema1;

public class Fecha {
    private Goleador goleadores[];
    private int cantG = 0;

    public Fecha(int numG){
        inicializarGoleadores(numG);
    }

    public int getCantGoleadores(){
        return cantG;
    }

    public void inicializarGoleadores(int numG){
        goleadores = new Goleador[numG];
        numG--;
        for (int i = 0; i < numG; i++){
            goleadores[i] = null;
        }
    }
    public void agregarGoleador(Goleador g){
        goleadores[cantG] = g;
        cantG++;
    }
    public Goleador menorGoleador(){
        int min = 9999;
        Goleador gMin = null;
        for (int i = 0; i < cantG; i++){
            if (goleadores[i].getCantGoles() < min){
                min = goleadores[i].getCantGoles();
                gMin = goleadores[i];
            }
        }
        return gMin;
    }

    @Override
    public String toString(){
        String str = "Goleadores: ";
        for (int i = 0; i < cantG; i++){
            str += goleadores[i].toString()+" ";
        }
        return str;
    }
}