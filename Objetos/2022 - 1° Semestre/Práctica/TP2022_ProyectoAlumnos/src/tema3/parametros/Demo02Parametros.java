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
public class Demo02Parametros {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Libro l1 = new Libro();
        l1.setTitulo("Java");
        l1.setPrecio(100);
        //...
        double porcAumento=0.20;
        l1.subirPrecio(porcAumento);
        System.out.println(porcAumento);
        //System.out.println(l1.getPrecio());
    }
    
}
