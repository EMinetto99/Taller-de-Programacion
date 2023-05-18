package tema5;

public class Investigador {
    private String nombreCompleto;
    private int categoria;
    private String especialidad;
    private Subsidio vSubsidios[];

    private int cantSubsidios;
    private int dimL = 0;

    public Investigador(String nom_Completo, int categoria, String especialidad){
        nombreCompleto = nom_Completo;
        this.categoria = categoria;
        this.especialidad = especialidad;
        
        cantSubsidios = 5;
        vSubsidios = new Subsidio[cantSubsidios];
        inicializarVector();
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Subsidio[] getvSubsidios() {
        return vSubsidios;
    }

    public int getCantSubsidios() {
        return cantSubsidios;
    }

    public void setCantSubsidios(int cantSubsidios) {
        this.cantSubsidios = cantSubsidios;
    }

    public int getDimL(){
        return dimL;
    }

    public void inicializarVector(){
        for (int i = 0; i < cantSubsidios; i++){
            vSubsidios[i] = null;
        }
    }

    public void agregarSubsidio(Subsidio sub){
        if (vSubsidios == null)
            vSubsidios = new Subsidio[cantSubsidios];
        if (dimL < getCantSubsidios()){
            vSubsidios[dimL] = sub;
            dimL++;
        }
    }

    public double montoTotalSubsidios(){
        double montoTotal = 0;
        int subsidios = (dimL); 
        for (int i = 0; i < subsidios; i++){
            if (vSubsidios[i].isOtorgado())
                montoTotal += vSubsidios[i].getMonto();
        }
        return montoTotal;
    }

    public void otorgarTodosLosSubsidios(){
        int subsidios = (dimL);
        for (int i = 0; i < subsidios; i++){
            if (vSubsidios[i].isOtorgado() == false)
                vSubsidios[i].setOtorgado(true);
        }
    }

@Override
    public String toString(){
        return "Nombre: "+getNombreCompleto()+", categoria: "+getCategoria()+", especialidad: "+getEspecialidad()+", dinero total en subsidios: $"+montoTotalSubsidios();
    }
}