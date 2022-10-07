package tema2;

import PaqueteLectura.Lector;

public class Prac1_2_POO {
    public static void main(String[] args){
        Persona vPersona[] = new Persona[5];
        int cantMayor=0,menorDNI=99999999,menorID=0;
        for (int i=0;i<5;i++){
            Persona typeP = new Persona();
            System.out.print("\nIngrese su nombre: ");
            typeP.setNombre(Lector.leerString());
            System.out.print("Ingrese su DNI: ");
            typeP.setDNI(Lector.leerInt());
            System.out.print("Ingrese su edad: ");
            typeP.setEdad(Lector.leerInt());
            if (typeP.getEdad()>65){
                cantMayor++;
            }    
            if (typeP.getDNI()<menorDNI){
                menorDNI=typeP.getDNI();
                menorID=i;
            }
            vPersona[i]=typeP;
        }
        System.out.println("\nCantidad de personas mayores de 65 años: "+cantMayor);
        System.out.println("ID menor de la persona: "+menorID);
        System.out.println("==== Persona con menor DNI ===="+
        "\n DNI: "+vPersona[menorID].getDNI()+
        "\n Nombre: "+vPersona[menorID].getNombre()+
        "\n EDAD: "+vPersona[menorID].getEdad());
    }
}