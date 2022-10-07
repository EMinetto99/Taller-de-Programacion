package prac1.pkg6.intro;

import PaqueteLectura.Lector;

public class Prac16Intro {
    public static void main(String[] args) {
        int vOpciones[] = new int[5];
        int opcion,mayor=5,actual=-99999;
        do{
            System.out.println("==== Ingrese una operación ====");
            System.out.print("0. Cobro de cheque\n"+"1. Deposito/Extración de cuentas\n"+
            "2. Pago de Impuestos o Servicios\n"+"4. Cobro de planes\n"+"5. Salir del Sistema\n"+"SU OPERACION: ");
            opcion=Lector.leerInt();
            switch(opcion){
                case 0: vOpciones[0]++;
                    break;
                case 1: vOpciones[1]++;
                    break;
                case 2: vOpciones[2]++;
                    break;
                case 3: vOpciones[3]++;
                    break;
                case 4: vOpciones[4]++;
                    break;
                case 5: System.out.println();
                        System.out.println("Saliendo del panel...");
                    break;
                default: System.out.println(); 
                        System.out.println("¡ERROR!. INGRESE UNA OPCIÓN VÁLIDA.");
                    break;
            }
            System.out.println();
        } while(opcion!=5);
        for (int i=0;i<5;i++){
            if (vOpciones[i]>actual){
                actual=vOpciones[i];
                mayor=i;
            }
        }
        System.out.println();
        System.out.println("===== Cantidad de personas Atendidas =====\n"+
        "0. Cobro de cheque: "+vOpciones[0]+"\n1. Deposito/Extración de cuentas: "+vOpciones[1]+
        "\n2. Pago de Impuestos o Servicios: "+vOpciones[3]+"\n4. Cobro de planes: "+vOpciones[4]);
        System.out.println("Opecacion más solicitada: OPCIÓN "+mayor);
    }
}