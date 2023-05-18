package ParcialTTarde;

public class Subasta {
    private Articulo mArticulos[][];
    private int vDimL[];
    private int cantArticulos;
    private int cantCategorias;
    
    public Subasta(int cantArticulos, int cantCategorias){
        mArticulos = new Articulo[cantCategorias][cantArticulos];
        vDimL = new int[cantCategorias];
        this.cantArticulos = cantArticulos;
        this.cantCategorias = cantCategorias;
        inicializarMatriz();
        inicializarVector();
    }
    
    public void inicializarMatriz(){
        for (int i = 0; i < cantCategorias; i++){
            for (int j = 0; j < cantArticulos; j++){       // Error: Cambiar variable "i" en el iterador por j
                mArticulos[i][j] = null;
            }
        }
    }
    public void inicializarVector(){
        for (int i = 0; i < cantCategorias; i++){
            vDimL[i] = 0;
        }
    }
    
    public void agregarArticulo(Articulo article, int categoria){
        categoria--;
        if (vDimL[categoria] < cantArticulos){
            mArticulos[categoria][vDimL[categoria]] = article;
            vDimL[categoria]++;
        }
    }
    
    public void ofertarArticulo(int id, Persona person, double monto){
        int i = 0, j = 0;
        int dimLArticulos;
        boolean encontre = false;

        while ((i < cantCategorias) && (!encontre)){
            dimLArticulos = vDimL[i];
            while ((j < dimLArticulos) && (!encontre)){
                if (id == mArticulos[i][j].getID()){
                    if (monto > mArticulos[i][j].getMonto()){
                        mArticulos[i][j].setGanador(person);
                        encontre = true;
                    }
                }
                j++;
            }
            j = 0;
            i++;
        }
    }
    
    public Persona conocerGanadorPorID(int id){
        int j = 0, i = 0;
        int dimLArticulos;
        Persona ganador = null;
        boolean encontre = false;

        while ((i < cantCategorias) && (!encontre)){
            dimLArticulos = vDimL[i];
            while ((j < dimLArticulos) && (!encontre)){
                if (id == mArticulos[i][j].getID()){
                    if (mArticulos[i][j].getGanador() != null){
                        ganador = mArticulos[i][j].getGanador();
                        encontre = true;
                    }
                }
                j++;
            }
            j = 0;
            i++;
        }
        return ganador;
    }
    
    public Articulo ofertaGrandeEnCategoria(int numCategoria){
        Articulo articulo = null;
        double oferta = -99999;
        int j = 0;
        numCategoria--;

        while ((j < vDimL[numCategoria])){
            if (mArticulos[numCategoria][j].getMonto() > oferta){
                oferta = mArticulos[numCategoria][j].getMonto();
                articulo = mArticulos[numCategoria][j];
            }
            j++;
        }
        return articulo;
    }
}