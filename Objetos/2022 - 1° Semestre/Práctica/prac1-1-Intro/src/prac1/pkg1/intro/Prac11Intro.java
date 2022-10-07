package prac1.pkg1.intro;
import PaqueteLectura.Lector;
public class Prac11Intro {
    public static void main(String[] args) {
        int num, factorial=1;
        do{
        System.out.print("Ingrese un número a calcular su factorial (N!): ");
        num=Lector.leerInt();
        if (num>0){
            for (int i=num;i>0;i--){
                factorial*=i;
                }
            }
            else{
                System.out.println("\n¡Ingrese un factorial mayor a 0!");
                }
        } while (num<=0);
        System.out.println("El factorial "+num+"! es: "+factorial);
    }
}