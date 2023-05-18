package tema5;

/**
 *
 * @author // Autor del ejercicio: github.com/Auchan22
 */

public class Fecha {
    private String ciudad, dia;
    
    public Fecha(String c, String d){
        this.ciudad = c;
        this.dia = d;
    }
    
    public String getCiudad(){
        return this.ciudad;
    }
    
    public String getDia(){
        return this.dia;
    }
}