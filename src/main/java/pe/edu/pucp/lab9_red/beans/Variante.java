package pe.edu.pucp.lab9_red.beans;

public class Variante {
    private int idVariante;
    private String nombre;
    private Virus virus;
    private int casosEncontrados;

    public int getCasosEncontrados() {
        return casosEncontrados;
    }

    public void setCasosEncontrados(int casosEncontrados) {
        this.casosEncontrados = casosEncontrados;
    }

    public int getIdVariante() {
        return idVariante;
    }

    public void setIdVariante(int idVariante) {
        this.idVariante = idVariante;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Virus getVirus() {
        return virus;
    }

    public void setVirus(Virus virus) {
        this.virus = virus;
    }
}
