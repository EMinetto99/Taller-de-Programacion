package tema5;

public class Hilera extends Coro{
    private Corista mCoro[][];
    private int cantFilas;
    private int cantColumnas;
    private int dimF;
    private int dimC;
    
    public Hilera(Director direc, int cantFil, int cantCol){
        director = direc;
        mCoro = new Corista[cantFil][cantCol];
        cantFilas = cantFil;
        cantColumnas = cantCol;
        dimC = 0;
        dimF = 0;
        inicializarMatriz();
    }
    
    public void inicializarMatriz(){
        for (int i = 0; i < cantFilas; i++){
            for (int j = 0; j < cantColumnas; j++)
                mCoro[i][j] = null;
        }
    }
    
    public void agregarCorista(Corista cor){
        if (!estaLleno()){
            int i = 0;
            int j = 0;
            boolean encontre = false;
            while ((i < cantFilas) && (!encontre)){
                while (j < cantColumnas && (!encontre)){
                    if (mCoro[i][j] == null){
                        mCoro[i][j] = cor;
                        dimF = (i+1);
                        dimC = (j+1);
                        encontre = true;
                    }
                    j++;
                }
                j=0;
                i++;
            }
        }
    }
    
    @Override
    public boolean estaLleno(){
        return ((cantFilas == dimF) && (cantColumnas == dimC));
    }

    @Override
    public boolean estaOrdenado(){
        boolean isOrdenado = true;
        boolean mismoTono = true;
        int i = 0, j = 0, ant = 99999, tono;
        while ((i < (cantColumnas-1)) && (mismoTono) && (isOrdenado)){
            tono = mCoro[i][j].getTono();
            j++;
            while ((j < (cantFilas-1)) && (mismoTono)){
                if (mCoro[i][j].getTono() != tono)
                    mismoTono = false;
                j++;
            }
            if (ant > tono)
                ant = tono;
            else
                isOrdenado = false;
            i++;
            j=0;
        }
        return (mismoTono && isOrdenado);
    }

 @Override
    public String mostrarCoristas(){
        String str = "";
        for (int i = 0; i < (cantFilas); i++){
            for (int j = 0; j < (cantColumnas); j++){
                str += "["+(i+1)+"]["+(j+1)+"] "+mCoro[i][j].toString()+"\n";
            }
        }
        return str;
    }
}