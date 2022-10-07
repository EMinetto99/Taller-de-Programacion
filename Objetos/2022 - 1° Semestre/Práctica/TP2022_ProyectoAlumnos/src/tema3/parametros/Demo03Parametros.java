/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3.parametros;

/**
 *
 * @author Victoria
 */
public class Demo03Parametros {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Libro l1 = new Libro();
        String titulo= "java";
        l1.setTitulo(titulo);
        System.out.println("titulo en main " + titulo);
     }
    
}
