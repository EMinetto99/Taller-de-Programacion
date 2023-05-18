package tema5;
public class Proyecto {
    private String nombreProyecto;
    private int codigo;
    private String nombreDirector;
    private Investigador vInvestigadores[];
    private int cantInvestigadores;
    private int dimL = 0;

    public Proyecto(String nombre, int codigo, String nom_Director){
        this.nombreProyecto = nombre;
        this.codigo = codigo;
        nombreDirector = nom_Director;

        cantInvestigadores = 50;
        vInvestigadores = new Investigador[cantInvestigadores];
        inicializarVector();
    }

    public String getNombreProyecto() {
        return nombreProyecto;
    }

    public void setNombreProyecto(String nombre) {
        this.nombreProyecto = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreCompleto) {
        this.nombreDirector = nombreCompleto;
    }

    public void inicializarVector(){
        for (int i = 0; i < cantInvestigadores; i++){
            vInvestigadores[i] = null;
        }
    }

    public void agregarInvestigador(Investigador invest){
        if (vInvestigadores == null)
            vInvestigadores = new Investigador[cantInvestigadores];
        if (dimL < cantInvestigadores){
            vInvestigadores[dimL] = invest;
            dimL++;   
        }
    }

    public double dineroTotalOtorgado(){
        double montoTotal = 0;
        int investigadores = (dimL);

        for (int i = 0; i < investigadores; i++)
            montoTotal += vInvestigadores[i].montoTotalSubsidios();
        return montoTotal;
    }

    public void otorgarTodos(String nom_completo_Invest){
        int i = 0;
        boolean encontre = false;
        int investigadores = (dimL+1);

        while ((i < investigadores) && (!encontre)){
            if (vInvestigadores[i].getNombreCompleto().equals(nom_completo_Invest)){
                encontre = true;
                vInvestigadores[i].otorgarTodosLosSubsidios();
            }
            i++;
        }
    }

    public String mostrarInvestigadores(){
        String str = "";
        for (int i = 0; i < dimL; i++){
            str += vInvestigadores[i].toString()+"\n";
        }
        return str;
    }

@Override
    public String toString(){
        String str = "Nombre del proyecto: "+getNombreProyecto()+", codigo: "+getCodigo()+", nombre del director: "+getNombreDirector()+", total de dinero otorgado: $"+dineroTotalOtorgado()+"\n"+mostrarInvestigadores();
        return str;
    }
}