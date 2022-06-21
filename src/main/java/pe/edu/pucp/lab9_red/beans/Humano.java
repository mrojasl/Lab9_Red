package pe.edu.pucp.lab9_red.beans;

public class Humano {
    private String idHumano;
    private String nombre;
    private String apellido;
    private String sexo;
    private boolean estadoZombie;

    public String getIdHumano() {
        return idHumano;
    }

    public void setIdHumano(String idHumano) {
        this.idHumano = idHumano;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public boolean getEstadoZombie() {
        return estadoZombie;
    }

    public void setEstadoZombie(boolean estadoZombie) {
        this.estadoZombie = estadoZombie;
    }
}
