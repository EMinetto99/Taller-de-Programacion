package tema4;

public class Micro {
    //Atributos
    private String patente;
    private String destino;
    private String horaSalida;
    private int asientos;
    private boolean vAsientos[];
    private int cantOcupados;
    
    //Constructor
    Micro(String patente, String destino, String horaSalida){
        this.patente=patente;
        this.destino=destino;
        this.horaSalida=horaSalida;
        asientos=20;
        vAsientos=new boolean[asientos];
        cantOcupados=0;
    }
    public void setPatente(String patente){
        this.patente=patente;
    }
    public String getPatente(){
        return patente;
    }
    public void setDestino(String destino){
        this.destino=destino;
    }
    public String getDestino(){
        return destino;
    }
    public void setHoraSalida(String horaSalida){
        this.horaSalida=horaSalida;
    }
    public String getHoraSalida(){
        return horaSalida;
    }
    public int getCantOcupados(){
        return cantOcupados;
    }
    public boolean microLleno(){
        return (cantOcupados==asientos);
    }
    private boolean validarAsiento(int num_asiento){
        return (num_asiento<=asientos) && (num_asiento>=0);
    }
    private boolean estadoAsiento(int num_asiento){
        return vAsientos[num_asiento];
    }
    public boolean procesarAsiento(int num_asiento){
        boolean estado;
        num_asiento--;
        if (validarAsiento(num_asiento)){
            if (estadoAsiento(num_asiento)==false){
                ocuparAsiento(num_asiento);
                cantOcupados++;
                System.out.println();
                System.out.println("====================================================================================");
                System.out.println("El asiento desocupado '"+(num_asiento+1)+"', fue ocupado con éxito.");
                estado=true;
            }
            else{
                int asi_imp=primerLibre();
                System.out.println();
                System.out.println("====================================================================================");
                System.out.print("¡El asiento ingresado está ocupado!. El primer asiento desocupado más próximo es: ");
                if (asi_imp==-1){
                    System.out.println("Ninguno.");
                }
                else{
                    System.out.println(asi_imp+1);
                }
                estado=false;
            }
        }
        else{
            System.out.println();
            System.out.println("====================================================================================");
            System.out.println("¡Asiento invalido! Ingrese un asiento nuevamente.");
            estado=false;
        }
        return estado;
    }
    public void ocuparAsiento(int num_asiento){
        vAsientos[num_asiento]=true;
    }
    public void desocuparAsiento(int num_asiento){
        vAsientos[num_asiento]=false;
    }
    private int primerLibre(){
        boolean encontre=false;
        int i=0;
        while ((i<asientos) && !(encontre)){
            if (vAsientos[i]==false){
                encontre=true;
            }
            i++;
        }
        if (encontre){
            return i-1;
        }
        else {
            return -1;
        }
    }
}