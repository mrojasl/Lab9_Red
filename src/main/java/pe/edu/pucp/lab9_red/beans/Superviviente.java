package pe.edu.pucp.lab9_red.beans;

public class Superviviente extends Humano{
    private double peso;
    private double fuerza;
    private String idPareja;

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public double getFuerza() {
        return fuerza;
    }

    public void setFuerza(double fuerza) {
        this.fuerza = fuerza;
    }

    public String getIdPareja() {
        return idPareja;
    }

    public void setIdPareja(String idPareja) {
        this.idPareja = idPareja;
    }
}
