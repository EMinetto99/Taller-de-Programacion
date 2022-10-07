package prac1.pkg4.intro;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Prac14Intro {
    public static void main(String[] args) {
        final int fila=10, columna=10, rango=200;
        int matrizInt[][] = new int[fila][columna];
        int vSumaColum[] = new int[columna];
        int num, posFila=-1, posColum=-1, sumaFilaColum=0;
        boolean encontre=false;
        for (int z=0;z<columna;z++){                                    //Inicializo vector en 0
            vSumaColum[z]=0;
        }
        for (int i=0;i<fila;i++){                                       //Cargo Matriz con números random dentro del rango
            for (int j=0;j<columna;j++){
                matrizInt[i][j]=GeneradorAleatorio.generarInt(rango+1);
            }
        }
        for (int i=0;i<fila;i++){                                       //Matriz
            for (int j=0;j<columna;j++){
                if ((i>=2 && i<=9) && (j>=0 && j<=3)){                  //Suma de Filas y Columnas establecidas
                    sumaFilaColum+=matrizInt[i][j];
                }
                vSumaColum[j]+=matrizInt[i][j];
                System.out.print(" ["+matrizInt[i][j]+"]");
            }
            System.out.println();
        }
        System.out.print("Ingrese un número a buscar en la matriz: ");
        num=Lector.leerInt();
        for (int i=0;i<fila;i++){
            for (int j=0;j<columna;j++){
                if ((num==matrizInt[i][j]) && (encontre==false)){       //Si encontre el número pedido/Sólo una vez
                    encontre=true;
                    posFila=i+1;
                    posColum=j+1;
                }
            }
        }
        if (true==encontre){                                            //Informo SI ENCONTRÉ
            System.out.println("El número "+num+" SE ENCONTRÓ en Fila["+posFila+"] Columna["+posColum+"]");
        }
            else{
                System.out.println("El número "+num+" NO SE ENCONTRÓ EN LA MATRIZ :("); //Sino NO ENCONTRÉ
            }
        System.out.println("Suma total entre las Filas 2-9 (3 a 10 en Matríz) y Columnas de 0-3 (1-4) = "+sumaFilaColum);
        System.out.print("vector_SumaColumnas: ");
        for (int z=0;z<columna;z++){
            System.out.print("["+vSumaColum[z]+"]");
        }
        System.out.println();
    }
}