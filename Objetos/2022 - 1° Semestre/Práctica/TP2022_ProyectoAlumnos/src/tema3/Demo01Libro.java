/*
 Programa que instancia un objeto libro e inicializa sus v.i.s enviando mensajes set#
 */
package tema3;

/**
 *
 * @author vsanz
 */
public class Demo01Libro {

    public static void main(String[] args) {
        Libro miLibro= new Libro();
        miLibro.setTitulo("Java: A Beginner's Guide");
        miLibro.setEditorial("Mcgraw-Hill");
        miLibro.setAñoEdicion(2014);
        miLibro.setPrimerAutor("Herbert Schildt");
        miLibro.setISBN("978-0071809252");
        miLibro.setPrecio(21.72);
        System.out.println(miLibro.toString());
        System.out.println(miLibro.getPrecioFinal());
        //System.out.println(miLibro); /* invoca automaticamente al metodo toString */

    }
    
}
