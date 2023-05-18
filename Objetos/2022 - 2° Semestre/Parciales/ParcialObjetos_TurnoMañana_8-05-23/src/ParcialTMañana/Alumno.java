package ParcialTMañana;

public class Alumno {
    private String nombre;
    private int legajo;
    private int nota1, nota2, nota3;
    private Tema tema;

    public Alumno(String nom, int legajo, int nota1, int nota2, int nota3){
        nombre = nom;
        this.legajo = legajo;
        this.nota1 = nota1;
        this.nota2 = nota2;
        this.nota3 = nota3;
        tema = new Tema(0, "He aquí un enunciado práctico.", "He aquí un enunciado teórico.");
        asignarTema();
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public int getLegajo() {
        return legajo;
    }
    public void setLegajo(int legajo) {
        this.legajo = legajo;
    }
    public int getNota1() {
        return nota1;
    }
    public void setNota1(int nota1) {
        this.nota1 = nota1;
    }
    public int getNota2() {
        return nota2;
    }
    public void setNota2(int nota2) {
        this.nota2 = nota2;
    }
    public int getNota3() {
        return nota3;
    }
    public void setNota3(int nota3) {
        this.nota3 = nota3;
    }
    
    public void asignarTema(){
        double prom = (getNota1()+getNota2()+getNota3())/3;
        if (tema == null)
            tema = new Tema();
        if (prom > 6)
            tema.setNumeroTema(1);
        else tema.setNumeroTema(2);
    }

@Override
    public String toString() {
        return "Nombre: "+getNombre()+", legajo: "+getLegajo()+", número de tema: "+tema.getNumeroTema()+"\n";
    }
}