package tema1;

import java.util.Scanner;   // Importar la clase Scanner

public class Ej02Jugadores {
    public static void main(String[] args) {
        Scanner Entrada=new Scanner(System.in);
        final int cantJ=15;
        float vec_Jugadores[]=new float[cantJ]; // Vector de alturas de 15 jugadores (float)
        float suma_Alturas=0, prom_Altura=0;
        int i, cant_Prom=0;
        for (i=0;i<cantJ;i++){
            System.out.print("Altura del Jugador n°"+(i+1)+": "); // Pido alturas de los jugadores
            vec_Jugadores[i]=Entrada.nextFloat();
            suma_Alturas+=vec_Jugadores[i];
        }
        prom_Altura=suma_Alturas/cantJ; // Promedio
        for (i=0;i<cantJ;i++){
            if (vec_Jugadores[i]>prom_Altura){  // Comparo nuevamente para saber cuántos son superiores al promedio
                cant_Prom++;
            }
        }
        System.out.println("\nAltura promedio: "+prom_Altura);
        System.out.println("Cantidad de jugadores con altura por encima del promedio: "+cant_Prom);
    }
}