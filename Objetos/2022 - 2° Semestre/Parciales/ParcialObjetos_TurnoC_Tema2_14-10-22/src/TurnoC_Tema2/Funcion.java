package TurnoC_Tema2;
public class Funcion {
    private String titulo;
    private String fecha;
    private String hora;
    private int numF;
    private int numB;
    private Butaca mtxFuncion[][];

    public Funcion(String titulo, String fecha, String hora, int numF, int numB) {
        this.titulo = titulo;
        this.fecha = fecha;
        this.hora = hora;
        this.numF = numF;
        this.numB = numB;
        mtxFuncion = new Butaca[numF][numB];
        inicializarFuncion();
    }

    public String getTitulo() {
        return titulo;
    }
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    public String getFecha() {
        return fecha;
    }
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    public String getHora() {
        return hora;
    }
    public void setHora(String hora) {
        this.hora = hora;
    }
    
    public void inicializarFuncion(){
        Butaca b;
        for (int i = 0; i<numF; i++){
            for (int j = 0; j<numB; j++){
                b = new Butaca(i+1,j+1);
                mtxFuncion[i][j] = b;
            }
        }
    }
    public void ocuparButaca(int numF, int numB){
        numF--;
        numB--;
        if (!mtxFuncion[numF][numB].getEstado()){
            System.out.print("Ocupando butaca...");
            mtxFuncion[numF][numB].setEstado(true);
            System.out.print("La butaca ha sido ocupada con exito.");
            mtxFuncion[numF][numB].setEstado(true);
            System.out.println("Su precio es de $"+mtxFuncion[numF][numB].getPrecio());
        } else {
            System.out.println("La butaca ESTA OCUPADA!!! >:(");
        }
    }
    public void desocuparFilasButaca(int numF){
        numF--;
        for (int i = 0; i < numB; i++){
            mtxFuncion[numF][i].setEstado(false);
        }
        System.out.println("Fila "+(numF+1)+" desocupada con exito.");
    }

    public String mostrarColumnaButacas(int numB){
        numB--;
        String str = "";
        for (int i = 0; i < numF; i++){
            str += "Butaca N"+(i+1)+" "+mtxFuncion[i][numB].toString()+"\n";
        }
        return str;
    }
    public String mostrarFuncion(){
        String str = "";
        for (int i = 0; i < numF; i++){
            for (int j = 0; j < numB; j++){
                str += " ["+mtxFuncion[i][j].toString()+"]";
            }
            str += "\n";
        }
        return str;
    }
    
    @Override
    public String toString() {
        return "Funcion ("+"Titulo: "+titulo+", Fecha: "+fecha+", Hora: "+hora+"\n"+mostrarFuncion();
    }    
}