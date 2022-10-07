package tema5;
/**
 * @author Emiliano M
 */
public class Triangulo extends Figura{
    // Atributos de Triangulo
    private double lado1;
    private double lado2;
    private double lado3;
    
    // Constructor
    public Triangulo (double lado1, double lado2, double lado3, String unColorR, String unColorL){
        super(unColorR,unColorL);
        setLado1(lado1);
        setLado2(lado2);
        setLado3(lado3);
    }
    
    // Metodos
    public void setLado1(double lado1){
        this.lado1=lado1;
    }
    public void setLado2(double lado2){
        this.lado2=lado2;
    }
    public void setLado3(double lado3){
        this.lado3=lado3;
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
    public double calcularArea(){
        //to Implement
        return 0;
    }
    public double calcularPerimetro(){
        return getLado1()+getLado2()+getLado3();
    }
    
    @Override
    public String toString(){
        String aux="Triangulo {Lado N°1="+getLado1()+", Lado N°2="+getLado3()+", Lado N°3="+getLado3()+", "+super.toString()+"}";
        return aux;
    }
}