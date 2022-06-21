package pe.edu.pucp.lab9_red.beans;

public class Zombie extends Humano{
    private String fechaInfectado;
    private int numVictimas;
    private Virus virus;
    private String tipoZombie;

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
