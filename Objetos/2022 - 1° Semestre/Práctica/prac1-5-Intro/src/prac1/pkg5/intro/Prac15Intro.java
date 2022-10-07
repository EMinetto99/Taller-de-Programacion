package prac1.pkg5.intro;
import PaqueteLectura.Lector;
public class Prac15Intro {
    public static void main(String[] args) {
        final int cantP=8, cantOf=4;
        int piso, oficina;
        int mtxOfi[][] = new int[cantP][cantOf];
        do{
            System.out.print("Ingrese piso: ");
            piso=Lector.leerInt();
            if (piso>cantP+1 || piso<0){
                System.out.println("EL Piso seleccionado no existe. ¡Intente de nuevo!");
            }
        } while(piso>cantP+1 || piso<0);
        while (piso!=cantP+1){
            do{
                System.out.print("Ingrese oficina: ");
                oficina=Lector.leerInt();
                if (oficina>cantOf || oficina<0){
                    System.out.println("La OFICINA seleccionada no existe. ¡Intente de nuevo!");
                }
            } while(oficina>cantOf || oficina<0);
            mtxOfi[piso-1][oficina-1]++;
            do{
            System.out.print("Ingrese piso: ");
            piso=Lector.leerInt();
            if (piso>cantP+1 || piso<0){
                System.out.println("EL Piso seleccionado no existe. ¡Intente de nuevo!");
            }
            } while(piso>cantP+1 || piso<0);
        }
        for (int i=0;i<cantP;i++){
            for (int j=0;j<cantOf;j++){
                System.out.print(" ["+mtxOfi[i][j]+"] ");
            }
            System.out.println();
        }
    }
}