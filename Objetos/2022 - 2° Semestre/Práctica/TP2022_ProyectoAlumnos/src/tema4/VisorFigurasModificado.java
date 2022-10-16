package tema4;
public class VisorFigurasModificado {
    private int mostradas;
    private int guardadas;
    private int capacidadMaxima = 5;
    private Figura vector[];

    public VisorFigurasModificado(){
        mostradas = 0;
        guardadas = 0;
        vector = new Figura[capacidadMaxima];
    }

    public int getMostradas(){
        return mostradas;
    }
    public int getGuardadas(){
        return guardadas;
    }

    public void guardar(Figura f){
        vector[guardadas] = f;
        guardadas++;
    }
    public boolean quedaEspacio(){
        return (getGuardadas() != capacidadMaxima);
    }
    public void mostrar(int index){
        System.out.println(vector[index].toString());
        mostradas++;
    }
}