package pe.edu.pucp.lab9_red.daos;

import pe.edu.pucp.lab9_red.beans.*;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
                o.setVacuna(rs.getInt(4));
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
}
