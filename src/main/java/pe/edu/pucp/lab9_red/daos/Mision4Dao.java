package pe.edu.pucp.lab9_red.daos;

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
                zombie.setNombreVariante(rs.getString(6));
                zombie.setNumVictimas(rs.getInt(7));
                zombie.setTipoZombie(rs.getString(8));
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
        ArrayList<Virus> listavariantes= new ArrayList<>();
        try(Connection conn= this.getConnection();
            Statement stmt= conn.createStatement();
            ResultSet rs= stmt.executeQuery(sql);){
            while(rs.next()){
                Virus variante= new Virus();
                variante.setVariante(rs.getString(1));
                variante.setCasosEncontrados(rs.getInt(2));
                listavariantes.add(variante);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        int comparador=0;
        String almacena_Variante="";
        for(Virus v : listavariantes){
            if(v.getCasosEncontrados()>comparador){
                almacena_Variante=v.getVariante();
                comparador=v.getCasosEncontrados();
            }
        }
        return almacena_Variante;
    }
}
