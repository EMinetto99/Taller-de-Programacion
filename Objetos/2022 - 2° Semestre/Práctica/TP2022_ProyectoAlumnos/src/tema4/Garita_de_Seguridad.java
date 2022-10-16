package tema4;

import PaqueteLectura.Lector;

public class Garita_de_Seguridad {
    public static void main (String args[]){
        Persona person = new Persona();
        Trabajador worker = new Trabajador();
        
        System.out.print("Ingrese el NOMBRE de la PERSONA: ");
        person.setNombre(Lector.leerString());
        System.out.print("Ingrese el DNI de la PERSONA: ");
        person.setDNI(Lector.leerInt());
        System.out.print("Ingrese la EDAD: ");
        person.setEdad(Lector.leerInt());
        System.out.println();
        
        System.out.print("Ingrese el NOMBRE del TRABAJADOR: ");
        worker.setNombre(Lector.leerString());
        System.out.print("Ingrese el DNI del TRABAJADOR: ");
        worker.setDNI(Lector.leerInt());
        System.out.print("Ingrese la EDAD: ");
        worker.setEdad(Lector.leerInt());
        System.out.print("Ingrese la TAREA que realiza: ");
        worker.setTarea(Lector.leerString());
        System.out.println();
        
        System.out.println(person.toString());
        System.out.println(worker.toString());
    }
}