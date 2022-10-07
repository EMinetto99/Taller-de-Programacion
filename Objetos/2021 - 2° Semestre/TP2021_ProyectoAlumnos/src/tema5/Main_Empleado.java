package tema5;

import PaqueteLectura.Lector;

public class Main_Empleado {
    public static void main(String[] args){
        String nom;
        float sueldo;
        int goles, partidos;
        System.out.println("======== JUGADOR ========");
        System.out.print("Nombre: ");
        nom=Lector.leerString();
        System.out.print("Sueldo: ");
        sueldo=(float)Lector.leerDouble();
        System.out.print("Partidos jugados: ");
        partidos=Lector.leerInt();
        System.out.print("Goles realizados: ");
        goles=Lector.leerInt();
        Jugador j=new Jugador(nom,sueldo,partidos,goles);
        System.out.println("\n======== ENTRENADOR ========");
        System.out.print("Nombre: ");
        nom=Lector.leerString();
        System.out.print("Sueldo: ");
        sueldo=(float)Lector.leerDouble();
        System.out.print("Cantidad de partidos ganados: ");
        partidos=Lector.leerInt();
        Entrenador e=new Entrenador(nom,sueldo,partidos);
        System.out.println();
        System.out.println(j);
        System.out.println(e);
    }
}