package tema3;

import PaqueteLectura.Lector;

public class Main_Balanza_Completa {
    public static void main(String[] args){
        double pesoKg, precioKg;
        String desc;
        Balanza_Completa bal = new Balanza_Completa();
        Producto prod = new Producto();
        bal.iniciarCompra();
        System.out.print("Ingrese el peso (en Kg) del producto: ");
        pesoKg=Lector.leerDouble();
        while (pesoKg!=0){
            prod.setPesoEnKg(pesoKg);
            System.out.print("Ingrese el precio (por Kg) del producto: ");
            precioKg=(float)Lector.leerDouble();
            System.out.print("Descripción del producto: ");
            prod.setDescripcion(Lector.leerString());
            bal.registrarProducto(prod, precioKg);
            System.out.print("\nIngrese el peso (en Kg) del producto: ");
            pesoKg=Lector.leerDouble();
        }
        System.out.println();
        System.out.println(bal.devolverResumenDeCompra());
    }
}