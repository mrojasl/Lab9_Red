package pe.edu.pucp.lab9_red.daos;

import pe.edu.pucp.lab9_red.beans.Humano;
import pe.edu.pucp.lab9_red.beans.Superviviente;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Mision2Dao extends BaseDao{
    public ArrayList<Superviviente> listarSuperviviente(String filtro){
        if(filtro.equals("Todo")){
            filtro="";
        }
        ArrayList<Superviviente> lista= new ArrayList<>();
        String sql="select * FROM humanos h " +
                "left join superviviente s on s.idHumanos=h.idHumanos " +
                "left join superviviente p on p.idHumanos= s.idPareja "+
                "left join humanos h2 on h2.idHumanos= p.idHumanos "+
                "where h.estadoZ=0 and h.sexo like ?";
        try(Connection conn= this.getConnection();
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
        }
        return lista;
    }
    public double hallar_PesoCargado(String idHumano){
        double pesoTotal=0, pesoUnidad;
        int cantidad;
        String sql="select o.cantidad, o.masa from lab9_zombies.superviviente s  " +
                "left join lab9_zombies.objetos o on o.idHumanos=s.idHumanos " +
                "where s.idHumanos=? ";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1,idHumano);
            try(ResultSet rs= pstmt.executeQuery()){
                while(rs.next()){
                    cantidad=rs.getInt(1);
                    pesoUnidad= rs.getDouble(2);
                    pesoTotal+=(cantidad*pesoUnidad);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return pesoTotal;
    }

    public void actualizarHumano(String nombre, String idPareja, String id, double fuerza, double peso){
        String[] x=nombre.split(" ");
        nombre=x[0];
        String apellido="";
        if(x.length>=2){
            for(int i=1;i<x.length;i++){
                apellido+=x[i];
            }
        }
        String sql="update humanos set nombre=?, apellido=? where idHumanos=?";
        actualizarSuper(fuerza,peso,id,idPareja);
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1,nombre);
            pstmt.setString(2,apellido);
            pstmt.setString(3,id);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void actualizarSuper(double fuerza,double peso,String id,String idPareja){
        String sql, sql2, sql3;
        if(!idPareja.equals("Soltero")){
            //Se desea actualizar una relación con una persona
            sql= "update superviviente set peso=?, fuerza=?, idPareja=? where idHumanos=?";
            String parejaDePareja=obtenerIdPareja(idPareja);
            if(parejaDePareja==null){
                parejaDePareja="";
            }
            if(!parejaDePareja.equals(id)){
                //Si la relación no será con la misma persona, la otra persona se le asigna null en su idPareja
                sql2= "update superviviente set idPareja=null where idHumanos=?";
                try(Connection conn= this.getConnection();
                    PreparedStatement pstmt= conn.prepareStatement(sql2);){
                    pstmt.setString(1,idPareja);
                    pstmt.executeUpdate();
                }catch (SQLException e) {
                    e.printStackTrace();
                }
                //Asignamos la nueva relación
                sql3= "update superviviente set idPareja=? where idHumanos=?";
                try(Connection conn= this.getConnection();
                    PreparedStatement pstmt= conn.prepareStatement(sql3);){
                    pstmt.setString(1,id);
                    pstmt.setString(2,idPareja);
                    pstmt.executeUpdate();
                }catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }else{
            sql= "update superviviente set peso=?, fuerza=?, idPareja=null where idHumanos=?";
            //Si deseo quedarme soltero
            if(obtenerIdPareja(id)!=null){
                //Si tenía una relación anteriormente, entonces debo terminar la relación (idPareja de la otra persona==null)
                sql2= "update superviviente set idPareja=null where idHumanos=?";
                try(Connection conn= this.getConnection();
                    PreparedStatement pstmt= conn.prepareStatement(sql2);){
                    pstmt.setString(1,obtenerIdPareja(id));
                    pstmt.executeUpdate();
                }catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setDouble(1,peso);
            pstmt.setDouble(2,fuerza);
            if(!idPareja.equals("Soltero")){
                pstmt.setString(3,idPareja);
                pstmt.setString(4, id);
            }else{
                pstmt.setString(3, id);
            }
            pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public String obtenerIdPareja(String idHumano){
        String idPareja=null;
        String sql="select s.idPareja from superviviente s where s.idHumanos=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,idHumano);
            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    idPareja= rs.getString(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return idPareja;
    }
}
