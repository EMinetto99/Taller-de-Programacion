package tema2;

import PaqueteLectura.Lector;

public class Prac1_1_POO {
    public static void main(String[] args){
        Persona p1 = new Persona();
        System.out.print("Ingrese su nombre: ");
        p1.setNombre(Lector.leerString());
        System.out.print("\nIngrese su DNI: ");
        p1.setDNI(Lector.leerInt());
        System.out.print("\nIngrese su edad: ");
        p1.setEdad(Lector.leerInt());
        System.out.println(p1.toString());
    }
}