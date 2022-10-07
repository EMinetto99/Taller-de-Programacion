package tema4;

public class Autor {
    // Atributos
    private String nombre;
    private String biografia;
    // Metodo Constructor
    public Autor(String nombre, String biografia){
        this.nombre=nombre;
        this.biografia=biografia;
    }
    public Autor(String nombre){
        this(nombre, "");
    }
    // Metodos
    public void setNombre(String nom){
        nombre=nom;
    }
    public String getNombre(){
        return nombre;
    }
    public void setBiografia(String bio){
        biografia=bio;
    }
    public String getBiografia(){
        return biografia;
    }

    @Override
    public String toString() {
        return nombre+" "+biografia;
    }
}