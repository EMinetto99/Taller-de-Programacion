package tema2;

import PaqueteLectura.Lector;

public class Prac1_5_POO {
    public static void main(String[] args){
        String vPalabras[] = new String[10];
        for (int i=0;i<10;i++){
            System.out.print("Ingrese una cadena de caracteres ("+(10-i)+" restantes): ");
            vPalabras[i]=Lector.leerString();
        }
        for (int i=0;i<10;i++){
            System.out.print(vPalabras[i].charAt(0));
        }
        System.out.println();
    }
}