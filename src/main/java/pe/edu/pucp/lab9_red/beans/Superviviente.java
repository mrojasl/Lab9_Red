package pe.edu.pucp.lab9_red.beans;

public class Superviviente extends Humano{
    private double peso;
    private double fuerza;
    private String nombrePareja;
    private String idPareja;
    private double pesoCargado;

    public String getIdPareja() {
        return idPareja;
    }

    public void setIdPareja(String idPareja) {
        this.idPareja = idPareja;
    }

    public String getNombrePareja() {
        return nombrePareja;
    }

    public void setNombrePareja(String nombrePareja) {
        this.nombrePareja = nombrePareja;
    }

    public double getPesoCargado() {
        return pesoCargado;
    }

    public void setPesoCargado(double pesoCargado) {
        this.pesoCargado = pesoCargado;
    }

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

}
