package tema3;

import PaqueteLectura.Lector;

public class Main_Circulo {
    public static void main(String[] args){
        Circulo circle=new Circulo();
        System.out.print("Ingrese el radio del circulo: ");
        circle.setRadio(Lector.leerDouble());
        System.out.print("Color de relleno del circulo: ");
        circle.setColorRelleno(Lector.leerString());
        System.out.print("Color de linea: ");
        circle.setColorLinea(Lector.leerString());
        System.out.println("\nÁrea del circulo: "+circle.calcularArea());
        System.out.println("Perímetro del circulo: "+circle.calcularPerimetro());
    }
}