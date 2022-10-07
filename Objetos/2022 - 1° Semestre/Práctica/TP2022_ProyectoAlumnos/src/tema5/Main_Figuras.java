package tema5;

public class Main_Figuras {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Cuadrado cuad = new Cuadrado(10,"Rojo", "Negro");
        System.out.println("Color linea: " + cuad.getColorLinea()); 
        System.out.println("Area: " + cuad.calcularArea()); 
        System.out.println("Representacion del cuadrado: " + cuad.toString());
        Triangulo tri = new Triangulo(3,4,5,"Negro","Amarillo");
        System.out.println(tri);
        Circulo cir = new Circulo(6,"Verde","Violeta");
        System.out.println(cir);
        cir.despintar();
        System.out.println(cir);
    }
}