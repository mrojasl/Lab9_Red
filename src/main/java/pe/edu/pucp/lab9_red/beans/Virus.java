package pe.edu.pucp.lab9_red.beans;

public class Virus {
    private int idVirus;
    private String nombre;
    private String variante;
    private int idVariante;
    private int casosEncontrados;

    public int getIdVariante() {
        return idVariante;
    }

    public void setIdVariante(int idVariante) {
        this.idVariante = idVariante;
    }

    public int getCasosEncontrados() {
        return casosEncontrados;
    }

    public void setCasosEncontrados(int casosEncontrados) {
        this.casosEncontrados = casosEncontrados;
    }

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
