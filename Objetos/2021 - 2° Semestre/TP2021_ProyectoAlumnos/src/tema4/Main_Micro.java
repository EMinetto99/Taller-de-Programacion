package tema4;

import PaqueteLectura.Lector;

public class Main_Micro {
    public static void main(String[] arg){
        int i=0, asiento;
        boolean corte;
        Micro micro1=new Micro("ABC123","Mar del Plata","5:00");
        System.out.println("\033[33m==== Sistema de pasajes de Micros ====");
        System.out.print("\033[33mPasajero N°"+(i+1)+"\nIngrese un asiento a ocupar (1 al 20) o '-1' para terminar: ");
        asiento=Lector.leerInt();
        while ((asiento!=-1) && (i<20)){
            do{
                corte=micro1.procesarAsiento(asiento);
                if (corte){
                    System.out.println("\033[32m¡¡Operacion realizada con éxito!!");
                    System.out.println("====================================================================================");
                }
                else{
                    System.out.println("\033[31mOperacion fallida.");
                    System.out.println("====================================================================================");
                    System.out.println();
                    System.out.println();
                    System.out.println();
                    System.out.println();
                    System.out.print("\033[33mPasajero N°"+(i+1)+"\nIngrese un asiento a ocupar (1 al 20): ");
                    asiento=Lector.leerInt();
                }
            } while (corte==false);
            i++;
            if (i<20){
                System.out.println();
                System.out.println();
                System.out.println();
                System.out.println();
                System.out.print("\033[33mPasajero N°"+(i+1)+"\nIngrese un asiento a ocupar (1 al 20) o '-1' para terminar: ");
                asiento=Lector.leerInt();
            }
        }
        System.out.println();
        System.out.println("\033[36m==== Sistema finalizado ====");
        System.out.println("Cantidad de asientos ocupados: "+micro1.getCantOcupados());
    }
}