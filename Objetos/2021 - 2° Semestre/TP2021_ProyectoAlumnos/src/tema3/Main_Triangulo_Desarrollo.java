package tema3;

import PaqueteLectura.Lector;

public class Main_Triangulo_Desarrollo {
    public static void main(String[] args){
        double l1, l2, l3;
        String linea, color;
        Triangulo_Desarrollo t;
        System.out.println("=== Triangulo ===");
        System.out.print("Ingrese la medida del LADO 1: ");
        l1=Lector.leerDouble();
        System.out.print("Ingrese la medida del LADO 2: ");
        l2=Lector.leerDouble();
        System.out.print("Ingrese la medida del LADO 3: ");
        l3=Lector.leerDouble();
        System.out.print("Ingrese el color del relleno del triangulo: ");
        color=Lector.leerString();
        System.out.print("Ingrese el color de la linea del triangulo: ");
        linea=Lector.leerString();
        t = new Triangulo_Desarrollo(l1,l2,l3,color,linea);
        System.out.println();
        System.out.println("Perimetro: "+t.calcularPerimetro()+"cm");
        System.out.println("Area: "+t.calcularArea()+"cm^2");
        Triangulo_Desarrollo t2 = new Triangulo_Desarrollo();
        System.out.println();
        System.out.println("Perimetro: "+t2.calcularPerimetro()+"cm");
        System.out.println("Area: "+t2.calcularArea()+"cm^2");
    }
}