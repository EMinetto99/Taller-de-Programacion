package TurnoD_Tema1;
public class Main_Curso {
    public static void main(String[] args) {
        Presencial p = new Presencial(2022,5,5);
        Distancia d = new Distancia(2022,10,"www.aulavirtual.com");

        Alumno a1 = new Alumno("Pepito",342);
        Alumno a2 = new Alumno("Pedro",877);
        Alumno a3 = new Alumno("Pablo",834);
        Alumno a4 = new Alumno("Juan",347);
        
        p.agregarAlumno(a4);
        p.aprobarAutoevaluacion(347);
        p.incrementarAistencia(347);
        p.incrementarAistencia(347);
        p.incrementarAistencia(347);
        p.incrementarAistencia(347);
        p.agregarAlumno(a2);
        d.agregarAlumno(a3);
        d.agregarAlumno(a1);

        System.out.println("Cantidad de alumnos que pueden rendir: "+p.cantidadAlumnosPuedenRendir());
    }
}