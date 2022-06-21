package pe.edu.pucp.lab9_red.daos;

import pe.edu.pucp.lab9_red.beans.Humano;
import pe.edu.pucp.lab9_red.beans.Superviviente;

import java.sql.*;
import java.util.ArrayList;

public class Mision1Dao extends BaseDao{
    public ArrayList<Humano> listarHumanos(){
        ArrayList<Humano> listahumanos= new ArrayList<>();
        String sql="select * from humanos";
        try(Connection conn= this.getConnection();
            Statement stmt= conn.createStatement();
            ResultSet rs= stmt.executeQuery(sql)){
            while(rs.next()){
                Humano humano= new Humano();
                humano.setIdHumano(rs.getString(1));
                humano.setNombre(rs.getString(2));
                humano.setApellido(rs.getString(3));
                humano.setSexo(rs.getString(4));
                if(rs.getInt(5)==1){
                    humano.setEstadoZombie(true);
                }else{
                    humano.setEstadoZombie(false);
                }
                listahumanos.add(humano);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error");
        }
        return listahumanos;
    }
    public ArrayList<Superviviente> listarSuperviviente(){
        ArrayList<Superviviente> lista= new ArrayList<>();
        String sql="select * FROM humanos h " +
                "left join superviviente s on s.idHumanos=h.idHumanos " +
                "left join superviviente p on p.idHumanos= s.idPareja "+
                 "left join humanos h2 on h2.idHumanos= p.idHumanos "+
                "where h.estadoZ=0 ";
        try(Connection conn= this.getConnection();
            Statement stmt= conn.createStatement();
            ResultSet rs= stmt.executeQuery(sql)){
            while(rs.next()){
                Superviviente sp= new Superviviente();
                sp.setIdHumano(rs.getString(1));
                sp.setNombre(rs.getString(2));
                sp.setApellido(rs.getString(3));
                sp.setSexo(rs.getString(4));
                sp.setPeso(rs.getDouble(7));
                sp.setFuerza(rs.getDouble(8));
                if(rs.getString(9)!=null){
                    sp.setnombrePareja(rs.getString(15)+" "+rs.getString(16));
                }else{
                    sp.setnombrePareja(null);
                }
                lista.add(sp);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
}
