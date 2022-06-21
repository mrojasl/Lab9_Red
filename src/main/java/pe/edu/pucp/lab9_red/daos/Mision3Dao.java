package pe.edu.pucp.lab9_red.daos;

import pe.edu.pucp.lab9_red.beans.Humano;
import pe.edu.pucp.lab9_red.beans.Superviviente;
import pe.edu.pucp.lab9_red.beans.Virus;

import java.sql.*;
import java.util.ArrayList;

public class Mision3Dao extends BaseDao{

    public ArrayList<Virus> listarVariantes(){
        ArrayList<Virus> listaVirus = new ArrayList<>();
        String sql="select va.idVirus,vi.nombre,va.idVariante,va.nombre,subq.cantidadPorVariante from variante va\n" +
                "inner join virus vi on va.idVirus=vi.idVirus inner join (select v.idVariante,count(*)\n" +
                "as 'cantidadPorVariante' from zombie z right join variante v on z.idVariante=v.idVariante\n" +
                "group by v.idVariante) subq on (va.idVariante=subq.idVariante) order by vi.idVirus";
        try(Connection conn= this.getConnection();
            Statement stmt= conn.createStatement();
            ResultSet rs= stmt.executeQuery(sql)){
            while(rs.next()){
                Virus v= new Virus();
                v.setIdVirus(rs.getInt(1));
                v.setNombre(rs.getString(2));
                v.setIdVariante(rs.getInt(3));
                v.setVariante(rs.getString(4));
                v.setCasosEncontrados(rs.getInt(5));
                listaVirus.add(v);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error Mision 3");
        }
        return listaVirus;
    }

    public int cantVirusActivos(){
        int cantidadVirus = 0;
        String sql = "select count(*) from virus";
        try(Connection conn= this.getConnection();
            Statement stmt= conn.createStatement();
            ResultSet rs= stmt.executeQuery(sql)){
            if(rs.next()){
               cantidadVirus = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error Mision 3");
        }
        return cantidadVirus;
    }
    public ArrayList<Virus> listarVirus(){
        ArrayList<Virus> listaVirus = new ArrayList<>();
        String sql="select * from virus";
        try(Connection conn= this.getConnection();
            Statement stmt= conn.createStatement();
            ResultSet rs= stmt.executeQuery(sql)){
            while(rs.next()){
                Virus v= new Virus();
                v.setIdVirus(rs.getInt(1));
                v.setNombre(rs.getString(2));
                listaVirus.add(v);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error Mision 3");
        }
        return listaVirus;
    }

    public ArrayList<Virus> obtenerVariantesDeVirus(int idVirus) {
        ArrayList<Virus> listaVariantesDeVirus= new ArrayList<>();
        String sql="select * from variante where idVirus=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setInt(1,idVirus);

            try(ResultSet rs= pstmt.executeQuery()){
                while(rs.next()){
                    Virus v= new Virus();
                    v.setIdVariante(rs.getInt(1));
                    v.setVariante(rs.getString(2));
                    listaVariantesDeVirus.add(v);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return listaVariantesDeVirus;
    }

    public int obtenerIdVirusDeNombre (String nombreVirus){
        Integer idVirus = null;
        String sql="select * from virus where nombre like ?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1,nombreVirus);

            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    idVirus = rs.getInt(1);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return idVirus;
    }
    public void AgregarVirus(String nombreVirus){
        String sql="insert into virus (nombre) values (?)";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){

            pstmt.setString(1,nombreVirus);
            pstmt.executeUpdate();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void AgregarVariante(String nombreVariante, int idVirus){
        String sql="insert into variante (nombre,idVirus) values (?,?)";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){

            pstmt.setString(1,nombreVariante);
            pstmt.setInt(2,idVirus);

            pstmt.executeUpdate();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
