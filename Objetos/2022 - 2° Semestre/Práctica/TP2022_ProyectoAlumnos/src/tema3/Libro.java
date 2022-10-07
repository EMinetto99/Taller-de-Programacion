package tema3;

public class Libro {
   private String titulo;
   private Autor primerAutor;
   private String editorial;
   private int añoEdicion;
   private String ISBN;
   private double precio;     
    
    public Libro(String unTitulo, String unaEditorial, 
    int unAñoEdicion, Autor autor, String unISBN, double unPrecio){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= unAñoEdicion;
         primerAutor = autor;
         ISBN =  unISBN;
         precio = unPrecio;
    }

    public Libro(String unTitulo, String unaEditorial, Autor autor, String unISBN){
         titulo = unTitulo;
         editorial = unaEditorial; 
         añoEdicion= 2015;
         primerAutor = autor;
         ISBN =  unISBN;
         precio = 100;
    }

    public Libro(){
    }

    public String getTitulo(){
        return titulo;
    }
    public String getEditorial(){
        return editorial;
    }
    public int getAñoEdicion(){
        return añoEdicion;
    }
    public Autor getPrimerAutor(){
        return primerAutor;
    } 
    public String getISBN(){
        return ISBN;
    } 
    public double getPrecio(){
        return precio;
    }

    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }   
    public void setEditorial(String unaEditorial){
         editorial = unaEditorial;
    }
    public void setAñoEdicion(int unAño){
         añoEdicion = unAño;
    }
    public void setPrimerAutor(Autor autor){
         primerAutor = autor;
    } 
    public void setISBN(String unISBN){
         ISBN = unISBN;
    } 
    public void setPrecio(double unPrecio){
         precio = unPrecio;
    }

   @Override
    public String toString(){
        String aux;
        aux = titulo + " por " + primerAutor + " - " + añoEdicion + " - " + " ISBN: " + ISBN;
       return (aux);
    }
}