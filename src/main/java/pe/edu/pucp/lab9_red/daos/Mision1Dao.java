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

}
