package TurnoB_Tema1;
public class Main_Torneo {
    public static void main(String[] args) {
        Torneo t = new Torneo("Copa Bicentenario",6,6);
        Goleador g1 = new Goleador("Romulo","Gimnasia",4);
        Goleador g2 = new Goleador("Francisco","Boca",7);
        Goleador g3 = new Goleador("Rodrigo","Chacabuco",3);
        Goleador g4 = new Goleador("Luis","Huracán",1);
        Goleador g5 = new Goleador("Richard","Peniarol",3);

        t.agregarGoleador(2, g1);
        t.agregarGoleador(6, g3);
        t.agregarGoleador(3, g2);
        t.agregarGoleador(5, g4);
        t.agregarGoleador(3, g5);
        
        System.out.println(t.toString());
        System.out.println("Menor goleador: "+t.menorGoleador(3));
    }
}