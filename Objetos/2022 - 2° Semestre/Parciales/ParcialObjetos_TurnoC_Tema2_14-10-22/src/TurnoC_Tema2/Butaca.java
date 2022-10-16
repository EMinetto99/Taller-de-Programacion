package TurnoC_Tema2;
public class Butaca {
    private String descriptor;
    private double precio = 0;
    private boolean estado = false;

    public Butaca(int numF, int numB){
        setDescriptor(numF, numB);
        precio = (800+100*numF);
    }
    public Butaca(String descriptor, double precio, boolean estado){
        this.descriptor = descriptor;
        this.precio = precio;
        this.estado = estado;
    }

    public void setDescriptor(int numF, int numB){
        descriptor = "Butaca "+numF+" "+numB+".";
    }
    public String getDescriptor(){
        return descriptor;
    }
    public double getPrecio() {
        return precio;
    }
    public void setPrecio(double precio) {
        this.precio = precio;
    }
    public boolean getEstado() {
        return estado;
    }
    public void setEstado(boolean estado) {
        this.estado = estado;
    }

@Override
    public String toString(){
        return "Descriptor: "+this.getDescriptor()+" Precio: "+getPrecio()+" Estado: "+getEstado()+".";
    }
}