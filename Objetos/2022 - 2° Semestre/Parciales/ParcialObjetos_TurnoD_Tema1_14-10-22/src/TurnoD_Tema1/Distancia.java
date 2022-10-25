package TurnoD_Tema1;
public class Distancia extends Curso{
    private String link;
    
    public Distancia(int anioCursada, int maxAlu, String link){
        super(anioCursada, maxAlu);
        this.link = link;
    }

    @Override
    public boolean puedeRendir(Alumno alu){
        boolean puede = false;
        if ((alu.getCantAutoAprobadas() >= 3) && (alu.getAsistencias()>=1)){
            System.out.println("El alumno "+alu.getNombre()+" puede rendir.");
            puede = true;
        }
        else {
            System.out.println("El alumno "+alu.getNombre()+" no cumple las condiciones.");
        }
        return puede;
    }
}