package tema5;

import PaqueteLectura.Lector;

public class Main_Persona {
    public static void main(String[] args){
        String name,task;
        int dni,age;
        System.out.println("======== PERSONA ========");
        System.out.print("Nombre: ");
        name=Lector.leerString();
        System.out.print("DNI: ");
        dni=Lector.leerInt();
        System.out.print("Edad: ");
        age=Lector.leerInt();
        Persona p=new Persona(name,dni,age);
        System.out.println("\n======== TRABAJADOR ========");
        System.out.print("Nombre: ");
        name=Lector.leerString();
        System.out.print("DNI: ");
        dni=Lector.leerInt();
        System.out.print("Edad: ");
        age=Lector.leerInt();
        System.out.print("Tarea: ");
        task=Lector.leerString();
        Trabajador t=new Trabajador(name,dni,age,task);
        System.out.println();
        System.out.println(p);
        System.out.println(t);
    }
}