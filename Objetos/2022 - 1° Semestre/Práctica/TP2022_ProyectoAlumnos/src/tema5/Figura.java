package tema5;

public abstract class Figura {
    private String colorRelleno;
    private String colorLinea;

    public Figura(String unCR, String unCL){
        setColorRelleno(unCR);
        setColorLinea(unCL);
    }

    public String toString(){
        String aux = "Area: "+this.calcularArea()+
                     ", Perímetro: "+this.calcularPerimetro()+
                     ", Color de Relleno: "  +getColorRelleno()+ 
                      ", Color de Línea: " +getColorLinea();             
             return aux;
       }

    public String getColorRelleno(){
        return colorRelleno;
    }
    public void setColorRelleno(String unColor){
        colorRelleno = unColor;
    }
    public String getColorLinea(){
        return colorLinea;
    }
    public void setColorLinea(String unColor){
        colorLinea = unColor;
    }
    public void despintar(){
        setColorRelleno("Blanco");
        setColorLinea("Negro");
    }

    public abstract double calcularArea();
    public abstract double calcularPerimetro();
}