package tema3;

import PaqueteLectura.Lector;

public class Main_Balanza {
    public static void main(String[] args){
        float pesoKg, precioKg;
        Balanza bal = new Balanza();
        bal.iniciarCompra();
        System.out.print("Ingrese el peso (en Kg) del producto: ");
        pesoKg=(float)Lector.leerDouble();
        while (pesoKg!=0){
            System.out.print("Ingrese el precio (por Kg) del producto: ");
            precioKg=(float)Lector.leerDouble();
            bal.registrarProducto(pesoKg, precioKg);
            System.out.print("Ingrese el peso (en Kg) del producto: ");
            pesoKg=(float)Lector.leerDouble();
        }
        System.out.println(bal.devolverResumenDeCompra());
    }
}