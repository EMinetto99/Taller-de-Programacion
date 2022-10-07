package tema3;

import PaqueteLectura.Lector;
import java.text.DecimalFormat;

public class Main_Entrenador {
    public static void main(String[] args){
        DecimalFormat formato = new DecimalFormat("#.00");
        Entrenador entre=new Entrenador();
        System.out.println("==== Registro de Entrenadores ====");
        System.out.print("Ingrese el nombre del entrenador: ");
        entre.setNombre(Lector.leerString());
        System.out.print("Ingrese el sueldo básico (en dólares): ");
        entre.setSueldoBasico(Lector.leerDouble());
        System.out.print("Ingrese la cantidad de partidos ganados por el entrenador: ");
        entre.setCantPartidosGanados(Lector.leerInt());
        System.out.println();
        System.out.println("Sueldo bruto a cobrar del entrenador "+entre.getNombre()+": $"+formato.format(entre.calcularSueldoACobrar())+" USD");
    }
}
