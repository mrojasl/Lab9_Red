package pe.edu.pucp.lab9_red.beans;

public class Zombie extends Humano{
    private String fechaInfectado;
    private int numVictimas;
    private Variante variante;
    private int horasInfectado;
    private TiposDeZombie tz;

    public Variante getVariante() {
        return variante;
    }

    public void setVariante(Variante variante) {
        this.variante = variante;
    }

    public TiposDeZombie getTz() {
        return tz;
    }

    public void setTz(TiposDeZombie tz) {
        this.tz = tz;
    }

    public int getHorasInfectado() {
        return horasInfectado;
    }

    public void setHorasInfectado(int horasInfectado) {
        this.horasInfectado = horasInfectado;
    }

    public String getFechaInfectado() {
        return fechaInfectado;
    }

    public void setFechaInfectado(String fechaInfectado) {
        this.fechaInfectado = fechaInfectado;
    }

    public int getNumVictimas() {
        return numVictimas;
    }

    public void setNumVictimas(int numVictimas) {
        this.numVictimas = numVictimas;
    }
}
