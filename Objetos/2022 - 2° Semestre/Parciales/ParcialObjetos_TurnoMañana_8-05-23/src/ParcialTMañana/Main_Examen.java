package ParcialTMañana;

public class Main_Examen {
    public static void main(String[] args) {
        Final mesaFinal = new Final("8/5/2023",30);
        
        Alumno alu = new Alumno("Pepe Perez", 23423, 3, 5, 8);
        mesaFinal.agregarAlumno(alu);
        alu = new Alumno("Lucas Luquez", 34534, 6, 6, 6);
        mesaFinal.agregarAlumno(alu);
        alu = new Alumno("Patricio Panfleto", 95848, 3, 5, 8);
        mesaFinal.agregarAlumno(alu);
        alu = new Alumno("Roberto Robertini", 31244, 7, 5, 9);
        mesaFinal.agregarAlumno(alu);
        alu = new Alumno("Pedro Pereira", 32448, 9, 8, 8);
        mesaFinal.agregarAlumno(alu);
        alu = new Alumno("Paco Patricios", 12335, 6, 5, 5);
        mesaFinal.agregarAlumno(alu);
        
        System.out.println(mesaFinal.mostrarMesaFinal());
        System.out.println("Cantidad de alumnos con mas de 7 en los 3 parciales: "+mesaFinal.cantParcialesConSiete());
    }
}
