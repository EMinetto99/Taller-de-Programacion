package tema3;
public class Hotel {
    int max_habitaciones = 0;
    private Habitacion vec_habitaciones[];
    
    public Hotel(int cantHabitaciones){
        max_habitaciones = cantHabitaciones;
        vec_habitaciones = new Habitacion[cantHabitaciones];
        Habitacion h;
        for (int i = 0; i < max_habitaciones; i++){
            h = new Habitacion();
            vec_habitaciones[i] = h;
        }
    }

    public void aumentarPrecio(double valAumento){
        double monto;
        for (int i = 0; i<max_habitaciones; i++){
            if (vec_habitaciones[i] != null){
                monto = vec_habitaciones[i].getCosto();
                monto += valAumento;
                vec_habitaciones[i].setCosto(monto);
            }
        }
    }
    public void ingresarCliente(Cliente client, int numHab){
        numHab--; // Ajustado al vector
        if (!vec_habitaciones[numHab].getOcupada()){
            vec_habitaciones[numHab].setCliente(client);
            System.out.println("El cliente ha sido agregado con exito en la habitacion "+(numHab+1)+"!");
        } else {
            System.out.println("La habitacion esta ocupada! Intente con otra habitacion.");
        }
    }
    private String mostrarHotel(){
        String msg = "Hotel\n";
        for (int i = 0; i < max_habitaciones; i++){
            msg += "Habitacion N"+(i+1)+": "; 
            msg += vec_habitaciones[i].mostrarHabitacion();
            msg += "\n";
        }
        return msg;
    }

@Override
    public String toString(){
        return mostrarHotel();
    }
}