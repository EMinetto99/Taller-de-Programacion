package tema3;

import PaqueteLectura.Lector;

public class Main_Circulo {
    public static void main (String args[]){
        Circulo c = new Circulo();
        System.out.println("Carcgando circulo...");
        System.out.print("Ingrese el RADIO del circulo: ");
        c.setRadio(Lector.leerDouble());
        System.out.print("Ingrese el Color de RELLENO del circulo: ");
        c.setColorRelleno(Lector.leerString());
        System.out.print("Ingrese el Color de LINEA del circulo: ");
        c.setColorLinea(Lector.leerString());
        System.out.println();
        System.out.println(c.toString());
        System.out.println("Perimetro: "+c.calcularPerimetro());
        System.out.println("Area: "+c.calcularArea());
    }
}