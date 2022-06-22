package pe.edu.pucp.lab9_red.beans;

public class Zombie extends Humano{
    private String fechaInfectado;
    private int numVictimas;
    private Virus virus;
    private String tipoZombie;
    private int horasInfectado;
    private String nombreVariante;

    public int getHorasInfectado() {
        return horasInfectado;
    }

    public void setHorasInfectado(int horasInfectado) {
        this.horasInfectado = horasInfectado;
    }

    public String getNombreVariante() {
        return nombreVariante;
    }

    public void setNombreVariante(String nombreVariante) {
        this.nombreVariante = nombreVariante;
    }

    public Virus getVirus() {
        return virus;
    }

    public void setVirus(Virus virus) {
        this.virus = virus;
    }

    public String getTipoZombie() {
        return tipoZombie;
    }

    public void setTipoZombie(String tipoZombie) {
        this.tipoZombie = tipoZombie;
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
