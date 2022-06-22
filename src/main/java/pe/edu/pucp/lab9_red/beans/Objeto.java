package pe.edu.pucp.lab9_red.beans;

public class Objeto {
    private int idObjeto;
    private String nombre;
    private Double masa;
    private int vacuna;

    public int getIdObjeto() {
        return idObjeto;
    }

    public void setIdObjeto(int idObjeto) {
        this.idObjeto = idObjeto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getMasa() {
        return masa;
    }

    public void setMasa(Double masa) {
        this.masa = masa;
    }

    public int getVacuna() {
        return vacuna;
    }

    public void setVacuna(int vacuna) {
        this.vacuna = vacuna;
    }
}
