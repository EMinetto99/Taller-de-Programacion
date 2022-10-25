package TurnoB_Tema2;
public class Barrio {
    private String nombreBarrio;
    private Lote barrio[][];
    private int numMan;
    private int numLote;
    
    public Barrio(String nombre, int numM, int numL){
        nombreBarrio = nombre;
        numMan = numM;
        numLote = numL;
        inicializarBarrio();
    }

    // Getters
    public String getNombreBarrio(){
        return nombreBarrio;
    }
    public int getNumMan() {
        return numMan;
    }
    public int getNumLote() {
        return numLote;
    }

    // Setters
    public void setNombreBarrio(String nombreBarrio) {
        this.nombreBarrio = nombreBarrio;
    }
    public void setNumMan(int numMan) {
        this.numMan = numMan;
    }
    public void setNumLote(int numLote) {    
        this.numLote = numLote;
    }

    // Metodos
    public void inicializarBarrio() {
        Lote l;
        barrio = new Lote[numMan][numLote]; // INSTANCIAR MATRIZ
        for (int i = 0; i < numMan; i++){
            for (int j = 0; j < numLote; j++){
                l = new Lote(50000, null);
                barrio[i][j] = l;
            }
        }
    }
    public void agregarComprador(Comprador c, int numM, int numL){
        numM--;     // CHECK - DECCRMENTAR
        numL--;     // CHECK - DECREMENTAR
        barrio[numM][numL].setComprador(c);
    }
    public void incrementarPrecio(int numM, double p){
        numM--;     // DECREMENTAR
        double precio = 0;
        for (int i = 0; i < numLote; i++){
                precio = (barrio[numM][i].getPrecio())+(barrio[numM][i].getPrecio()*(p/100)); // ARREGLAR EL PORSENTAJE (p)
                barrio[numM][i].setPrecio(precio);
        }
    }
    public double retornarTotalVendido(){
        double total = 0;
        for (int i = 0; i < numMan; i++){
            for (int j = 0; j < numLote; j++){
                if (barrio[i][j].getComprador() != null){
                    total += barrio[i][j].getPrecio();
                }
            }
        }
        return total;
    }

    @Override
    public String toString(){
        String str = "";
        str += "Barrio "+getNombreBarrio()+"\n";
        str += "Recaudacion actual: $"+retornarTotalVendido()+"\n";
        for (int i = 0; i < numMan; i++){
            str += "MANZANA #"+(i+1)+"\n";
            for (int j = 0; j < numLote; j++){
                if (barrio[i][j].getComprador() != null){
                    str += "Lote #"+(j+1)+" precio: $"+barrio[i][j].getPrecio()+" "+barrio[i][j].getComprador().toString()+"\n";
                } else {
                    str += "Lote #"+(j+1)+" precio: $"+barrio[i][j].getPrecio()+" Disponible para la venta!\n";
                }
            }
        }
        return str;
    }
}