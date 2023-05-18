package ParcialTTarde;

import PaqueteLectura.Lector;

public class Main_Subasta {
    public static void main(String[] args) {
        final int categorias = 3;
        final int articulos = 5;
        Subasta sub = new Subasta(articulos, categorias);
        
        Articulo art;
        Persona person;
        String nom, ape, desc;
        int id, dni, categoria;
        double monto;
        
        art = new Articulo(233, "Bicicleta antigua", 1200);
        sub.agregarArticulo(art, 2);
        art = new Articulo(345, "Monopatin", 700);
        sub.agregarArticulo(art, 2);
        art = new Articulo(123, "Mesa de luz", 200);
        sub.agregarArticulo(art, 1);
        art = new Articulo(456, "Ropero", 850);
        sub.agregarArticulo(art, 3);
        art = new Articulo(24, "Juego de lamparas", 540);
        sub.agregarArticulo(art, 3);

        System.out.println("======= OFERTA DE PERSONAS ========");
        System.out.print("Ingrese su nombre (zzz para terminar): ");
        nom = Lector.leerString();
        while (!nom.equals("zzz")){
            System.out.print("Ingrese Apellido: ");
            ape = Lector.leerString();
            System.out.print("Ingrese DNI: ");
            dni = Lector.leerInt();
            person = new Persona(nom, ape, dni);

            System.out.print("ID del articulo a ofertar: ");
            id = Lector.leerInt();
            System.out.print("Cual sera su oferta?: $");
            monto = Lector.leerDouble();
            System.out.println();
            sub.ofertarArticulo(id, person, monto);
            
            System.out.print("Ingrese su nombre (zzz para terminar): ");
            nom = Lector.leerString();
        }
        System.out.println();

        System.out.print("Ingrese un ID para mostrar su ganador: ");
        id = Lector.leerInt();
        System.out.print("Persona ganadora del articulo "+id+": ");
        if (sub.conocerGanadorPorID(id) == null){
            System.out.println("Nadie");
        } else {
            System.out.println(sub.conocerGanadorPorID(id).toString());
        }
        System.out.println();

        for (int i = 0; i < categorias; i++){
            System.out.println("Categoria ["+(i+1)+"] "+sub.ofertaGrandeEnCategoria(i+1).toString());
        }
    }
}
