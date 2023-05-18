package tema5;

public abstract class Coro {
    private String nombre;
    public Director director;

    public String getNombreCoro(){
        return nombre;
    }
    public Director getDirector(){
        return director;
    }

    public void setNombreCoro(String nombre) {
        this.nombre = nombre;
    }
    public void setDirector(Director direc){
        director = direc;
    }
    
    public abstract void agregarCorista(Corista cor);
    public abstract boolean estaLleno();
    public abstract boolean estaOrdenado();
    public abstract String mostrarCoristas();

@Override
    public String toString(){
        String str = "Nombre del coro: "+getNombreCoro()+"\n"
                +getDirector().toString()+"\n"+
                mostrarCoristas();
    return str;
    }
}