package tema3;

import PaqueteLectura.Lector;

public class Main_Hotel {
    public static void main (String args[]){
        int numHab;
        double monto = 0;
        System.out.println("Cargarndo Hotel...");
        System.out.print("Cuantas habitaciones tiene el Hotel?? : ");
        numHab = Lector.leerInt();
        Hotel h = new Hotel(numHab);
        System.out.println("El hotel se ha cargado EXITOSAMENTE con "+numHab+" habitaciones.");
        System.out.println("======= SISTEMA DE HOTELERIA =======");
        Cliente c = new Cliente();
        System.out.print("Nombre del cliente (ZZZ para terminar): ");
        c.setNombre(Lector.leerString());
        while (!c.getNombre().equals("ZZZ")){
            System.out.print("DNI del cliente: ");
            c.setDNI(Lector.leerInt());
            System.out.print("Edad del cliente: ");
            c.setEdad(Lector.leerInt());
            System.out.print("Hola "+c.getNombre()+"! En que habitacion desea alojarse??: ");
            numHab = Lector.leerInt();
            h.ingresarCliente(c, numHab);
            c = new Cliente();
            System.out.print("Nombre del cliente (ZZZ para terminar): ");
            c.setNombre(Lector.leerString());
        }
        System.out.println(h.toString());
        System.out.print("Cuanto $$$ quiere aumentar las tarifas? : ");
        monto = Lector.leerDouble();
        h.aumentarPrecio(monto);
        System.out.println(h.toString());
    }
}