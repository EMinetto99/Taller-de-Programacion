package tema4;
public class Flota {
    //Atributos
    private Micro vMicros[];
    private int micros;
    private int cantMicros;
    //Métodos
    public Flota(){
        micros=5;
        vMicros=new Micro[micros];
    }
    public boolean estaCompleta(){
        return cantMicros==micros;
    }
    public void agregarMicro(Micro m){
        vMicros[cantMicros]=m;
        cantMicros++;
    }
    public boolean eliminarMicro(String pat){
        int i=0;
        boolean encontre=false;
        while ((i<cantMicros) && !(encontre)){
            if (vMicros[i].getPatente().equals(pat)){
                encontre=true;
            }
            i++;
        }
        if (encontre){
            vMicros[i-1]=null;
        }
        return encontre;
    }
    public Micro buscarMicroPorPatente(String pat){
        int i=0;
        Micro micro=null;
        boolean encontre=false;
        while ((i<cantMicros) && !(encontre)){
            if ((vMicros[i]!=null) && (vMicros[i].getPatente().equals(pat))){
                encontre=true;
            }
            i++;
        }
        if (encontre){
            micro=vMicros[i-1];
        }
        return micro;
    }
    public Micro buscarMicroPorDestino(String dest){
        int i=0;
        Micro micro=null;
        boolean encontre=false;
        while ((i<cantMicros) && !(encontre)){
            if ((vMicros[i]!=null) && (vMicros[i].getDestino().equals(dest))){
                encontre=true;
            }
            i++;
        }
        if (encontre){
            micro=vMicros[i-1];
        }
        System.out.println("Return: "+micro);
        return micro;
    }
}