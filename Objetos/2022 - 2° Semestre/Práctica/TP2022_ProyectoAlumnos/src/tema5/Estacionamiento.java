package tema5;

public class Estacionamiento {
    private String nombre;
    private String direccion;
    private int horaApertura;
    private int horaCierre;
    private Auto vPlazas[][];
    private int cantPisos;
    private int cantPlazas;

    public Estacionamiento(String nombre_Est, String direccion){
        nombre = nombre_Est;
        this.direccion = direccion;
        horaApertura = 8;
        horaCierre = 21;

        cantPisos = 5;
        cantPlazas = 10;
        vPlazas = new Auto[cantPisos][cantPlazas];
        inicializarMatriz();
    }
    public Estacionamiento(String nombre_Est, String direccion, int hApertura, int hCierre,
                            int cantPisos, int cantPlazas){
        horaApertura = hApertura;
        horaCierre = hCierre;

        this.cantPisos = cantPisos;
        this.cantPlazas = cantPlazas;
        vPlazas = new Auto[cantPisos][cantPlazas];
        inicializarMatriz();
    }

    public void inicializarMatriz(){
        for (int i = 0; i < cantPisos; i++){
            for (int j = 0; j < cantPlazas; j++){
                vPlazas[i][j] = null;
            }
        }
    }

    public void registrarAuto(Auto auto, int piso, int plaza){
        piso--;
        plaza--;
        vPlazas[piso][plaza] = auto;
    }

    public String buscarAuto(String patente){
        String message = "Auto Inexistente.";
        boolean encontre = false;
        int i = 0, j = 0;
        while ((i < cantPisos) && (!encontre)){
            while ((j < cantPlazas) && (!encontre)){
                if ((vPlazas[i][j] != null) && (vPlazas[i][j].getPatente().equals(patente))){
                    encontre = true;
                    message = "Auto ubicado en Piso["+(i+1)+"] Plaza["+(j+1)+"]";
                }
                j++;
            }
            i++;
            j = 0;
        }
        return message;
    }

    public int cantAutosEnPlaza(int numPlaza){
        numPlaza--;
        int cant = 0;

        for (int i = 0; i < cantPisos; i++){
            if (vPlazas[i][numPlaza] != null)
                cant++;
        }
        return cant;
    }
@Override
    public String toString(){
        String str = "";
        for (int i = 0; i < cantPisos; i++){
            for (int j = 0; j < cantPlazas; j++){
                str += "[Piso "+(i+1)+"][Plaza "+(j+1)+"]: ";
                if (vPlazas[i][j] == null)
                    str += "libre";
                else
                    str += vPlazas[i][j].toString();
                str += "\n";
            }
        }
        return str;
    }
}