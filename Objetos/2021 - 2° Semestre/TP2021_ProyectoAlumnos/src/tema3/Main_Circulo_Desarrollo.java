package tema3;

import PaqueteLectura.Lector;

public class Main_Circulo_Desarrollo {
    public static void main(String[] args){
        double radio;
        String color_l, color_r;
        Circulo_Desarrollo c;
        System.out.println("==== Círculo ====");
        System.out.print("Ingrese el radio del circulo: ");
        radio=Lector.leerDouble();
        System.out.print("Ingrese el color de relleno: ");
        color_r=Lector.leerString();
        System.out.print("Color de linea: ");
        color_l=Lector.leerString();
        c=new Circulo_Desarrollo(radio,color_r,color_l);
        System.out.println("\nÁrea del circulo: "+c.calcularArea());
        System.out.println("Perímetro del circulo: "+c.calcularPerimetro());
        System.out.println();
        Circulo_Desarrollo c0 = new Circulo_Desarrollo();
        System.out.println("==== Círculo Vacio ====");
        System.out.println("Área del circulo: "+c0.calcularArea());
        System.out.println("Perímetro del circulo: "+c0.calcularPerimetro());
    }
}