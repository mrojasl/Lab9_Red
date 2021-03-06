package pe.edu.pucp.lab9_red.daos;

import org.w3c.dom.ls.LSOutput;
import pe.edu.pucp.lab9_red.beans.Humano;
import pe.edu.pucp.lab9_red.beans.Objeto;
import pe.edu.pucp.lab9_red.beans.Superviviente;

import java.sql.*;
import java.util.ArrayList;

public class Mision2Dao extends BaseDao{
    public void eliminarObjetoSuperviviente(String idSuper, int idObjeto){
        String sql="delete from inventario where idHumanos=? and idObjetos=?";
        try(Connection con= this.getConnection();
            PreparedStatement pstmt= con.prepareStatement(sql)){
            pstmt.setString(1,idSuper);
            pstmt.setInt(2,idObjeto);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            System.out.println("No se eliminĂ³ el objeto en el inventario eliminarObjetoSuperviviente");
            e.printStackTrace();
        }
    }

    public boolean anadirObjetoSuperviviente(String idsuper, int idObjeto, double pesoObjeto, int cantidadAumentar){
        boolean exitoso=false;
        double pesoCargado= hallar_PesoCargado(idsuper);
        Superviviente  sp= obtenerSuperporID(idsuper);
        double f_Pesototal= (pesoCargado+pesoObjeto)*9.8;
        if(sp.getFuerza()>=f_Pesototal){
            if(!existeObjetoInventSuper(idsuper, idObjeto)){
                crearObjetoSuperInventario(idsuper, idObjeto);
            }
            aumentarCantidadObjetoInventario(idsuper,idObjeto,cantidadAumentar);
            exitoso=true;
        }
        return exitoso;
    }
    public void crearObjetoSuperInventario(String idsuper, int idObjeto){
        String sql="insert into inventario (idHumanos, idObjetos, cantidad) values(?,?,0);";
        try(Connection con= this.getConnection();
            PreparedStatement pstmt= con.prepareStatement(sql)){
            pstmt.setString(1,idsuper);
            pstmt.setInt(2,idObjeto);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            System.out.println("No se creo el objeto en el inventario crearObjetoSuperInventario");
            e.printStackTrace();
        }
    }
    public void aumentarCantidadObjetoInventario(String idsuper,int idObjeto,int cantidadAumentar){
        int cantObjeto=obtenerCantidadObjetoInventSuper(idsuper, idObjeto);
        String sql="update inventario set cantidad=? where idHumanos=? and idObjetos=?;";
        try(Connection con= this.getConnection();
            PreparedStatement pstmt= con.prepareStatement(sql)){
            pstmt.setInt(1,cantObjeto+cantidadAumentar);
            pstmt.setString(2,idsuper);
            pstmt.setInt(3,idObjeto);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public int obtenerCantidadObjetoInventSuper(String idsuper, int idObjeto){
        int cantidad=0;
        String sql="select * from inventario where idHumanos=? and idObjetos=?;";
        try(Connection con= this.getConnection();
            PreparedStatement pstmt= con.prepareStatement(sql)){
            pstmt.setString(1,idsuper);
            pstmt.setInt(2,idObjeto);
            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    cantidad=rs.getInt(3);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return cantidad;
    }
    public boolean existeObjetoInventSuper(String idsuper, int idObjeto){
        boolean existe= false;
        String sql="select * from inventario where idHumanos=? and idObjetos=?;";
        try(Connection con= this.getConnection();
            PreparedStatement pstmt= con.prepareStatement(sql)){
            pstmt.setString(1,idsuper);
            pstmt.setInt(2,idObjeto);
            try(ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    existe=true;
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return existe;
    }

    public ArrayList<Objeto> listarInventario(String id){
        ArrayList<Objeto> inventario= new ArrayList<>();
        String sql="select i.cantidad, o.nombre, o.masa, o.vacuna,o.idObjetos from superviviente s " +
                "inner join inventario i on s.idHumanos = i.idHumanos " +
                "inner join objetos o on i.idObjetos = o.idObjetos " +
                "where s.idHumanos=?";
        try(Connection con= this.getConnection();
            PreparedStatement pstmt= con.prepareStatement(sql)){
            pstmt.setString(1,id);
            try(ResultSet rs= pstmt.executeQuery()){
                while(rs.next()){
                    Objeto objeto= new Objeto();
                    objeto.setCantidad(rs.getInt(1));
                    objeto.setNombre(rs.getString(2));
                    objeto.setMasa(rs.getDouble(3));
                    if(rs.getInt(4)==0){
                        objeto.setVacuna(false);
                    }else{
                        objeto.setVacuna(true);
                    }
                    objeto.setIdObjeto(rs.getInt(5));
                    inventario.add(objeto);
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return inventario;
    }
    public ArrayList<Objeto> listarObjetosDisponibles(){
        ArrayList<Objeto> objetos= new ArrayList<>();
        String sql="select * from objetos";
        try(Connection con= this.getConnection();
            Statement stmt= con.createStatement();
            ResultSet rs=stmt.executeQuery(sql)){
            while(rs.next()){
                Objeto o= new Objeto();
                o.setIdObjeto(rs.getInt(1));
                o.setNombre(rs.getString(2));
                o.setMasa(rs.getDouble(3));
                if(rs.getInt(4)==1){
                    o.setVacuna(true);
                }else{
                    o.setVacuna(false);
                }
                objetos.add(o);
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return objetos;
    }
    public Superviviente obtenerSuperporID(String id){
        Superviviente sp=null;
        String sql="select h.idHumanos,concat(h.nombre, ' ', h.apellido), s.fuerza from humanos h " +
                "inner join superviviente s on h.idHumanos = s.idHumanos where h.idHumanos=?";
        try(Connection con= this.getConnection();
            PreparedStatement pstmt= con.prepareStatement(sql);){
            pstmt.setString(1,id);
            try(ResultSet rs=pstmt.executeQuery()){
                if(rs.next()){
                    sp=new Superviviente();
                    sp.setIdHumano(rs.getString(1));
                    sp.setNombre(rs.getString(2));
                    sp.setFuerza(rs.getDouble(3));
                }
            }
        }catch (SQLException e) {
            e.printStackTrace();
        }
        return sp;
    }

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
        String sql="select i.cantidad, o.masa from superviviente s " +
                "                left join inventario i on i.idHumanos= s.idHumanos " +
                "                left join objetos o on o.idObjetos=i.idObjetos " +
                "                   where s.idHumanos= ?";
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
            //Se desea actualizar una relaciĂ³n con una persona
            sql= "update superviviente set peso=?, fuerza=?, idPareja=? where idHumanos=?";
            String parejaDePareja=obtenerIdPareja(idPareja);
            if(parejaDePareja==null){
                parejaDePareja="";
            }
            if(!parejaDePareja.equals(id)){
                //Si la relaciĂ³n no serĂ¡ con la misma persona, la otra persona se le asigna null en su idPareja
                sql2= "update superviviente set idPareja=null where idHumanos=?";
                try(Connection conn= this.getConnection();
                    PreparedStatement pstmt= conn.prepareStatement(sql2);){
                    pstmt.setString(1,obtenerIdPareja(id));
                    pstmt.executeUpdate();
                }catch (SQLException e) {
                    e.printStackTrace();
                }
                //Asignamos la nueva relaciĂ³n
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
                //Si tenĂ­a una relaciĂ³n anteriormente, entonces debo terminar la relaciĂ³n (idPareja de la otra persona==null)
                convertirASoltero(obtenerIdPareja(id));
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

    public void anadirSuperviviente(String nombre, String apellido, String sexo,double fuerza,double peso, String idpareja){
        String id= generarIDHumano();
        anadirHumano(id,nombre,apellido,sexo,false);
        String sql, sql2;
        if(!idpareja.equals("Soltero")){
            sql= "insert into superviviente (idHumanos, peso, fuerza, idPareja) VALUES (?,?,?,?);";
            try(Connection conn= this.getConnection();
                PreparedStatement pstmt= conn.prepareStatement(sql);){
                pstmt.setString(1, id);
                pstmt.setDouble(2,peso);
                pstmt.setDouble(3,fuerza);
                if(!idpareja.equals("Soltero")){
                    pstmt.setString(4,idpareja);
                }
                pstmt.executeUpdate();
            }catch (SQLException e) {
                e.printStackTrace();
            }

            //Asignamos la nueva relaciĂ³n
            sql2= "update superviviente set idPareja=? where idHumanos=?";
            try(Connection conn= this.getConnection();
                PreparedStatement pstmt= conn.prepareStatement(sql2);){
                pstmt.setString(1,id);
                pstmt.setString(2,idpareja);
                pstmt.executeUpdate();
            }catch (SQLException e) {
                e.printStackTrace();
            }
        }else{
            sql="insert into superviviente (idHumanos, peso, fuerza) VALUES (?,?,?);";
            try(Connection conn= this.getConnection();
                PreparedStatement pstmt= conn.prepareStatement(sql);){
                pstmt.setString(1, id);
                pstmt.setDouble(2,peso);
                pstmt.setDouble(3,fuerza);
                if(!idpareja.equals("Soltero")){
                    pstmt.setString(4,idpareja);
                }
                pstmt.executeUpdate();
            }catch (SQLException e) {
                e.printStackTrace();
            }
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

    public void eliminarSuper(String id){
        eliminarInventario(id);
        if(obtenerIdPareja(id)!=null){
            convertirASoltero(obtenerIdPareja(id));
        }
        String sql="delete from superviviente where idHumanos=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
        eliminarHumano(id);
    }
    public void eliminarHumano(String id){
        String sql="delete from humanos where idHumanos=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1,id);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public void eliminarInventario(String id){
        String sql= "delete from inventario where idHumanos=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1, id);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void convertirASoltero(String id){
        String sql= "update superviviente set idPareja=null where idHumanos=?";
        try(Connection conn= this.getConnection();
            PreparedStatement pstmt= conn.prepareStatement(sql);){
            pstmt.setString(1,id);
            pstmt.executeUpdate();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
