package pe.edu.pucp.lab9_red.daos;

import pe.edu.pucp.lab9_red.beans.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Mision6Dao extends BaseDao{
    //Podemos reutilizar metodos de otras misiones, puesto que no se
    //afirma que debamos utilizar un dao dedicado solo para esta mision6

    public boolean ataque(String idZombie, String idSuper){
        boolean gana_humano=false;
        int idTipoZombie= encontrarTipoZombie(idZombie);
        Efectividad vacunaEfct=vacunaMasEfectiva(idSuper, idTipoZombie);
        if(vacunaEfct.getObjeto().getIdObjeto()!=0){
            double valorAleatorio = Math.random()*(100);//Generamos numero aleatorio
            if(valorAleatorio<vacunaEfct.getPorcentaje()){
                //Si caemos dentro de valores de efectividad, entonces el humano gana
                gana_humano=true;
            }
        }
        return gana_humano;
    }
    public int encontrarTipoZombie(String idZ){
        int idTZ=0;
        String sql="select t.idTiposDeZombie, t.nombre from zombie z " +
                "inner join tiposdezombie t on z.idTipoZombie = t.idTiposDeZombie " +
                "where z.idHumanos=?;";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1,idZ);
            try(ResultSet rs= pstmt.executeQuery()){
                rs.next();
                idTZ= rs.getInt(1);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return idTZ;
    }
    public Efectividad vacunaMasEfectiva(String idSuper, int idTipoZombie){
        Efectividad vacuna= new Efectividad();
        Objeto objeto= new Objeto();
        objeto.setIdObjeto(0);
        vacuna.setObjeto(objeto);
        String sql="select o.idObjetos,o.nombre, e.porcentaje, t.nombre, i.cantidad from superviviente s " +
                "left join inventario i on s.idHumanos = i.idHumanos " +
                "left join objetos o on i.idObjetos = o.idObjetos " +
                "left join efectividad e on o.idObjetos = e.idObjetos " +
                "left join tiposdezombie t on e.idTiposDeZombie = t.idTiposDeZombie " +
                "where s.idHumanos = ? and t.idTiposDeZombie=? and o.vacuna=1;";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1,idSuper);
            pstmt.setInt(2,idTipoZombie);
            try(ResultSet rs= pstmt.executeQuery()){
                int contador=0;
                while(rs.next()){
                    if(contador==0){
                        objeto.setIdObjeto(rs.getInt(1));
                        objeto.setNombre(rs.getString(2));
                        vacuna.setObjeto(objeto);
                        vacuna.setPorcentaje(rs.getDouble(3));
                    }else{
                        if(vacuna.getPorcentaje()<rs.getDouble(3)){
                            vacuna.setPorcentaje(rs.getDouble(3));
                            objeto.setIdObjeto(rs.getInt(1));
                            objeto.setNombre(rs.getString(2));
                            vacuna.setObjeto(objeto);
                        }
                    }
                    contador++;
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return vacuna;
    }

    public void zombieGana(String idZ, String idS){
        Zombie zombie= (Zombie) obtenerHumanoporID(idZ);
        Superviviente sp= (Superviviente) obtenerHumanoporID(idS);
        Mision2Dao mision2Dao=new Mision2Dao();
        //Obtenemos pareja
        String idPareja=mision2Dao.obtenerIdPareja(sp.getIdHumano());
        if(idPareja!=null){
            Superviviente pareja=(Superviviente) obtenerHumanoporID(idPareja);
            convertirSuperAZombie(pareja,zombie.getVariante().getIdVariante(),zombie.getTz().getIdTipo());
            zombieAumentaVictimas(zombie,2); //Aumentamos en dos
        }else{
            zombieAumentaVictimas(zombie,1); //Aumentamos en uno
        }
        convertirSuperAZombie(sp,zombie.getVariante().getIdVariante(),zombie.getTz().getIdTipo());
    }
    public void superGana(String idZ, String idS){
        Zombie zombie= (Zombie) obtenerHumanoporID(idZ);
        convertirZombieASuper(zombie);

        Superviviente sp= (Superviviente) obtenerHumanoporID(idS);
        int idTipoZombie= encontrarTipoZombie(idZ);
        Efectividad vacunaEfct=vacunaMasEfectiva(idS, idTipoZombie);
        Mision2Dao mision2Dao = new Mision2Dao();
        //Reutilizamos funcion
        mision2Dao.anadirObjetoSuperviviente(idS,vacunaEfct.getObjeto().getIdObjeto(),0, -1);
        int cant_Vacunas=mision2Dao.obtenerCantidadObjetoInventSuper(idS,vacunaEfct.getObjeto().getIdObjeto());
        if(cant_Vacunas==0){
            mision2Dao.eliminarObjetoSuperviviente(idS,vacunaEfct.getObjeto().getIdObjeto());
        }
    }

    public void convertirZombieASuper(Zombie z){
        Mision2Dao mision2Dao = new Mision2Dao();
        eliminarZombie(z);
        double fuerza=10*z.getNumVictimas();
        mision2Dao.anadirSuperviviente(z.getNombre(),z.getApellido(),z.getSexo(),fuerza,fuerza*2, "Soltero");
    }
    public void eliminarZombie(Zombie z){
        String sql="delete from zombie where idHumanos=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setString(1,z.getIdHumano());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Mision2Dao mision2Dao= new Mision2Dao();
        mision2Dao.eliminarHumano(z.getIdHumano());
    }
    public void convertirSuperAZombie(Superviviente sp, int variante, int tipoZombie){
        Mision4Dao mision4Dao= new Mision4Dao();
        mision4Dao.anadirZombie(sp.getNombre(), sp.getApellido(), tipoZombie, variante,sp.getSexo());
        Mision2Dao mision2Dao= new Mision2Dao();
        mision2Dao.eliminarSuper(sp.getIdHumano());
    }
    public void zombieAumentaVictimas(Zombie z, int victimasNuevas){
        int cantVictimas= z.getNumVictimas();
        String sql="update zombie set numeroVictimas= ? where zombie.idHumanos=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setInt(1,cantVictimas+victimasNuevas);
            pstmt.setString(2,z.getIdHumano());
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public Humano obtenerHumanoporID(String id){
        Humano humano=new Humano();
        String sql="select * from humanos h " +
                "                left join zombie z on h.idHumanos = z.idHumanos where h.idHumanos=?";
        try(Connection con= this.getConnection();
            PreparedStatement pstmt= con.prepareStatement(sql);){
            pstmt.setString(1,id);
            try(ResultSet rs=pstmt.executeQuery()){
                if(rs.next()){
                    if(rs.getInt(5)==0){
                        //Es humano
                        Superviviente sp=new Superviviente();
                        sp.setIdHumano(rs.getString(1));
                        sp.setNombre(rs.getString(2));
                        sp.setApellido(rs.getString(3));
                        sp.setSexo(rs.getString(4));
                        humano=sp;
                    }else{
                        //Es zombie
                        Zombie zombie= new Zombie();
                        zombie.setIdHumano(rs.getString(1));
                        zombie.setNombre(rs.getString(2));
                        zombie.setApellido(rs.getString(3));
                        zombie.setSexo(rs.getString(4));
                        zombie.setNumVictimas(rs.getInt(7));
                        TiposDeZombie tz= new TiposDeZombie();
                        tz.setIdTipo(rs.getInt(8));
                        zombie.setTz(tz);
                        Variante variante= new Variante();
                        variante.setIdVariante(rs.getInt(9));
                        zombie.setVariante(variante);
                        humano=zombie;
                    }
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return humano;
    }
}
