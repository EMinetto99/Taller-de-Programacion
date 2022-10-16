package tema4;
public class Trabajador extends Persona{
    private String tarea;

    public Trabajador(){
    }
    public Trabajador(String nombre, int dni, int edad, String tarea){
        super(nombre, dni, edad);
        this.tarea = tarea;
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }

@Override
    public String toString(){
        return super.toString()+" Soy "+getTarea()+".";
    }
}