package pe.edu.pucp.lab9_red.daos;

import pe.edu.pucp.lab9_red.beans.Superviviente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Mision4Dao extends BaseDao{
    public ArrayList<Superviviente> listarZombie(){
        ArrayList<Superviviente> lista= new ArrayList<>();
        String sql="select h.idHumanos, h.nombre, h.apellido,h.sexo, " +
                "       DATEDIFF(CURRENT_DATE(),fechaDeInfeccion)*24 as 'Tiempo infectado', " +
                "       v.nombre, z.numeroVictimas, t.nombre " +
                "       from humanos h " +
                "left join zombie z on h.idHumanos = z.idHumanos " +
                "left join variante v on z.idVariante = v.idVariante " +
                "inner join tiposdezombie t on z.idTipoZombie = t.idTiposDeZombie " +
                "where h.estadoZ=1 ";
        /*try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1,"%"+filtro+"%");
            try(ResultSet rs= pstmt.executeQuery()){
                while(rs.next()){
                    Superviviente sp= new Superviviente();
                    sp.setIdHumano(rs.getString(1));
                    sp.setNombre(rs.getString(2));
                    sp.setApellido(rs.getString(3));
                    sp.setSexo(rs.getString(4));
                    sp.setPeso(rs.getDouble(7));
                    sp.setFuerza(rs.getDouble(8));
                    if(rs.getString(9)!=null){
                        sp.setIdPareja(rs.getString(9));
                        sp.setNombrePareja(rs.getString(15)+" "+rs.getString(16));
                    }else{
                        sp.setIdPareja(null);
                        sp.setNombrePareja(null);
                    }
                    sp.setPesoCargado(hallar_PesoCargado(sp.getIdHumano()));
                    lista.add(sp);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }*/
        return lista;
    }
}
