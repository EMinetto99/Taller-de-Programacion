package tema5;
public class MainVisorFiguras {
    public static void main(String[] args) {
        VisorFigurasModificado visor = new VisorFigurasModificado();
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");
        visor.guardar(c1);
        visor.guardar(r);
        visor.guardar(c2);
        System.out.println();
        visor.mostrar();
        System.out.println(visor.getGuardadas());
    }
}