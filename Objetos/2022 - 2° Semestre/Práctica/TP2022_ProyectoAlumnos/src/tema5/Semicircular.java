package tema5;

public class Semicircular extends Coro{
    private Corista vCoro[];
    private int cantCoristas;
    private int dimL;
    
    public Semicircular(Director direc, int cantCoristas){
        director = direc;
        vCoro = new Corista[cantCoristas];
        this.cantCoristas = cantCoristas;
        dimL = 0;
        inicializarVector();
    }
    
    public void inicializarVector(){
        for (int i = 0; i < dimL; i++){
            vCoro[i] = null;
        }
    }
    
    @Override
    public void agregarCorista(Corista cor){
        if (!estaLleno()){
            vCoro[dimL] = cor;
            dimL++;
        }
    }
    
    @Override
    public boolean estaLleno(){
        boolean state = false;
        if (dimL >= vCoro.length)
            state = true;
        return state;
    }
    
    @Override
    public boolean estaOrdenado(){
        boolean isOrdenado = true;
        int i = 0;
        int cantAct, ant = 99999;
        while ((i < dimL) && (isOrdenado)){
            cantAct = vCoro[i].getTono();
            if (ant >= cantAct){
                ant = cantAct;
                i++;
            } else{
                isOrdenado = false;
            }
        }
        return isOrdenado;
    }

@Override
    public String mostrarCoristas(){
        String str = "";
        for (int i = 0; i < dimL; i++){
            str += "["+(i+1)+"] "+vCoro[i].toString()+"\n";
        }
        return str;
    }
}