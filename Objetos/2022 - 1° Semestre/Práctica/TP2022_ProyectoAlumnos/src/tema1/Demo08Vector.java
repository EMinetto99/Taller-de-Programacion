package tema1;
import PaqueteLectura.GeneradorAleatorio;
import java.util.Scanner;
/**
 * @author Emiliano M.
 */
public class Demo08Vector {
    public static void main(String[] args) {
        final String GREEN = "\u001B[32m";
        final String YELLOW = "\u001B[33m";
        final String BLUE = "\u001B[34m";
        final String PURPLE = "\u001B[35m";
        final String CYAN = "\u001B[36m";
        final String WHITE = "\u001B[37m";
        
        // Codigos para la Consola
        
        GeneradorAleatorio.iniciar();
        Scanner Entrada= new Scanner(System.in);
        int DF=10;
        int i, num=0;
        int tabla2 []= new int[DF]; // indices de 0 a 10
        for (i=0;i<DF;i++){
            tabla2[i]=GeneradorAleatorio.generarInt(DF);
            System.out.print("["+tabla2[i]+"]");
        }
        System.out.println();
        do{
            System.out.print(WHITE+"Ingrese una posición del vector a observar: ");
            num=Entrada.nextInt();
            num--;
            if (num>=DF || num<=0){
                System.out.println(YELLOW+"¡¡¡Incorrecto ingrese un rango válido!!! (1-"+DF+")");
            }
        } while (num>=DF || num<=0);
        System.out.println("2 x ["+tabla2[num]+"] = "+(tabla2[num]*2));
    }
}