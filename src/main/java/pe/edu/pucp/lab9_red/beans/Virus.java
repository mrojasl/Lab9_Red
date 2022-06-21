package pe.edu.pucp.lab9_red.beans;

public class Virus {
    private int idVirus;
    private String nombre;
    private String variante;

    public String getVariante() {
        return variante;
    }

    public void setVariante(String variante) {
        this.variante = variante;
    }

    public int getIdVirus() {
        return idVirus;
    }

    public void setIdVirus(int idVirus) {
        this.idVirus = idVirus;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
