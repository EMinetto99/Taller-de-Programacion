package tema5;
public class Circulo extends Figura{
    private double radio;
    public Circulo(double rad, String unCR, String unCL){
        super(unCR,unCL);
        radio=rad;
    }

    public double getRadio() {
        return radio;
    }
    public void setLado1(double rad) {
        radio = rad;
    }
    public double calcularArea(){
        double area=Math.PI*(Math.pow(radio,2));
        return area;
    }
    public double calcularPerimetro(){
        double perimetro=2*Math.PI*radio;
        return perimetro;
    }
    
    @Override
    public String toString(){
        String aux="Radio: "+radio+"| Perimetro: "+this.calcularPerimetro()+" | "+super.toString();
        return aux;
    }
}