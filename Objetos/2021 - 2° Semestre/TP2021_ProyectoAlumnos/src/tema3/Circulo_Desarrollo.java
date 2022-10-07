package tema3;
public class Circulo_Desarrollo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    public Circulo_Desarrollo(double rad, String relleno, String linea){
        radio=rad;
        colorRelleno=relleno;
        colorLinea=linea;
    }
    public Circulo_Desarrollo(){
        
    }
    public void setRadio(double radio){
        this.radio=radio;
    }
    public double getRadio(){
        return radio;
    }
    public void setColorRelleno(String color_rad){
        colorRelleno=color_rad;
    }
    public String getColorRelleno(){
        return colorRelleno;
    }
    public void setColorLinea(String color_line){
        colorLinea=color_line;
    }
    public String getColorLinea(){
        return colorLinea;
    }
    public double calcularArea(){
        double area=Math.PI*(Math.pow(radio,2));
        return area;
    }
    public double calcularPerimetro(){
        double perimetro=2*Math.PI*radio;
        return perimetro;
    }
}