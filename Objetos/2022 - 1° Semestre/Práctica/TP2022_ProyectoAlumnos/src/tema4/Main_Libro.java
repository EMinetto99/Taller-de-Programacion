/*
Demo que crea objetos Libro invocando a los constructores definidos. Tema 4.
 */
package tema4;
/**
 * @author vsanz
 */
public class Main_Libro{
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Autor autor1=new Autor("Herbert Schildt");
        Libro libro1= new  Libro("Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,  
                               autor1, "978-0071809252", 21.72);
        Autor autor2=new Autor("Asociacion Maestros Argentinos");
        Libro libro2= new Libro("Practicas del Lenguaje", "",
                               autor2, "978-9501314694",19.95);
        Autor autor3=new Autor("John Horton");
        Libro libro3= new Libro("Learning Java by Building Android Games",  
                                "CreateSpace Independent Publishing",autor3,"978-1512108347",19.99);
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println(libro3.toString());
        System.out.println("Editorial de libro2: " +libro2.getEditorial());
        System.out.println("Año edición de libro2: " +libro2.getAñoEdicion());
        System.out.println("Nombre de este libro3: "+libro3.getTitulo());
    }
}