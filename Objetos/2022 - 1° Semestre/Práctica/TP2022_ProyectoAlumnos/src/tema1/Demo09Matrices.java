
/**
 * Ejemplo de operaciones típicas con matrices: inicializar, recorrer completo, recorrer fila/columa
 */

package tema1;
import PaqueteLectura.GeneradorAleatorio;

public class Demo09Matrices {

public static void main(String[] args) {
    int DIMF=3; int DIMC=4;
    int[][] m = new int[DIMF][DIMC];
    int i, j;
    //GeneradorAleatorio.iniciar();
    /* Inicializamos la matriz */
    for (i=0;i<DIMF;i++)
        for(j=0;j<DIMC;j++)
            m[i][j] = GeneradorAleatorio.generarInt(10);
    
    /* Imprimimos la matriz de manera más clara **/
    System.out.println("Elementos de la matriz numeros: ");
    for (i = 0; i < DIMF; i++) {
      for (j = 0; j < DIMC; j++) {
        System.out.print(m[i][j] + " ");
      }
      System.out.println();
    }
    
    /* Imprimimos una columna completa **/
    int columna = 1;
    System.out.println();
    System.out.print("Elementos de la columna "+columna+": ");
    for(i=0;i<DIMF;i++)
           System.out.print(m[i][columna]+ " ");
    System.out.println();

    /* Sumamos los elementos de la fila 2 */
    int fila = 2, suma=0;
    for(j=0;j<DIMC;j++)
        suma = suma + m[fila][j]; 
    System.out.print("La suma de la fila "+ fila + " es: " + suma);
    
    System.out.println();
    
 }

}

