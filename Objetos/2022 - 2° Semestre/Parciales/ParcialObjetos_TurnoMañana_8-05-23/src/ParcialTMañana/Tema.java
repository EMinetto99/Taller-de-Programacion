package ParcialTMañana;

public class Tema {
    private int numeroTema;
    private String enunciadoPractico;
    private String enunciadoTeorico;

    public Tema(){}

    public Tema(int numeroTema, String enunciadoPractico, String enunciadoTeorico) {
        this.numeroTema = numeroTema;
        this.enunciadoPractico = enunciadoPractico;
        this.enunciadoTeorico = enunciadoTeorico;
    }

    public int getNumeroTema() {
        return numeroTema;
    }
    public void setNumeroTema(int numeroTema) {
        this.numeroTema = numeroTema;
    }
    public String getEnunciadoPractico() {
        return enunciadoPractico;
    }
    public void setEnunciadoPractico(String enunciadoPractico) {
        this.enunciadoPractico = enunciadoPractico;
    }
    public String getEnunciadoTeorico() {
        return enunciadoTeorico;
    }
    public void setEnunciadoTeorico(String enunciadoTeorico) {
        this.enunciadoTeorico = enunciadoTeorico;
    }

@Override
    public String toString() {
        return "Tema {" + "numeroTema=" + numeroTema + ", enunciadoPractico=" + enunciadoPractico + ", enunciadoTeorico=" + enunciadoTeorico + '}';
    }
}