package tema2;

import PaqueteLectura.Lector;

public class Prac1_4_POO {
    public static void main(String[] args){
        int dias=5,turnos=8,d=0,t=0,dimLC=0,dimLF,switcher;
        Persona typeP = new Persona();
        Persona mPersona[][] = new Persona[dias][turnos];
        System.out.println("==== INSCRIPCIONES día "+(d+1)+" ====");
        System.out.println("|TURNO "+(t+1)+"|");
        System.out.print("Nombre: ");
        typeP.setNombre(Lector.leerString());
        while ((!"ZZZ".equals(typeP.getNombre())) && (d<dias)){
            while ((!"ZZZ".equals(typeP.getNombre())) && (t<turnos)){
                System.out.print("DNI: ");
                typeP.setDNI(Lector.leerInt());
                System.out.print("Edad: ");
                typeP.setEdad(Lector.leerInt());
                mPersona[d][t]=typeP;
                System.out.println();
                t++;
                if (t<turnos){
                    typeP = new Persona();
                    System.out.println("|TURNO "+(t+1)+"|");
                    System.out.print("Nombre: ");
                    typeP.setNombre(Lector.leerString());
                }
            }
            dimLC=t-1;
            t=0;
            d++;
            if ((!"ZZZ".equals(typeP.getNombre())) && (d<dias)){
                System.out.println("==== INSCRIPCIONES día "+(d+1)+" ====");
                System.out.println("|TURNO "+(t+1)+"|");
                System.out.print("Nombre: ");
                typeP.setNombre(Lector.leerString());
            }
        }
        dimLF=d-1;
        switcher=turnos;
        d=0;
        t=0;
        System.out.println();
        System.out.println("TENEMOS QUE IR HASTA. Fila: "+(dimLF+1)+" Columna: "+(dimLC+1));
        while (d<=dimLF){
            if (dimLF==d){
                switcher=dimLC+1;
            }
            System.out.println("==== MOSTRAR INSCRIPCIONES día "+(d+1)+" ====");
            while (t<switcher){
                System.out.println("|TURNO "+(t+1)+"|");
                System.out.println("Nombre: "+mPersona[d][t].getNombre());
                System.out.println("DNI: "+mPersona[d][t].getDNI());
                System.out.println("Edad: "+mPersona[d][t].getEdad());
                System.out.println();
                t++;
            }
            t=0;
            d++;
        }
    }
}