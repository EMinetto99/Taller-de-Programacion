package tema3;

public class Triangulo_Desarrollo {
    //Atributos
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;
    
    //Metodos
    //Matodos Constructor  
    public Triangulo_Desarrollo(double lado1, double lado2, double lado3, String colorRelleno, String colorLinea){
        this.lado1=lado1;
        this.lado2=lado2;
        this.lado3=lado3;
        this.colorRelleno=colorRelleno;
        this.colorLinea=colorLinea;
    }
    public Triangulo_Desarrollo(){
    }
    public void setLado1(double l1){
        lado1=l1;
    }
    public void setLado2(double l2){
        lado1=l2;
    }
    public void setLado3(double l3){
        lado1=l3;
    }
    public double getLado1(){
        return lado1;
    }
    public double getLado2(){
        return lado2;
    }
    public double getLado3(){
        return lado3;
    }
    public void setColorRelleno(String colourR){
        colorRelleno=colourR;
    }
    public String getColorRelleno(){
        return colorRelleno;
    }
    public void setColorLinea(String colourL){
        colorLinea=colourL;
    }
    public String getColorLinea(){
        return colorLinea;
    }
    public double calcularArea(){
        double s=(lado1+lado2+lado3)/2;
        double area=Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
        return area;
    }
    public double calcularPerimetro(){
        double perimetro=lado1+lado2+lado3;
        return perimetro;
    }
}