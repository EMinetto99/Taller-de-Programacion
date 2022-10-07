package tema3;
public class Triangulo {
    // Atributos
    private Double lado_1;
    private Double lado_2;
    private Double lado_3;
    private String color_Linea;
    private String color_Relleno;
    
    // Metodos
    
    public Triangulo(Double lado1, Double lado2, Double lado3, String colorLinea, String colorRelleno){
        lado_1 = lado1;
        lado_2 = lado2;
        lado_3 = lado3;
        color_Linea = colorLinea;
        color_Relleno = colorRelleno;
    }
    
    public Double getLado1(){
        return lado_1;
    }
    public Double getLado2(){
        return lado_2;
    }
    public Double getLado3(){
        return lado_3;
    }
    public String getColor_Linea(){
        return color_Linea;
    }public String getColor_Relleno(){
        return color_Relleno;
    }
    
    public void setLado1(Double lado1){
        lado_1 = lado1;
    }
    public void setLado2(Double lado2){
        lado_2 = lado2;
    }
    public void setLado3(Double lado3){
        lado_3 = lado3;
    }
    public void setColor_Linea(String colorLinea){
        color_Linea = colorLinea;
    }
    public void setColor_Relleno(String colorRelleno){
        color_Relleno = colorRelleno;
    }

    public Double calcularPerimetro(){
        Double perimetro = getLado1() + getLado2() + getLado3();
        return perimetro;
    }
    public Double calcularArea(){
        Double s = (getLado1() + getLado2() + getLado3())/2;
        Double area = Math.sqrt(s*(s-getLado1())*(s-getLado2())*(s-getLado3()));
        return area;
    }

@Override
public String toString(){
    return "Este triangulo esta conformado por: {Lado 1 = "+getLado1()+"} {Lado 2 = "+getLado2()+"} {Lado 3 = "+getLado3()+"} {Color de Linea = "+getColor_Linea()+"} {Color de Relleno = "+getColor_Relleno()+"}";
}
}