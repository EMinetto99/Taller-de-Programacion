package tema5;

public class Main_Estacionamiento {
    public static void main(String[] args) {
        Auto auto;
        Estacionamiento est = new Estacionamiento("Estacionamiento 'El asfalto'","Toreto",8,21,3,3);
        
        auto = new Auto("JF833FB","Hernesto Guevara");
        est.registrarAuto(auto, 1, 1);
        auto = new Auto("JD043FK","Lucas Luquez");
        est.registrarAuto(auto, 2, 3);
        auto = new Auto("JE973OD","Marcos Marquez");
        est.registrarAuto(auto, 3, 2);
        auto = new Auto("IF934ES","Pablo Palmera");
        est.registrarAuto(auto, 2, 2);
        auto = new Auto("UE983EE","Juan Juarez");
        est.registrarAuto(auto, 1, 3);
        auto = new Auto("PW927DD","Pedro Perez");
        est.registrarAuto(auto, 3, 3);

        System.out.println(est.toString());
        
        System.out.println("Cantidad de autos en la plaza n°1: "+est.cantAutosEnPlaza(1));
        System.out.println();
        
        System.out.println(est.buscarAuto("IF934ES"));
        
    }
}