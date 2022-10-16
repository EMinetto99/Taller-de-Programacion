package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    private double costo = 0;
    private Cliente cliente;
    private boolean ocupada = false;

    // Metodos - Constructores
    public Habitacion(){
        cliente = null;
        double rnd = (GeneradorAleatorio.generarDouble(6001))+2000;
        costo = rnd;
    }
    public Habitacion(Cliente client){
        setCliente(client);
    }

    // Metodos - Setters
    public void setCliente(Cliente cliente){
        this.cliente = cliente;
        ocupada = true;
        double rnd = (GeneradorAleatorio.generarDouble(6000))+2000;
        costo = rnd;
    }
    public void setCosto(double costo){
        this.costo = costo;
    }

    // Metodos - Getters
    public double getCosto(){
        return costo;
    }
    public boolean getOcupada(){
        return ocupada;
    }

    public String mostrarHabitacion(){
        String msg = "Costo $"+getCosto();
        if (getOcupada()){
            msg += ", ocupada, " + cliente.toString();
            } else {
                msg += ", libre";
            }
        msg += ("]");
        return msg;
    }

@Override
public String toString(){
    return "[Costo: "+getCosto()+" Cliente: ("+cliente+") Ocupada: "+getOcupada()+"]";
}
}