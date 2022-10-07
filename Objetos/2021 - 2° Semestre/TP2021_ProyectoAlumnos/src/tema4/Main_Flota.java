package tema4;

import PaqueteLectura.Lector;

public class Main_Flota {
    public static void main(String[] args){
        Flota f1 = new Flota();
        Micro m,mPat,mDest;
        String pat, dest, hSal;
        boolean corte;
        int i=1;
        System.out.println("===== Sistema de Flota de micros =====");
        System.out.println("\u001B[33mMicro N°"+i);
        System.out.print("\u001B[37mPatente: ");
        pat=Lector.leerString().toUpperCase();
        while (!(pat.equals("ZZZ000")) && (i<=5)){ //Cambiar por variable global de clase
            System.out.print("Destino: ");
            dest=Lector.leerString();
            System.out.print("Hora de salida: ");
            hSal=Lector.leerString();
            m=new Micro(pat,dest,hSal);
            f1.agregarMicro(m);
            i++;
            if (i<=5){  // Cambiar por variable global de clase
                System.out.println("\n\u001B[33mMicro N°"+i);
                System.out.print("\u001B[37mPatente: ");
                pat=Lector.leerString().toUpperCase();
            }
        }
        do {
        System.out.print("\nPatente de un micro a eliminar de la flota: ");
        pat=Lector.leerString().toUpperCase();
        corte=f1.eliminarMicro(pat);
        System.out.println("Imprimir CORTE: "+corte);
        if (corte){
            System.out.println("\u001B[32mEl Micro con patente "+pat+" ha sido eliminado con éxito");
        }
        else{
            System.out.println("\u001B[33mLa patente ingresada no coinside con ninguno de los micros. ¡Intente nuevamente!");
        }
        } while (corte==false);
        System.out.print("Patente de micro a buscar: ");
        pat=Lector.leerString().toUpperCase();
        mPat=f1.buscarMicroPorPatente(pat);
        if (mPat==null){
            System.out.println("\u001B[31mNo se ha encontrado un micro con la patente "+pat);
        }
        else{
            System.out.println("\u001B[32mSe ha encontrado un micro con esa patente: "+mPat);
        }
        System.out.print("Destino de micro a buscar: ");
        dest=Lector.leerString();
        mDest=f1.buscarMicroPorDestino(dest);
        if (mDest==null){
            System.out.println("\u001B[31mNo se ha encontrado un micro con destino "+dest);
        }
        else{
            System.out.println("\u001B[32mSe ha encontrado un micro con ese destino: "+mDest);
        }
    }
}