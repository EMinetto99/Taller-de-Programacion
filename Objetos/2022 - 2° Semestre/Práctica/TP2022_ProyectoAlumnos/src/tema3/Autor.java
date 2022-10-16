package tema3;

public class Autor {
    // Atributos
    private String nombre;
    private String biografia;
    private String origen;
    
    // Atributos
    // Constructores y Sobrecarga de Constructores
    public Autor(){
    }
    public Autor(String nombre){
        this.nombre = nombre;
        this.biografia = "Desconocida";
        this.origen = "Desconocido";
    }
    public Autor(String nombre, String biografia){
        this(nombre);
        this.biografia = biografia;
        this.origen = "Desconocido";
    }
    public Autor(String nombre, String biografia, String origen){
        this(nombre, biografia);
        this.origen = origen;
    }
    
    public String getNombre(){
        return nombre;
    }
    public String getBiografia(){
        return biografia;
    }
    public String getOrigen(){
        return origen;
    }
    
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public void setBiografia(String biografia){
        this.biografia = biografia;
    }
    public void setOrigen(String origen){
        this.origen = origen;
    }
    
    @Override
    public String toString(){
        return getNombre()+", biografia: "+getBiografia()+", origen: "+getOrigen();
    }
}