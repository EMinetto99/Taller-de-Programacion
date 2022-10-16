package tema3;
public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;

    // Metodos - Constructores
    public Circulo(){
    }
    public Circulo(double radio, String colorRelleno, String colorLinea){
        this.radio = radio;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }

    // Metodos - Getters
    public double getRadio() {
        return radio;
    }
    public String getColorRelleno() {
        return colorRelleno;
    }
    public String getColorLinea() {
        return colorLinea;
    }

    // Metodos - Setters
    public void setRadio(double radio) {
        this.radio = radio;
    }
    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }

    // Metodos
    public double calcularPerimetro(){
        double p = 2 * (Math.PI) * getRadio();
        return p;
    }
    public double calcularArea(){
        double a = (Math.PI) * Math.sqrt(getRadio());
        return a;
    }

@Override
    public String toString(){
        return "Circulo (Radio: "+getRadio()+", Color de Relleno: "+getColorRelleno()+", Color de linea: "+getColorLinea()+")";
    }
}