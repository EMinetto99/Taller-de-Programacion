package TurnoB_Tema2;
public class Lote {
    private double precio = 50000;
    private Comprador comprador = null;
    
    public Lote(double precio, Comprador c){
        this.precio = 50000;
        comprador = null;
    }

    // Getters
    public double getPrecio() {
        return precio;
    }
    public Comprador getComprador() {
        return comprador;
    }

    // Setters
    public void setPrecio(double precio) {
        this.precio = precio;
    }
    public void setComprador(Comprador comprador) {
        this.comprador = comprador;
    }

    @Override
    public String toString() {
        return "Lote {"+"precio: $"+getPrecio()+", comprador: "+getComprador()+'}';
    }
}