package tema4;
public class Triangulo extends Figura{
    // Atributos
    private Double lado_1;
    private Double lado_2;
    private Double lado_3;
    
    // Metodos
    
    public Triangulo(Double lado1, Double lado2, Double lado3, String colorLinea, String colorRelleno){
        super(colorLinea,colorRelleno);
        lado_1 = lado1;
        lado_2 = lado2;
        lado_3 = lado3;
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
    
    public void setLado1(Double lado1){
        lado_1 = lado1;
    }
    public void setLado2(Double lado2){
        lado_2 = lado2;
    }
    public void setLado3(Double lado3){
        lado_3 = lado3;
    }


    @Override
    public Double calcularPerimetro(){
        Double perimetro = getLado1() + getLado2() + getLado3();
        return perimetro;
    }

    @Override
    public Double calcularArea(){
        Double s = (getLado1() + getLado2() + getLado3())/2;
        Double area = Math.sqrt(s*(s-getLado1())*(s-getLado2())*(s-getLado3()));
        return area;
    }

@Override
    public String toString(){
        return "Triangulo {Lado 1 = "+getLado1()+"} {Lado 2 = "+getLado2()+"} {Lado 3 = "+getLado3()+"} {Color de Linea = "+super.getColorLinea()+"} {Color de Relleno = "+super.getColorRelleno()+" {Perimetro: "+this.calcularPerimetro()+"}";
    }
}