package tema4;

import PaqueteLectura.Lector;

public class Main_Empleados {
    public static void main (String args[]){
        Entrenador trainer = new Entrenador();
        Jugador fplayer = new Jugador();
        
        System.out.print("Ingrese el NOMBRE del ENTRENADOR: ");
        trainer.setNombre(Lector.leerString());
        System.out.print("Ingrese el SUELDO del ENTRENADOR: ");
        trainer.setSueldo(Lector.leerDouble());
        System.out.print("Ingrese el tiempo de ANTIGUEDAD del ENTRENADOR: ");
        trainer.setAntiguedad(Lector.leerInt());
        System.out.print("Ingrese la cantidad de CAMPEONATOS GANADOS: ");
        trainer.setCampeonatosGanados(Lector.leerInt());
        System.out.println();
        
        System.out.print("Ingrese el NOMBRE del JUGADOR: ");
        fplayer.setNombre(Lector.leerString());
        System.out.print("Ingrese el SUELDO del JUGADOR: ");
        fplayer.setSueldo(Lector.leerDouble());
        System.out.print("Ingrese el tiempo de ANTIGUEDAD del JUGADOR: ");
        fplayer.setAntiguedad(Lector.leerInt());
        System.out.print("Ingrese la cantidad de PARTIDOS GANADOS: ");
        fplayer.setPartidosGanados(Lector.leerInt());
        System.out.print("Ingrese la cantidad de GOLES ANOTADOS: ");
        fplayer.setGolesAnotados(Lector.leerInt());
        System.out.println();
        
        System.out.println(trainer.toString());
        System.out.println(fplayer.toString());
    }
}