package tema2;

import PaqueteLectura.Lector;

public class Prac1_6_POO {
    public static void main(String[] args){
        final int part=20;      //Constante de la cantidad de partidos
        Partido vPartidos[] = new Partido[part];
        Partido match = new Partido();
        int i=0,dimL=0,ganoRiver=0,cantGolesBoca=0,cantEmpates=0;
        System.out.print("Ingrese el nombre del equipo VISITANTE: ");
        match.setVisitante(Lector.leerString());
        while ((i<part) && (!"ZZZ".equals(match.getVisitante()))){
            System.out.print("Ingrese el nombre del equipo LOCAL: ");
            match.setLocal(Lector.leerString());
            System.out.print("Cantidad de goles del equipo VISITANTE: ");
            match.setGolesVisitante(Lector.leerInt());
            System.out.print("Cantidad de goles del equipo LOCAL: ");
            match.setGolesLocal(Lector.leerInt());
            vPartidos[i]=match;
            i++;
            dimL++; 
            if (i<part){
                match = new Partido();
                System.out.println();
                System.out.print("Ingrese el nombre del equipo VISITANTE: ");
                match.setVisitante(Lector.leerString());
            }
        }
        for (int j=0;j<dimL;j++){
            if ("River".equals(vPartidos[j].getLocal())){
                if ("River".equals(vPartidos[j].getGanador())){
                    ganoRiver++;
                }
            }
            else if ("River".equals(vPartidos[j].getVisitante())){
                if ("River".equals(vPartidos[j].getGanador())){
                    ganoRiver++;
                }
            }
            if ("Boca".equals(vPartidos[j].getLocal())){
                cantGolesBoca+=vPartidos[j].getGolesLocal();
            }
            if (vPartidos[j].hayEmpate()==true){
                cantEmpates++;
            }
        }
        System.out.println();
        System.out.println("Cantidad de partidos que ganó River: "+ganoRiver);
        System.out.println("Cantidad total de goles que realizó Boca jugando de LOCAL: "+cantGolesBoca);
        System.out.println("Porcentaje de partidos finalizados en empate: "+(float)((cantEmpates*100)/dimL)+"%");
    }
}