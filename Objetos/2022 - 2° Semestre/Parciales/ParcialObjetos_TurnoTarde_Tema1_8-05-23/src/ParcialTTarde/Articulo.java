package ParcialTTarde;

public class Articulo {
    private String descripcion;
    private int id;
    private double monto;
    Persona ganador = null;

    public Articulo(int id, String descripcion, double montoInicial) {
        this.descripcion = descripcion;
        this.id = id;
        monto = montoInicial;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String unaDescripcion) {
        descripcion = unaDescripcion;
    }

    public int getID() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public Persona getGanador() {
        return ganador;
    }

    public void setGanador(Persona ganador) {
        if (this.ganador == null){
            this.ganador = new Persona();
        }
        this.ganador = ganador;
    }

@Override
    public String toString() {
        return getDescripcion()+", ID: "+getID()+ ", monto: $" +getMonto();
    }
}   