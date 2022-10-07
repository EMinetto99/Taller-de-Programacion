package tema3;

import PaqueteLectura.Lector;

public class Main_Estante {
    public static void main (String args[]){
        Estante e = new Estante();
        int i = 0;
        System.out.println("======= SISTEMA DE LIBROS =======");
        System.out.print("Ingrese el nombre del 1ER bibro ("+(20-e.cantLibros())+" lugares disponibles): ");
        Lector.leerString();
    }
}