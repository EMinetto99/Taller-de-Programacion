package TurnoB_Tema1;

public class Torneo {
    private String nombre;
    private Fecha tabla[];
    private int nFechas;
    private int nGoleadores;
    
    public Torneo(String nombre, int numF, int numG){
        this.nombre = nombre;
        nFechas = numF;
        nGoleadores = numG;
        inicializarFechas();
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void inicializarFechas(){
        tabla = new Fecha[nFechas];
        Fecha f;
        for (int i = 0; i < nFechas; i++){
            f = new Fecha(nGoleadores);
            tabla[i] = f;
        }
    }
    public void agregarGoleador(int numF, Goleador g){
        numF--;
        tabla[numF].agregarGoleador(g);
    }
    public Goleador menorGoleador(int numF){
        numF--;
        return tabla[numF].menorGoleador();
    }
    public int cantGoleadoresTotales(){
        int totalGoles = 0;
        for (int i = 0; i < nFechas; i++){
            totalGoles += tabla[i].getCantGoleadores();
        }
        return totalGoles;
    }

    @Override
    public String toString (){
        String str = "TORNEO 2022: "+getNombre()+"\n";
        for (int i = 0; i < nFechas; i++){
            str += "Fecha #"+(i+1)+" | Cantidad de goleadores de la fecha: "+tabla[i].getCantGoleadores()+" | "+tabla[i].toString()+"\n";
        }
        return str;
    }
}