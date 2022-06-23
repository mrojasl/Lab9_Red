package pe.edu.pucp.lab9_red.daos;

import pe.edu.pucp.lab9_red.beans.*;

import java.sql.*;
import java.util.ArrayList;

public class Mision5Dao extends BaseDao{
    public ArrayList<Objeto> listarObjetos(){
        ArrayList<Objeto> listaObjetos = new ArrayList<>();
        String sql="select * from Objetos";
        try(Connection conn= this.getConnection();
            Statement stmt= conn.createStatement();
            ResultSet rs= stmt.executeQuery(sql)){
            while(rs.next()){
                Objeto o= new Objeto();
                o.setIdObjeto(rs.getInt(1));
                o.setNombre(rs.getString(2));
                o.setMasa(rs.getDouble(3));
                if(rs.getInt(4)==0){
                    o.setVacuna(false);
                }else{
                    o.setVacuna(true);
                }
                listaObjetos.add(o);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error Mision 3");
        }
        return listaObjetos;
    }

    public ArrayList<Efectividad> listarEfectividad(){
        ArrayList<Efectividad> listaEfectividad = new ArrayList<>();

        String sql="select z.idTiposDeZombie,z.nombre,o.idObjetos,o.nombre,e.porcentaje\n" +
                "from Efectividad e right join Objetos o\n" +
                "on o.idObjetos=e.idObjetos\n" +
                "left join tiposdezombie z on z.idtiposdezombie=e.idtiposdezombie\n" +
                "where o.vacuna=1";
        try(Connection conn= this.getConnection();
            Statement stmt= conn.createStatement();
            ResultSet rs= stmt.executeQuery(sql)){
            while(rs.next()){
                Efectividad e= new Efectividad();
                Objeto o = new Objeto();
                TiposDeZombie z = new TiposDeZombie();
                z.setIdTipo(rs.getInt(1));
                z.setNombre(rs.getString(2));
                o.setIdObjeto(rs.getInt(3));
                o.setNombre(rs.getString(4));
                e.setPorcentaje(rs.getDouble(5));
                e.setTipoDeZombie(z);
                e.setObjeto(o);
                listaEfectividad.add(e);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error Mision 3");
        }
        return listaEfectividad;
    }
    public ArrayList<Objeto> listarObjetosNoUsados(){
            ArrayList<Objeto> listaObjetos = new ArrayList<>();
            String sql="select o.idObjetos,o.nombre,o.masa,o.vacuna\n" +
                    "from objetos o left join inventario i on o.idObjetos=i.idObjetos\n" +
                    "where i.cantidad is null";
            try(Connection conn= this.getConnection();
                Statement stmt= conn.createStatement();
                ResultSet rs= stmt.executeQuery(sql)){
                while(rs.next()){
                    Objeto o= new Objeto();
                    o.setIdObjeto(rs.getInt(1));
                    o.setNombre(rs.getString(2));
                    o.setMasa(rs.getDouble(3));
                    if(rs.getInt(4)==0){
                        o.setVacuna(false);
                    }else{
                        o.setVacuna(true);
                    }
                    listaObjetos.add(o);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Error Mision 3");
            }
            return listaObjetos;
    }
    public void actualizarPorcentaje(double porcentaje, int idObjeto,int idTipoZombie){
        String sql= "update efectividad set\n" +
                "porcentaje = ? where idTiposDeZombie = ? and idObjetos = ?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){

            pstmt.setDouble(1,porcentaje);
            pstmt.setInt(2,idTipoZombie);
            pstmt.setInt(3,idObjeto);

            pstmt.executeUpdate();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int obtenerIdTipoZombieDeNombre(String nombre){
        int idTipoZombie=1;
        String sql="select idTiposDeZombie from TiposDeZombie where nombre = ?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1,nombre);

            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    idTipoZombie = rs.getInt(1);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return idTipoZombie;

    }
    public void agregarObjetoNormal(String nombre, double peso){
        String sql="insert into Objetos (nombre,masa,vacuna) values (?,?,0)";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){

            pstmt.setString(1,nombre);
            pstmt.setDouble(2,peso);

            pstmt.executeUpdate();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void agregarObjetoVacuna(String nombre, double peso){
        String sql="insert into Objetos (nombre,masa,vacuna) values (?,?,1)";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){

            pstmt.setString(1,nombre);
            pstmt.setDouble(2,peso);

            pstmt.executeUpdate();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int obtenerIdObjetoDeNombre(String nombre){
        int idObjeto=1;
        String sql="select idObjetos from Objetos where nombre=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1,nombre);

            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    idObjeto = rs.getInt(1);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return idObjeto;
    }
    public void insertarEfectividad(int idZombie, int idObjeto, double porcentaje){
        String sql="insert into efectividad (idTiposDeZombie,idObjetos,porcentaje) values\n" +
                "(?,?,?)";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){

            pstmt.setInt(1,idZombie);
            pstmt.setInt(2,idObjeto);
            pstmt.setDouble(3,porcentaje);

            pstmt.executeUpdate();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void actualizarPeso (double peso, int idObjeto){
        String sql="update objetos set masa=? where idObjetos=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){

            pstmt.setDouble(1,peso);
            pstmt.setInt(2,idObjeto);

            pstmt.executeUpdate();

        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
