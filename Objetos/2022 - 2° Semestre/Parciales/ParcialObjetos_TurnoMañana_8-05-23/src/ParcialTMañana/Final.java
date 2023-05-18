package ParcialTMañana;

public class Final {
    private String fecha;
    private Alumno vAlumnos[];
    private int cantAlumnos;
    private int dimL;
    
    public Final(String fecha, int cantAlumnos){
        this.cantAlumnos = cantAlumnos;
        this.fecha = fecha;
        dimL = 0;
        vAlumnos = new Alumno[cantAlumnos];
        inicializarVector();
    }

    public String getFecha() {
        return fecha;
    }
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    public int getCantAlumnos() {
        return cantAlumnos;
    }
    public void setCantAlumnos(int cantAlumnos) {
        this.cantAlumnos = cantAlumnos;
    }
    
    public void inicializarVector(){
        for (int i = 0; i < getCantAlumnos(); i++){
            vAlumnos[i] = null;
        }
    }
    
    public void agregarAlumno(Alumno alu){
        if (dimL < cantAlumnos){
            vAlumnos[dimL] = alu;
            dimL++;
        }
    }

    public int cantParcialesConSiete(){
        int cant = 0;
        for (int i = 0; i < dimL; i++){
            if ((vAlumnos[i].getNota1() > 7) && (vAlumnos[i].getNota2() > 7) && (vAlumnos[i].getNota3() > 7))
                cant++;
        }
        return cant;
    }

    public String mostrarMesaFinal(){
        String str = "";
        str += "Cantidad de alumnos que asistieron: "+(dimL)+"\n";
        for (int i = 0; i < dimL; i++){
            str += "Alumno ["+(i+1)+"] "+vAlumnos[i].toString()+"\n";
        }
        return str;
    }

@Override
    public String toString(){
        String str = mostrarMesaFinal();
        return str;
    }
}