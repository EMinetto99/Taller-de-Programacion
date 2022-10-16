package TurnoC_Tema2;
public class Teatro {
    public static void main(String[] args) {
        Funcion f = new Funcion("Juanito y los clonosaurios","16/10/22","19:00hs",3,3);
        f.ocuparButaca(1, 3);
        f.ocuparButaca(2, 3);
        f.ocuparButaca(1, 2);
        f.ocuparButaca(2, 2);
        System.out.println();
        System.out.println(f.toString());    // Imprimir TODAS butacas de la Funcion
        System.out.println();
        f.desocuparFilasButaca(2);         // Metodo Desocupar Fila
        System.out.println(f.toString());
        System.out.println(f.mostrarColumnaButacas(1));     // Metodo Imprimir columna
    }
}