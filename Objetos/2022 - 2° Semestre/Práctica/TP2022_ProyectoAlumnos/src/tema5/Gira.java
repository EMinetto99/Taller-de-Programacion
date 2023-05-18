package tema5;

/**
 *
 * @author // Autor del ejercicio: github.com/Auchan22
 */

public class Gira extends Recital {
    private String nombre;
    private Fecha[] vFechas;
    private int DIMF = 0;
    private int DIML = 0;
    private int fechaActual = 0;
    
    public Gira(String nb, int cant, String n, int cantFechas){
        super(nb, cant);
        this.nombre = n;
        this.DIMF = cantFechas;
        this.vFechas = new Fecha[this.DIMF];
    }
    
    public String getNombre(){
        return this.nombre;
    }
    
    public void agregarFecha(Fecha f){
        if(this.DIML < this.DIMF){
            vFechas[this.DIML] = f;
            this.DIML++;
        }else{
            System.out.println("Vector de fechas lleno");
        }
    }
    
    public void actuar(){
        System.out.println("Buenas Noches..."+vFechas[fechaActual].getCiudad()+"\n");
        super.actuar();
        fechaActual++;
    }
    
    public int calcularCosto(){
        int aux = 30000 * this.DIML;
        
        return aux;
    }
}