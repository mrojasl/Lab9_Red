package pe.edu.pucp.lab9_red.daos;

import pe.edu.pucp.lab9_red.beans.TiposDeZombie;
import pe.edu.pucp.lab9_red.beans.Variante;
import pe.edu.pucp.lab9_red.beans.Virus;
import pe.edu.pucp.lab9_red.beans.Zombie;

import java.sql.*;
import java.util.ArrayList;

public class Mision4Dao extends BaseDao{
    public ArrayList<Zombie> listarZombie(){
        ArrayList<Zombie> lista= new ArrayList<>();
        String sql="select h.idHumanos, h.nombre, h.apellido,h.sexo, " +
                "       DATEDIFF(CURRENT_DATE(),fechaDeInfeccion)*24 as 'Tiempo infectado', " +
                "       v.nombre, z.numeroVictimas, t.nombre " +
                "       from humanos h " +
                "left join zombie z on h.idHumanos = z.idHumanos " +
                "left join variante v on z.idVariante = v.idVariante " +
                "inner join tiposdezombie t on z.idTipoZombie = t.idTiposDeZombie " +
                "where h.estadoZ=1 ";
        try(Connection conn= this.getConnection();
            Statement stmt= conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){
            while(rs.next()){
                Zombie zombie= new Zombie();
                zombie.setIdHumano(rs.getString(1));
                zombie.setNombre(rs.getString(2));
                zombie.setApellido(rs.getString(3));
                zombie.setSexo(rs.getString(4));
                zombie.setHorasInfectado(rs.getInt(5));
                Variante v= new Variante();
                v.setNombre(rs.getString(6));
                zombie.setVariante(v);
                zombie.setNumVictimas(rs.getInt(7));
                TiposDeZombie tz= new TiposDeZombie();
                tz.setNombre(rs.getString(8));
                zombie.setTz(tz);
                lista.add(zombie);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    public double[] estadisticasZombie(ArrayList<Zombie> zombies){
        double zHombres, zMujeres, zOtros, promVicZomb;
        int contH=0, contM=0, contVictimas=0;
        for(Zombie z: zombies){
            if(z.getSexo().equals("Masculino")){
                contH++;
            }else{
                if(z.getSexo().equals("Femenino")){
                    contM++;
                }
            }
            contVictimas+=z.getNumVictimas();
        }
        int totalZombies= zombies.size();
        zHombres= ((double)contH/totalZombies)*100;
        zMujeres= ((double)contM/totalZombies)*100;
        zOtros=100-(zHombres+zMujeres);
        promVicZomb=(double)contVictimas/totalZombies;
        double[] estadisticas={zHombres,zMujeres,zOtros,promVicZomb};
        return estadisticas;
    }
    public String varianteComun(){
        String sql="select v.nombre,count(*) from variante v " +
                "inner join zombie z on z.idVariante=v.idVariante " +
                "group by v.idVariante;";
        ArrayList<Variante> listavariantes= new ArrayList<>();
        try(Connection conn= this.getConnection();
            Statement stmt= conn.createStatement();
            ResultSet rs= stmt.executeQuery(sql);){
            while(rs.next()){
                Variante variante= new Variante();
                variante.setNombre(rs.getString(1));
                variante.setCasosEncontrados(rs.getInt(2));
                listavariantes.add(variante);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        int comparador=0;
        String almacena_Variante="";
        for(Variante v : listavariantes){
            if(v.getCasosEncontrados()>comparador){
                almacena_Variante=v.getNombre();
                comparador=v.getCasosEncontrados();
            }
        }
        return almacena_Variante;
    }
    public ArrayList<Variante> listaVariantes(){
        ArrayList<Variante> lista= new ArrayList<>();
        String sql="select * from variante";
        try(Connection conn= this.getConnection();
            Statement stmt= conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){
            while(rs.next()){
                Variante v= new Variante();
                v.setIdVariante(rs.getInt(1));
                v.setNombre(rs.getString(2));
                lista.add(v);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    public ArrayList<TiposDeZombie> listaTiposZombie(){
        ArrayList<TiposDeZombie> lista= new ArrayList<>();
        String sql="select * from tiposdezombie";
        try(Connection conn= this.getConnection();
            Statement stmt= conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)){
            while(rs.next()){
                TiposDeZombie tz= new TiposDeZombie();
                tz.setIdTipo(rs.getInt(1));
                tz.setNombre(rs.getString(2));
                lista.add(tz);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    public void anadirZombie(String nombre, String apellido, int idtz, int idvariante, String sexo){
        String id=generarIDHumano();
        anadirHumano(id,nombre,apellido,sexo,true);
        String sql="insert into zombie (fechaDeInfeccion, numeroVictimas,idTipoZombie, idVariante, idHumanos) VALUES (CURRENT_DATE,0,?,?,?);";
        try(Connection con=this.getConnection();
            PreparedStatement pstmt=con.prepareStatement(sql);){
            pstmt.setInt(1,idtz);
            pstmt.setInt(2,idvariante);
            pstmt.setString(3,id);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public String generarIDHumano(){
        String codigo="";
        String[] letters = {"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"};
        for (int i = 0; i < 11; i++ ) {
            codigo += letters[(int) Math.round(Math.random() * 15)];
        }
        return codigo;
    }
    public void anadirHumano(String id,String nombre,String apellido,String sexo,boolean estadoZombie){
        String sql= "insert into humanos (idHumanos, nombre, apellido, sexo, estadoZ) values (?,?,?,?,?)";
        try(Connection conn = this.getConnection();
            PreparedStatement pstmt=conn.prepareStatement(sql)){
            pstmt.setString(1,id);
            pstmt.setString(2,nombre);
            pstmt.setString(3,apellido);
            pstmt.setString(4, sexo);
            if(estadoZombie==true){
                pstmt.setInt(5,1);
            }else{
                pstmt.setInt(5,0);
            }
            pstmt.executeUpdate();
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }
}
