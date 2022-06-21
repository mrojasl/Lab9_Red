package pe.edu.pucp.lab9_red.daos;

import pe.edu.pucp.lab9_red.beans.Humano;
import pe.edu.pucp.lab9_red.beans.Virus;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Mision3Dao extends BaseDao{

    public ArrayList<Virus> listarVirus(){
        ArrayList<Virus> listaVirus = new ArrayList<>();
        String sql="select va.idVirus,vi.nombre,va.idVariante,va.nombre,subq.cantidadPorVariante from variante va\n" +
                "inner join virus vi on va.idVirus=vi.idVirus inner join (select v.idVariante,count(*)\n" +
                "as 'cantidadPorVariante' from zombie z right join variante v on z.idVariante=v.idVariante\n" +
                "group by v.idVariante) subq on (va.idVariante=subq.idVariante)";
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

}
