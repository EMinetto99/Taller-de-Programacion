package tema4;

public class MainVisorFiguras {
    public static void main(String[] args){
        // VisorFiguras visor = new VisorFiguras();
        VisorFigurasModificado visor_mod = new VisorFigurasModificado();
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r = new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2 = new Cuadrado(30,"Rojo","Naranja");
        visor_mod.guardar(c1);
        visor_mod.guardar(r);
        visor_mod.guardar(c2);
        for (int i = 0; i < visor_mod.getGuardadas(); i++){
            visor_mod.mostrar(i);
        }
        System.out.println(visor_mod.getMostradas());
    }
}