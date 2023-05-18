package tema5;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author // Autor del ejercicio: github.com/Auchan22
 */

public class Main_Recital {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Ocasional EO = new Ocasional("Los fulanitos", 5, "Show de TV", "Juan Bolaño", "20 de Abril");
        
        Gira G = new Gira("Los cosmicos", 8, "Re locardos", 15);
        
        for (int i = 0; i < 5; i++){
            EO.agregarTema(GeneradorAleatorio.generarString(10));
        }
        
        for (int i = 0; i < 8; i++){
            G.agregarTema(GeneradorAleatorio.generarString(10));
        }
        
        for (int i = 0; i < 15; i++){
            Fecha F = new Fecha(GeneradorAleatorio.generarString(5), (GeneradorAleatorio.generarString(31)));
            
            G.agregarFecha(F);
        }
        
        System.out.println("Evento Ocasional costo: "+EO.calcularCosto());
        System.out.println("Gira costo: "+G.calcularCosto());
        
        EO.actuar();
        
        for (int i = 0; i < 15; i++){
            G.actuar();
        }        
    }
}