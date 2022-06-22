package pe.edu.pucp.lab9_red.daos;

import pe.edu.pucp.lab9_red.beans.Efectividad;
import pe.edu.pucp.lab9_red.beans.Objeto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Mision6Dao extends BaseDao{
    //Podemos reutilizar metodos de otras misiones, puesto que no se
    //afirma que debamos utilizar un dao dedicado solo para esta mision6
    public boolean ataque(String idZombie, String idSuper){
        boolean gana_humano=false;
        int idTipoZombie= encontrarTipoZombie(idZombie);
        Efectividad vacunaEfct=vacunaMasEfectiva(idSuper, idTipoZombie);
        if(vacunaEfct.getObjeto().getIdObjeto()!=0){
            double valorAleatorio = Math.random()*(100);//Generamos numero aleatorio
            if(valorAleatorio<vacunaEfct.getPorcentaje()){
                //Si caemos dentro de valores de efectividad, entonces el humano gana
                gana_humano=true;
            }
        }
        return gana_humano;
    }
    public int encontrarTipoZombie(String idZ){
        int idTZ=0;
        String sql="select t.idTiposDeZombie, t.nombre from zombie z " +
                "inner join tiposdezombie t on z.idTipoZombie = t.idTiposDeZombie " +
                "where z.idHumanos=?;";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1,idZ);
            try(ResultSet rs= pstmt.executeQuery()){
                rs.next();
                idTZ= rs.getInt(1);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return idTZ;
    }
    public Efectividad vacunaMasEfectiva(String idSuper, int idTipoZombie){
        Efectividad vacuna= new Efectividad();
        Objeto objeto= new Objeto();
        objeto.setIdObjeto(0);
        vacuna.setObjeto(objeto);
        String sql="select o.idObjetos,o.nombre, e.porcentaje, t.nombre, i.cantidad from superviviente s " +
                "left join inventario i on s.idHumanos = i.idHumanos " +
                "left join objetos o on i.idObjetos = o.idObjetos " +
                "left join efectividad e on o.idObjetos = e.idObjetos " +
                "left join tiposdezombie t on e.idTiposDeZombie = t.idTiposDeZombie " +
                "where s.idHumanos = ? and t.idTiposDeZombie=? and o.vacuna=1;";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1,idSuper);
            pstmt.setInt(2,idTipoZombie);
            try(ResultSet rs= pstmt.executeQuery()){
                int contador=0;
                while(rs.next()){
                    if(contador==0){
                        objeto.setIdObjeto(rs.getInt(1));
                        objeto.setNombre(rs.getString(2));
                        vacuna.setObjeto(objeto);
                        vacuna.setPorcentaje(rs.getDouble(3));
                    }else{
                        if(vacuna.getPorcentaje()<rs.getDouble(3)){
                            vacuna.setPorcentaje(rs.getDouble(3));
                            objeto.setIdObjeto(rs.getInt(1));
                            objeto.setNombre(rs.getString(2));
                            vacuna.setObjeto(objeto);
                        }
                    }
                    contador++;
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return vacuna;
    }
}
