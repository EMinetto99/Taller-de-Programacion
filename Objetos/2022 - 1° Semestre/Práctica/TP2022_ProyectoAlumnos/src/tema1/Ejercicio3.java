package tema1;
import PaqueteLectura.GeneradorAleatorio;
import java.util.Scanner;
public class Ejercicio3 {
    public static void main (String[]args){
        final String GREEN = "\u001B[32m";
        final String YELLOW = "\u001B[33m";
        final String BLUE = "\u001B[34m";
        final String PURPLE = "\u001B[35m";
        final String CYAN = "\u001B[36m";
        final String WHITE = "\u001B[37m";
        
        // Codigos para la Consola
        
        int i, j, num, enc_Fila=-1, enc_Colum=-1;
        GeneradorAleatorio.iniciar();
        Scanner Entrada=new Scanner(System.in);
        final int range=200;
        final int filas=10;
        final int columnas=10;
        int vecSuma[]=new int[columnas];
        int matriz[][]= new int[filas][columnas];
        int suma=0;
        boolean encontre=false;
        for (i=0;i<filas;i++){
            for (j=0;j<columnas;j++){
                matriz[i][j]=GeneradorAleatorio.generarInt(range);
                if ((i<9 && i>2) && (j<3 && j>0)){
                    System.out.print(CYAN+" ["+matriz[i][j]+"]");
                }
                else{
                    System.out.print(WHITE+" ["+matriz[i][j]+"]");
                }
            }
            System.out.println();
        }
        System.out.print("Ingrese un número a buscar en la Matriz: ");
        num=Entrada.nextInt();
        for (i=0;i<filas;i++){
            for (j=0;j<columnas;j++){
                if ((i<9 && i>2) && (j<3 && j>0)){
                        suma+=matriz[i][j];
                }
                if ((!encontre) && (num==matriz[i][j])){
                    encontre=true;
                    enc_Fila=i+1;
                    enc_Colum=j+1;
                }
                vecSuma[j]+=matriz[i][j];
            }
        }
        if (encontre){
            System.out.println("¡SE ENCONTRO el elemento! En la posición | Fila: "+enc_Fila+", Columna: "+enc_Colum);
        }
        else{
            System.out.println("No se encontró el elemento.");
        }
        System.out.println("Suma total de cada columna: ");
        for (i=0;i<columnas;i++){
            System.out.print(" "+(i+1)+".["+vecSuma[i]+"]");
        }
        System.out.println();
        System.out.println("Suma de los elementos entre las filas 3-10 y columnas 1-4: "+suma);
    }
}