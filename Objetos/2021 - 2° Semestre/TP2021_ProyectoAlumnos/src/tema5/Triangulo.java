/*
Agregar la clase Triángulo a la jerarquía de figuras vista en clase (paquete tema5 del
proyecto).
Triángulo debe heredar de Figura todo lo que es común y definir
su constructor y sus atributos y métodos propios. Además debe
redefinir el método toString.
 */

package tema5;
public class Triangulo extends Figura{
    private double lado1;
    private double lado2;
    private double lado3;
    public Triangulo(double l1, double l2, double l3, String unCR, String unCL){
        super(unCR,unCL);
        lado1=l1;
        lado2=l2;
        lado3=l3;
    }

    public double getLado1() {
        return lado1;
    }
    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }
    public double getLado2() {
        return lado2;
    }
    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }
    public double getLado3() {
        return lado3;
    }
    public void setLado3(double lado3) {
        this.lado3 = lado3;
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
    
    @Override
    public String toString(){
        String aux="Lado 1: "+lado1+"| Lado 2: "+lado2+"| Lado3: "+lado3+"| Perimetro: "+this.calcularPerimetro()+" | "+super.toString();
        return aux;
    }
}