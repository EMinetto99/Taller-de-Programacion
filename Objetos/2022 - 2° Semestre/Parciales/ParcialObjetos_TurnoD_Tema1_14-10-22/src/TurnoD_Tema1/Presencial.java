package TurnoD_Tema1;
public class Presencial extends Curso{
    private int numAula;
    
    public Presencial(int anioCursada, int maxAlu, int aula){
        super(anioCursada, maxAlu);
        numAula = aula;
    }

    @Override
    public boolean puedeRendir(Alumno alu){
        boolean puede = false;
        int asist = alu.getAsistencias();
        if (asist >= 3){
            System.out.println("El alumno "+alu.getNombre()+" puede rendir.");
            puede = true;
        }
        else {
            System.out.println("El alumno "+alu.getNombre()+" no cumple las condiciones.");
        }
        return puede;
    }
}