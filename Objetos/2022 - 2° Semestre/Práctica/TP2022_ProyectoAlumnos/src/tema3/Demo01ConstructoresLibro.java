package tema3;

public class Demo01ConstructoresLibro {
    public static void main(String[] args) {
        Libro libro1 = new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                  new Autor("Herbert Schildt"), "978-0071809252", 21.72);
        Libro libro2 = new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", 
                               new Autor("John Horton"), "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del LIBRO 2: " +libro2.getPrecio());
        System.out.println("Año edicion del LIBRO 2: " +libro2.getAñoEdicion());
        Libro libro3 = new Libro();
    }
}