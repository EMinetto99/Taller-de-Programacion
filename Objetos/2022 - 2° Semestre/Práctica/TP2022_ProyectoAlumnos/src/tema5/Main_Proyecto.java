package tema5;

public class Main_Proyecto {
    public static void main(String[] args) {
        Proyecto proyect = new Proyecto("Secret Proyect INC.",51,"Locobich Van Gutenberg");
        Investigador invest;
        Subsidio sub;
        
        invest = new Investigador("Neo Cortex", 7, "Cientifico malvado");
        proyect.agregarInvestigador(invest);
        sub = new Subsidio(45000,"Prestamo para la reparacion del Cortex Vortex");
        invest.agregarSubsidio(sub);
        sub.setOtorgado(true);
        sub = new Subsidio(120000, "Reparar el Warp Room");
        invest.agregarSubsidio(sub);

        invest = new Investigador("Nitrus Brio", 5, "Cientifico - quimico");
        proyect.agregarInvestigador(invest);
        sub = new Subsidio(12000,"Renovacion de stock de posiones");
        invest.agregarSubsidio(sub);
        sub.setOtorgado(true);
        sub = new Subsidio(120000, "Presupuesto para partes roboticas de animales");
        invest.agregarSubsidio(sub);

        invest = new Investigador("Asistente de laboratorio", 1, "Asistente");
        proyect.agregarInvestigador(invest);
        sub = new Subsidio(7000,"Subsidio del INDEC");
        invest.agregarSubsidio(sub);
        sub.setOtorgado(true);
        sub = new Subsidio(120000, "Presupuesto para maquina de clonacion");
        invest.agregarSubsidio(sub);
        
        System.out.println(proyect.toString());
    }
}