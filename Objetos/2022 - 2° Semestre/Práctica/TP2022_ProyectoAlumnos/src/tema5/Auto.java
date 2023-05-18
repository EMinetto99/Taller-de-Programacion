package tema5;

public class Auto {
    private String patente;
    private String nomDuenio;

    public Auto(String patente, String nomDuenio){
        this.patente = patente;
        this.nomDuenio = nomDuenio;
    }

    public void setPatente(String patente){
        this.patente = patente;
    }
    public String getPatente(){
        return patente;
    }

    public void setDuenio(String nom_Duenio){
        nomDuenio = nom_Duenio;
    }
    public String getDuenio(){
        return nomDuenio;
    }

@Override
    public String toString(){
        return "Patente: "+getPatente()+", nombre del duenio: "+getDuenio();
    }
}