package tema4;
public class Autor {
    // Atributos
    private String nombre;
    private String biografia;
    private String origen;
    
    // Constructores
    public Autor(String nombre, String bio, String origen){
    this.nombre=nombre;
    biografia=bio;
    this.origen=origen;
    }
    public Autor(String nombre){
        this(nombre,"No asignado","No asignado");
    }
    public Autor(String nombre, String bio){
        this(nombre,bio,"No asignado");
    }
    
    // Metodos
    public String getNombre(){
        return nombre;
    }
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    public String getBiografia(){
        return biografia;
    }
    public void setBiografia(String bio){
        biografia=bio;
    }
    public String getOrigen(){
        return origen;
    }
    public void setOrigen(String origen){
        this.origen=origen;
    }
    
@Override
    public String toString(){
        String aux=nombre+getNombre()+" - Biografia: "+biografia+" - Origen: "+origen+".";
        return aux;
    }
}