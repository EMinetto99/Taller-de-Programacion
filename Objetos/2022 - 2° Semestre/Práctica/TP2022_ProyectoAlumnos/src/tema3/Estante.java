package tema3;

public class Estante {
    // Atributos
    private int max_libros;
    private int dimL;
    private int cant_libros;
    private Libro vec_libros[];     // Vector de libros

    // Constructores - Métodos
    public Estante(){
        cant_libros = 0;
        dimL = 0;
        vec_libros = new Libro[max_libros = 20];
    }
    public Estante(int cant_Espacio){
        cant_libros = 0;
        dimL = 0;
        max_libros = cant_Espacio;
        vec_libros = new Libro[max_libros];
    }

    public int cantLibros(){
        return cant_libros;
    }
    public int cantEspacioEstante(){
        return max_libros;
    }
    public String estaLleno_String(){
        String ans;
        if (dimL == max_libros){
            ans = "El estante esta lleno.";
        }
        else{
            ans = "El estante NO esta lleno aun.";
        }
        return ans;
    }
    public boolean estaLleno_Boolean(){
        return (dimL == max_libros);
    }
    public String agregarLibro(Libro book){
        String state = "No se pudo agregar el libro. Estante lleno!";
        if (!estaLleno_Boolean()){
            vec_libros[dimL] = book;
            dimL++;
            cant_libros++;
            state = "El libro fue agregado con exito.";
        }
        return state;
    }
    public Libro devolverLibro(String nom_Libro){
        // Si en libro es igual al nom y no se termino el vector
        Libro book = null;
        int i = 0;
        boolean encontre = false;
        while ((i<max_libros) && (!encontre)){
            if (vec_libros[i] != null){
                if (nom_Libro.equals(vec_libros[i].getTitulo())){
                    encontre = true;
                    book = vec_libros[i];
                }
            }
            i++;
        }
        return book;
    }

    private String verLibros(){
        String str = "Estante ";
        String aux = "";
        for (int i = 0; i < max_libros; i++){
            if (vec_libros[i] != null){
                str += "[";
                aux = vec_libros[i].toString();
                str += aux +"]";
            } else {
                str+="[null]";
            }
        }
        return str;
    }

    @Override
    public String toString() {
        return verLibros();
    }
}