package tema3;

import PaqueteLectura.Lector;

public class Main_Estante {
    public static void main (String args[]){
        Estante e = new Estante(2);
        System.out.println("======= SISTEMA DE LIBROS =======");
        System.out.print("Ingrese el TITULO del 1ER bibro o 'ZZZ' para terminar ("+(e.cantEspacioEstante()-e.cantLibros())+" lugares disponibles): ");
        Libro l = new Libro();
        Autor a;
        l.setTitulo(Lector.leerString());
        while ((!e.estaLleno_Boolean()) && (!"ZZZ".equals(l.getTitulo()))){
            a = new Autor();
            System.out.print("El NOMBRE del AUTOR del libro: ");
            a.setNombre(Lector.leerString());
            System.out.print("La BIOGRAFÍA del AUTOR del libro: ");
            a.setBiografia(Lector.leerString());
            System.out.print("El ORIGEN del AUTOR del libro: ");
            a.setOrigen(Lector.leerString());
            l.setPrimerAutor(a);
            System.out.print("Ingrese la EDITORIAL del libro: ");
            l.setEditorial(Lector.leerString());
            System.out.print("Ingrese el AÑO de EDICION del libro: ");
            l.setAñoEdicion(Lector.leerInt());
            System.out.print("Ingrese el ISBN del libro: ");
            l.setISBN(Lector.leerString());
            System.out.print("Ingrese el PRECIO del libro: ");
            l.setPrecio(Lector.leerDouble());
            e.agregarLibro(l);
            System.out.println();
            if (!e.estaLleno_Boolean()){
            System.out.print("Ingrese el TITULO del libro Nro "+(e.cantLibros()+1)+" o 'ZZZ' para terminar ("+(e.cantEspacioEstante()-e.cantLibros())+" lugares disponibles): ");
            l = new Libro();
            l.setTitulo(Lector.leerString());
            }
        }
        System.out.println();
        System.out.println(e);
        System.out.println();
        System.out.print("Ingrese un TITULO de algun libro que desee buscar en el ESTANTE: ");
        if (e.devolverLibro(Lector.leerString()) == null){
            System.out.println("El libro NO se encontro en el estante :(");
        } else {
            System.out.println(" El bibro SE ENCONTRO en el ESTANTE !!!");
        }
        
    }
}