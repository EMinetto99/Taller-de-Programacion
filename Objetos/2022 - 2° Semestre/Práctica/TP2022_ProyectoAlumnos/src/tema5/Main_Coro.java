package tema5;

import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Main_Coro {
    public static void main(String[] args) {
        final int cantSemi = 7;
        final int cantInt = 5; final int cantHil = 3;

        Director dir1 = new Director("Ricardo",17233120,54,12);
        Semicircular semi = new Semicircular(dir1, cantSemi);

        Director dir2 = new Director("Alberto",23536623,47,8);
        Hilera hil = new Hilera(dir2,cantHil,cantInt);

        String nom;
        int dni, edad, tono, iter = 0;
        
        semi.setNombreCoro("Los semi-corales");
        for (int i = 0; i < cantSemi; i++){
            nom = GeneradorAleatorio.generarString(8);
            System.out.println("Nombre del corista: "+nom);
            dni = GeneradorAleatorio.generarInt(60000000);
            System.out.println("DNI: "+dni);
            edad = GeneradorAleatorio.generarInt(100);
            System.out.println("Edad: "+edad);
            tono = GeneradorAleatorio.generarInt(10);
            System.out.println("Tono: "+tono);
            
            Corista coris = new Corista(nom, dni, edad, tono);
            semi.agregarCorista(coris);
            System.out.println();
        }

        hil.setNombreCoro("Los matríz identidad");
        for (int i = 0; i < (cantHil); i++){
            for (int j = 0; j < cantInt; j++){
                nom = GeneradorAleatorio.generarString(8);
                System.out.println("Nombre del corista: "+nom);
                dni = GeneradorAleatorio.generarInt(60000000);
                System.out.println("DNI: "+dni);
                edad = GeneradorAleatorio.generarInt(100);
                 System.out.println("Edad: "+edad);
                tono = GeneradorAleatorio.generarInt(10);
                System.out.println("Tono: "+tono);

                Corista coris = new Corista(nom, dni, edad, tono);
                hil.agregarCorista(coris);
                System.out.println();
            }
        }
        
        System.out.println("======== SEMI ========");
        System.out.println(semi.toString());
        System.out.println("Esta bien formado: "+semi.estaOrdenado());
        System.out.println();
        System.out.println("======= HILERA =======");
        System.out.println(hil.toString());
        System.out.println("Esta bien formado: "+hil.estaOrdenado());
    }
}