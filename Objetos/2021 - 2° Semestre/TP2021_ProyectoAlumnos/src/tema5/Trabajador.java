package tema5;
public class Trabajador extends Persona {
    private String tarea;
    public Trabajador(String nombre, int dni, int edad, String tarea){
        super(nombre,dni,edad);
        this.tarea=tarea;
    }

    public String getTarea() {
        return tarea;
    }
    public void setTarea(String tarea) {
        this.tarea = tarea;
    }
    
    @Override
    public String toString(){
        String aux = super.toString()+" Soy "+tarea+".";
        return aux;
    }
}