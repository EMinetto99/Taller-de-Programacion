package tema4;
public class Main_Figuras {
    public static void main(String args[]){
        Triangulo triangle = new Triangulo(4.0,2.0,4.0,"Verde","Negro");
        Circulo circle = new Circulo(5.0,"Rojo","Naranja");
        
        System.out.println(triangle.toString());
        System.out.println(circle.toString());
        
        triangle.despintar();
        System.out.println("Despintando figura...");
        System.out.println(triangle.toString());
    }
}