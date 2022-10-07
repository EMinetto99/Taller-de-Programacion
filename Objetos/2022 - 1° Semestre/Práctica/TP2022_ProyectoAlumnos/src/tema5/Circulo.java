package tema5;
/**
 * @author Emiliano M
 */
public class Circulo extends Figura{
    // Atributos de Circulo
    private double radio;

    // Constructor
    public Circulo (double radio, String unColorR, String unColorL){
        super(unColorR,unColorL);
        setRadio(radio);
    }

    // Metodos
    public void setRadio(double radio){
        this.radio=radio;
    }
    public double getRadio(){
        return radio;
    }

    public double calcularArea(){
        return Math.PI*Math.sqrt(getRadio());
    }
    public double calcularPerimetro(){
        return Math.PI*getRadio()*2;
    }

    @Override
    public String toString(){
        String aux="Círculo {Radio="+getRadio()+", "+super.toString()+"}";
        return aux;
    }
}
