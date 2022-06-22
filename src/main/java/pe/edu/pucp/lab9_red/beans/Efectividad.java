package pe.edu.pucp.lab9_red.beans;

public class Efectividad {
    private TiposDeZombie tipoDeZombie;
    private Objeto objeto;
    private Double porcentaje;

    public TiposDeZombie getTipoDeZombie() {
        return tipoDeZombie;
    }
    public void setTipoDeZombie(TiposDeZombie tipoDeZombie) {
        this.tipoDeZombie = tipoDeZombie;
    }

    public Objeto getObjeto() {
        return objeto;
    }

    public void setObjeto(Objeto objeto) {
        this.objeto = objeto;
    }

    public Double getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(Double porcentaje) {
        this.porcentaje = porcentaje;
    }
}
