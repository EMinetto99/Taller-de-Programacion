package TurnoB_Tema2;
public class Main_Class {
    public static void main(String[] args) {
        Barrio b = new Barrio("Los Teros",6,9);
        Comprador c1 = new Comprador("Pedro",353,"Lopez","La Plata");
        Comprador c2 = new Comprador("Juan",456,"Perez","Gonnet");
        Comprador c3 = new Comprador("Lucas",787,"Fernandez","Berisso");
        Comprador c4 = new Comprador("Pablo",234,"Diaz","Ensenada");
        
        b.agregarComprador(c4, 2, 4);
        b.agregarComprador(c1, 1, 1);
        b.agregarComprador(c3, 4, 8);
        b.agregarComprador(c2, 3, 3);

        b.incrementarPrecio(4, 20);

        System.out.println(b.toString());
    }
}