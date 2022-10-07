package prac1.pkg3.intro;
import PaqueteLectura.Lector;
public class Prac13Intro {
    public static void main(String[] args) {
        final int jugadores=15;
        Float[] alturaBSKT = new Float[jugadores];
        int cantEncimaProm=0;
        float prom, sumaAlturas=0;
        for (int i=0;i<jugadores;i++){
            System.out.print("Ingrese una altura para el Jugador "+(i+1)+": ");
            alturaBSKT[i]=(float)Lector.leerDouble();
            sumaAlturas+=alturaBSKT[i];
            System.out.println();
        }
        prom=(float)sumaAlturas/jugadores;
        for (int i=0;i<jugadores;i++){
            if (alturaBSKT[i]>prom){
                cantEncimaProm++;
            }
        }
        System.out.println("Altura promedio de los jugadores de Basket: "+prom);
        System.out.println("Cantidad de jugadores por encima del promedio: "+cantEncimaProm);
    }
}