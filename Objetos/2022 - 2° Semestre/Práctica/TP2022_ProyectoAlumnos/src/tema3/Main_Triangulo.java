package tema3;

import PaqueteLectura.Lector;

public class Main_Triangulo {
    public static void main(String args[]){
        Double l1, l2, l3;
        String colorL, colorR;
        System.out.println("==== Creacion de un triangulo... ====");
        System.out.print("Ingrese el primer lado: ");
        l1 = Lector.leerDouble();
        System.out.print("Ingrese el segundo lado: ");
        l2 = Lector.leerDouble();
        System.out.print("Ingrese el tercer lado: ");
        l3 = Lector.leerDouble();
        System.out.print("Ingrese un color de Linea para el triangulo: ");
        colorL = Lector.leerString();
        System.out.print("Ingrese un color de Relleno: ");
        colorR = Lector.leerString();
        Triangulo t = new Triangulo(l1, l2, l3, colorL, colorR);
        System.out.println(t);
        System.out.println("Perimetro: "+t.calcularPerimetro());
        System.out.println("Area: "+t.calcularArea());
    }
}