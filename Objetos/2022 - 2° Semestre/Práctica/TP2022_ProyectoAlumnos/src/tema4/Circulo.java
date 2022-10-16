package tema4;
public class Circulo extends Figura{
    private double radio;

    // Metodos - Constructores
    public Circulo(double radio, String colorRelleno, String colorLinea){
        super(colorRelleno, colorLinea);
        this.radio = radio;
    }

    // Metodos - Getters
    public double getRadio() {
        return radio;
    }

    // Metodos - Setters
    public void setRadio(double radio) {
        this.radio = radio;
    }

    // Metodos
    @Override
    public Double calcularPerimetro(){
        double p = 2 * (Math.PI) * getRadio();
        return p;
    }
    @Override
    public Double calcularArea(){
        double a = (Math.PI) * Math.sqrt(getRadio());
        return a;
    }

@Override
    public String toString(){
        return "Circulo (Radio: "+getRadio()+", Color de Relleno: "+super.getColorRelleno()+", Color de linea: "+super.getColorLinea()+", Perimetro: "+this.calcularPerimetro()+")";
    }
}