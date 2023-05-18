package tema5;

/**
 *
 * @author // Autor del ejercicio: github.com/Auchan22
 */

public class Ocasional extends Recital{
    private String motivo, nombreContratante, dia;
    
    public Ocasional(String nb, int cant, String m, String n, String d){
        super(nb, cant);
        this.motivo = m;
        this.nombreContratante = n;
        this.dia = d;
    }
    
    public String getMotivo(){
        return this.motivo;
    }
    
    public String getNombreCantante(){
        return this.nombreContratante;
    }
    
    public String getDia(){
        return this.dia;
    }
    
    public void actuar(){
        if(this.motivo.equals("A Beneficio")){
            System.out.println("Recuerden colaborar con..."+this.nombreContratante+"\n");
        }else if(this.motivo.equals("Show de TV")){
            System.out.println("Saludos amigos televidentes \n");
        }else if(this.motivo.equals("Show Privado")){
            System.out.println("Un feliz cumpleaños para..."+this.nombreContratante+"\n");
        }
        
        super.actuar();
    }
    
    public int calcularCosto(){
        int total = 0;
        
        if(this.motivo.equals("Show de TV")){
            total = 50000;
        }else if(this.motivo.equals("Show Privado")){
            total = 150000;
        }
        
        return total;
    }
}
