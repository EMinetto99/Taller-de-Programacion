/*
Clase Libro vista en el tema 3. Sobre parámetros.

 */
package tema3.parametros;

/**
 *
 * @author vsanz
 */
public class Libro {
   private String titulo;
   private String primerAutor; 
   private String editorial;
   private int añoEdicion;
   private String ISBN; 
   private double precio; 
     
    public String getTitulo(){
        return titulo;
    }
  
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }

    public String getPrimerAutor(){
        return primerAutor;
    } 
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }
   
   /* 
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
 */
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
  
    public void setPrimerAutor(String unPrimerAutor){
         primerAutor=unPrimerAutor;
    } 
    public void setISBN(String unISBN){
         ISBN=unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio=unPrecio;
    }
    
    public double getPrecioFinal(){
        return precio + (precio*0.21);
    }

    
   @Override
    public String toString(){
        String aux; // Variable auxiliar utilizada por el metodo. No es parte del estado
        aux=titulo + " por " + primerAutor + " - " + añoEdicion + " - ISBN: " + ISBN;
       return ( aux);
    }
    
    public void subirPrecio(double porc){  /* Aumenta el precio en un porcentaje recibido */
       porc = precio * porc;
       precio = precio + porc;
    }
    
    public void setTitulo(String unTitulo){ /* Establece el título al recibido pero en MAYUSCULAS */
       unTitulo=unTitulo.toUpperCase();
      // System.out.println("unTitulo dentro del método " + unTitulo);
       titulo = unTitulo;
    }

    public void copiateEn(Libro otro){ /*El libro receptor del mensaje copia todos sus datos en el libro otro (parámetro)*/
       otro.setTitulo(titulo);
      // ...
       otro.setPrecio(precio);
     }

        
}
