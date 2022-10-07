package tema5;
public class Main_Figura {
    public static void main(String[] args){
        Triangulo t=new Triangulo(2,3,4,"Verde","Amarillo");
        Circulo circ=new Circulo(5,"Azul","Negro");
        Cuadrado cuad=new Cuadrado(7,"Rojo","Naranja");
        System.out.println(t);
        System.out.println(circ);
        System.out.println(cuad);
    }
}