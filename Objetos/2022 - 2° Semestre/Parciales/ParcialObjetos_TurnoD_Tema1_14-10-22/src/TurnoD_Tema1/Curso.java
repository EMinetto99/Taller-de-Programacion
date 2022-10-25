package TurnoD_Tema1;
public abstract class Curso {
    private int anioCursada;
    private int maxAlu;
    private int dimL = 0;
    private Alumno alumno[];
    
    public Curso(int anioCursada, int cantAlumnos){
        this.anioCursada = anioCursada;
        maxAlu = cantAlumnos;
        inicializarVector();
    }
    public void inicializarVector(){
        alumno = new Alumno[maxAlu];
        for (int i=0; i < maxAlu; i++){
            alumno[i] = null;
        }
    }
    public boolean hayLugar(){
        boolean estado = false;
        if (dimL<maxAlu){
            estado = true;
        }
        return estado;
    }
    public boolean agregarAlumno(Alumno alu){
        boolean exito = false;
        if (hayLugar()){
            alumno[dimL] = alu;
            dimL++;
            exito = true;
        }
        return exito;
    }
    public void incrementarAistencia(int DNI){
        int i = 0;
        boolean encontre = false;
        while ((i<maxAlu) && (!encontre)) {
            if (alumno[i].getDNI() == DNI){
                alumno[i].setAsistencias(alumno[i].getAsistencias()+1);
                encontre = true;
            }
        }
        if (encontre){
            System.out.println("Operacion realizada con exito!");
        }
    }
    public void aprobarAutoevaluacion(int DNI){
        int i = 0;
        boolean encontre = false;
        while ((i<maxAlu) && (!encontre)) {
            if (alumno[i].getDNI() == DNI){
                alumno[i].setCantAutoAprobadas(alumno[i].getCantAutoAprobadas()+1);
                encontre = true;
            }
        }
        if (encontre){
            System.out.println("Operacion realizada con exito!");
        }
    }
    public int cantidadAlumnosPuedenRendir(){
        int cant = 0;
        for (int i= 0; i < dimL; i++){
            if (puedeRendir(alumno[i])){
                cant++;
            }
        }
        return cant;
    }
    public abstract boolean puedeRendir(Alumno a);
}