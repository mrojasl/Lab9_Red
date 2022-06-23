package pe.edu.pucp.lab9_red.servlets;

import pe.edu.pucp.lab9_red.beans.*;
import pe.edu.pucp.lab9_red.daos.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.sql.DriverManager;
import java.util.ArrayList;

@WebServlet(name = "Apocalipsis", urlPatterns = {"","/Apocalipsis"})
public class ApocalipsisServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action")==null ? "listar": request.getParameter("action");
        Mision1Dao mision1Dao= new Mision1Dao();
        Mision2Dao mision2Dao= new Mision2Dao();
        String mostrarStr= request.getParameter("mostrar");
        String exitosoStr= request.getParameter("exitoso");
        Mision3Dao mision3Dao= new Mision3Dao();
        Mision4Dao mision4Dao= new Mision4Dao();
        Mision5Dao mision5Dao= new Mision5Dao();
        RequestDispatcher requestDispatcher;
        switch (action){
            case "listar":
                request.setAttribute("listaHumanos",mision1Dao.listarHumanos());
                requestDispatcher= request.getRequestDispatcher("menuHumanos.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "Supervivientes":
                request.setAttribute("parejas", mision2Dao.listarSuperviviente(""));
                request.setAttribute("filtroSuper","");
                request.setAttribute("listaSuper", mision2Dao.listarSuperviviente(""));
                requestDispatcher = request.getRequestDispatcher("menuSupervivientes.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "Virus":
                request.setAttribute("listaVariantes", mision3Dao.listarVariantes());
                request.setAttribute("cantidadVirus",mision3Dao.cantVirusActivos());
                requestDispatcher=request.getRequestDispatcher("menuVirus.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "ErradicarVariante":
                int idVariante = Integer.parseInt(request.getParameter("idVariante"));
                mision3Dao.EliminarZombiesDeVariante(idVariante);
                int idVirus = Integer.parseInt(request.getParameter("idVirus"));
                mision3Dao.EliminarVariante(idVariante);
                ArrayList<Variante> listaVariantes =  mision3Dao.obtenerVariantesDeVirus(idVirus);
                if (listaVariantes.size()==0){
                    mision3Dao.EliminarVirus(idVirus);
                }
                response.sendRedirect(request.getContextPath() + "/?action=Virus");
                break;
            case "Objetos":
                request.setAttribute("listaObjetos",mision5Dao.listarObjetos());
                request.setAttribute("listaEfectividad",mision5Dao.listarEfectividad());
                request.setAttribute("listaObjetosNoUsados",mision5Dao.listarObjetosNoUsados());
                requestDispatcher=request.getRequestDispatcher("menuObjetos.jsp");
                requestDispatcher.forward(request,response);

                break;
            case "Zombies":
                ArrayList<Zombie> zombies= mision4Dao.listarZombie();
                double[] estadisticas= mision4Dao.estadisticasZombie(zombies);
                request.setAttribute("zombies", zombies);
                request.setAttribute("porcH", estadisticas[0]);
                request.setAttribute("porcM", estadisticas[1]);
                request.setAttribute("porcO", estadisticas[2]);
                request.setAttribute("proVict", estadisticas[3]);
                request.setAttribute("varianteComun", mision4Dao.varianteComun());
                request.setAttribute("listaVariantes", mision4Dao.listaVariantes());
                request.setAttribute("tiposZombie", mision4Dao.listaTiposZombie());
                requestDispatcher=request.getRequestDispatcher("menuZombies.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "verInventario":
                String idSuper= request.getParameter("idSuper");
                Superviviente sp= mision2Dao.obtenerSuperporID(idSuper);
                try{
                    boolean mostrar=Boolean.parseBoolean(mostrarStr);
                    boolean exitoso= Boolean.parseBoolean(exitosoStr);
                    request.setAttribute("mostrar", mostrar);
                    request.setAttribute("exitoso",exitoso);
                }catch (NumberFormatException e){
                    request.setAttribute("mostrar", false);
                    request.setAttribute("exitoso",false);
                }
                request.setAttribute("superviviente", sp);
                request.setAttribute("inventario", mision2Dao.listarInventario(idSuper));
                request.setAttribute("objetosDisponibles", mision2Dao.listarObjetosDisponibles());
                requestDispatcher= request.getRequestDispatcher("menuInventario.jsp");
                requestDispatcher.forward(request,response);
                break;
            case "Caceria":
                try{
                    boolean mostrar=Boolean.parseBoolean(mostrarStr);
                    boolean exitoso= Boolean.parseBoolean(exitosoStr);
                    request.setAttribute("mostrar", mostrar);
                    request.setAttribute("exitoso",exitoso);
                }catch (NumberFormatException e){
                    request.setAttribute("mostrar", false);
                    request.setAttribute("exitoso",false);
                }
                request.setAttribute("listaSupervivientes",mision2Dao.listarSuperviviente(""));
                request.setAttribute("listaZombies", mision4Dao.listarZombie());
                requestDispatcher= request.getRequestDispatcher("menuCaceria.jsp");
                requestDispatcher.forward(request,response);
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action")==null? "redireccionar" : request.getParameter("action");
        Mision2Dao mision2Dao= new Mision2Dao();
        Mision3Dao mision3Dao= new Mision3Dao();
        Mision4Dao mision4Dao= new Mision4Dao();
        Mision5Dao mision5Dao= new Mision5Dao();
        Mision6Dao mision6Dao= new Mision6Dao();
        boolean exitoso;
        String filtro;
        RequestDispatcher view;
        //Opcion actualizarSuper o añadirSuperviviente
        String nombre= request.getParameter("nombre");//añaSupe
        String peso0= request.getParameter("peso");//añaSupe
        String fuerza0= request.getParameter("fuerza");//añaSupe
        String idpareja= request.getParameter("idpareja");//añaSupe
        String idSuper= request.getParameter("idSuper");//AtacarHumano

        //Opcion añadirSuperviviente
        String apellido= request.getParameter("napellido");
        String sexo= request.getParameter("sexo");

        //Opcion añadirZombie
        String idtz= request.getParameter("idtipozombie");
        String idvariante= request.getParameter("idvariante");

        //Opcion añadirOjeto
        String idObjeto= request.getParameter("idObjeto");
        String pesoObjeto= request.getParameter("pesoObjeto");

        //Opcion AtacarHumano
        String idZombie= request.getParameter("idZombie");
        switch (action){
            case "anadirsuperviviente":
                try{
                    double peso= Double.parseDouble(peso0);
                    double fuerza= Double.parseDouble(fuerza0);
                    mision2Dao.anadirSuperviviente(nombre, apellido, sexo, fuerza, peso, idpareja);
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir dato ApocalipsisServlet |Post: anadirsuperviviente");
                }
                filtro= request.getParameter("filtroSuper");
                request.setAttribute("filtroSuper",filtro);
                request.setAttribute("parejas", mision2Dao.listarSuperviviente(""));
                request.setAttribute("listaSuper", mision2Dao.listarSuperviviente(filtro));
                view = request.getRequestDispatcher("menuSupervivientes.jsp");
                view.forward(request,response);
                break;
            case "filtrarSuper":
                filtro= request.getParameter("filtroSuper");
                request.setAttribute("listaSuper", mision2Dao.listarSuperviviente(filtro));
                request.setAttribute("filtroSuper", filtro);
                request.setAttribute("parejas", mision2Dao.listarSuperviviente(""));
                view= request.getRequestDispatcher("menuSupervivientes.jsp");
                view.forward(request,response);
                break;
            case "actualizarSuper":
                try{
                    double peso= Double.parseDouble(peso0);
                    double fuerza= Double.parseDouble(fuerza0);
                    String parejaDisponible=mision2Dao.obtenerIdPareja(idpareja);
                    if(parejaDisponible!=null){
                        if(parejaDisponible.equals(idSuper)){
                            mision2Dao.actualizarHumano(nombre, idpareja, idSuper, fuerza, peso);
                        }else{
                            //Debemos hacer una advertencia
                            System.out.println("La pareja no esta disponible");
                        }
                    }else{
                        mision2Dao.actualizarHumano(nombre, idpareja, idSuper, fuerza, peso);
                    }
                }catch (NumberFormatException e){
                    System.out.println("Error al convertir dato ApocalipsisServlet |Post: ActualizarSuper");
                }
                filtro= request.getParameter("filtroSuper");
                request.setAttribute("filtroSuper",filtro);
                request.setAttribute("parejas", mision2Dao.listarSuperviviente(""));
                request.setAttribute("listaSuper", mision2Dao.listarSuperviviente(filtro));
                view = request.getRequestDispatcher("menuSupervivientes.jsp");
                view.forward(request,response);
                break;

            case "AgregarVariante":
                String nombreVirus = request.getParameter("nvirus").replaceAll(" ", "");
                String nombreVariante = request.getParameter("nvariante").replaceAll(" ", "");
                ArrayList<Virus> listaVirus = mision3Dao.listarVirus();
                try{
                    int idSacado = mision3Dao.obtenerIdVirusDeNombre(nombreVirus);
                    ArrayList<Variante> variantesDeIdSacado = mision3Dao.obtenerVariantesDeVirus(idSacado);
                    int centinela = 0;
                    for (Variante variante : variantesDeIdSacado){
                        if (variante.getNombre().equalsIgnoreCase(nombreVariante)) {
                            centinela++;
                        }
                    }
                    if (centinela==0){
                        mision3Dao.AgregarVariante(nombreVariante,idSacado);
                    }
                }catch (NullPointerException e){
                    System.out.println("Virus no encontrado, creando Virus");
                    mision3Dao.AgregarVirus(nombreVirus);
                    int idVirusNuevo = mision3Dao.obtenerIdVirusDeNombre(nombreVirus);
                    mision3Dao.AgregarVariante(nombreVariante,idVirusNuevo);
                }
                response.sendRedirect(request.getContextPath() + "/?action=Virus");
                break;
            case "eliminar":
                mision2Dao.eliminarSuper(idSuper);
                filtro= request.getParameter("filtroSuper");
                request.setAttribute("filtroSuper",filtro);
                request.setAttribute("parejas", mision2Dao.listarSuperviviente(""));
                request.setAttribute("listaSuper", mision2Dao.listarSuperviviente(filtro));
                view = request.getRequestDispatcher("menuSupervivientes.jsp");
                view.forward(request,response);
                break;
            case "anadeZombie":
                try{
                    int idTipoZ=Integer.parseInt(idtz);
                    int idva= Integer.parseInt(idvariante);
                    mision4Dao.anadirZombie(nombre,apellido,idTipoZ,idva,sexo);
                }catch (NumberFormatException e){
                    System.out.println("Error de conversion de dato POST | anadeZombie");
                }
                response.sendRedirect(request.getContextPath()+"/?action=Zombies");
                break;
            case "anadeObjetoInventario":
                exitoso=false;
                try{
                    int idO= Integer.parseInt(idObjeto);
                    double peso= Double.parseDouble(pesoObjeto);
                    exitoso=mision2Dao.anadirObjetoSuperviviente(idSuper,idO,peso,1);
                }catch (NumberFormatException e){
                    System.out.println("Error POST | anadeObjetoInventario convertir dato");
                }
                response.sendRedirect(request.getContextPath()+"/?action=verInventario&idSuper="+idSuper+"&exitoso="+exitoso+"&mostrar=true");
                break;
            case "eliminarObjetoInventario":
                try{
                    int idO= Integer.parseInt(idObjeto);
                    mision2Dao.eliminarObjetoSuperviviente(idSuper,idO);
                }catch (NumberFormatException e){
                    System.out.println("Error POST | eliminarObjetoInventario convertir dato");
                }
                response.sendRedirect(request.getContextPath()+"/?action=verInventario&idSuper="+idSuper);
                break;
            case "actualizarEfectividad":
                double vDemoledor = Double.parseDouble(request.getParameter("vDemoledor"));
                double vRapido = Double.parseDouble(request.getParameter("vRapido"));
                double vNino = Double.parseDouble(request.getParameter("vNino"));
                double vNormal = Double.parseDouble(request.getParameter("vNormal"));
                double vOtro = Double.parseDouble(request.getParameter("vOtro"));
                int idObjeto2 = Integer.parseInt(request.getParameter("idObjeto"));
                mision5Dao.actualizarPorcentaje(vDemoledor,idObjeto2,1);
                mision5Dao.actualizarPorcentaje(vRapido,idObjeto2,2);
                mision5Dao.actualizarPorcentaje(vNino,idObjeto2,3);
                mision5Dao.actualizarPorcentaje(vNormal,idObjeto2,4);
                mision5Dao.actualizarPorcentaje(vOtro,idObjeto2,5);
                response.sendRedirect(request.getContextPath()+"/?action=Objetos");
                break;
            case "agregarObjetoComun":
                ArrayList<Objeto> listaObjetos = mision5Dao.listarObjetos();
                String nombreObjeto = request.getParameter("nObjeto");
                double pesoObjeto2 = Double.parseDouble(request.getParameter("nPesoObjeto"));
                String nombreObjetoSE = nombreObjeto.replaceAll(" ", "");

                int ward=0;
                for (Objeto obj : listaObjetos){
                    if (nombreObjetoSE.equalsIgnoreCase(obj.getNombre().replaceAll(" ",""))){
                        ward++;
                        System.out.println("El objeto ya existe");
                    }
                }
                if (ward==0){
                    mision5Dao.agregarObjetoNormal(nombreObjeto,pesoObjeto2);
                }
                response.sendRedirect(request.getContextPath()+"/?action=Objetos");
                break;
            case "agregarObjetoVacuna":
                ArrayList<Objeto> listaObjetos3 = mision5Dao.listarObjetos();
                String nombreObjeto3 = request.getParameter("nVacuna");
                double pesoObjeto3 = Double.parseDouble(request.getParameter("nPesoVacuna"));
                String nombreObjetoSE3 = nombreObjeto3.replaceAll(" ", "");

                int ward3=0;
                for (Objeto obj : listaObjetos3){
                    if (nombreObjetoSE3.equalsIgnoreCase(obj.getNombre().replaceAll(" ",""))){
                        ward3++;
                        System.out.println("El objeto ya existe");
                    }
                }
                if (ward3==0){
                    mision5Dao.agregarObjetoVacuna(nombreObjeto3,pesoObjeto3);
                }
                double vDemoledor1 = Double.parseDouble(request.getParameter("vDemoledor1"));
                double vRapido1 = Double.parseDouble(request.getParameter("vRapido1"));
                double vNino1 = Double.parseDouble(request.getParameter("vNino1"));
                double vNormal1 = Double.parseDouble(request.getParameter("vNormal1"));
                double vOtro1 = Double.parseDouble(request.getParameter("vOtro1"));
                int idObjeto3 = mision5Dao.obtenerIdObjetoDeNombre(nombreObjeto3);
                mision5Dao.insertarEfectividad(1,idObjeto3,vDemoledor1);
                mision5Dao.insertarEfectividad(2,idObjeto3,vRapido1);
                mision5Dao.insertarEfectividad(3,idObjeto3,vNino1);
                mision5Dao.insertarEfectividad(4,idObjeto3,vNormal1);
                mision5Dao.insertarEfectividad(5,idObjeto3,vOtro1);
                response.sendRedirect(request.getContextPath()+"/?action=Objetos");
                break;
            case "Atacarhumano":
                if(mision6Dao.ataque(idZombie,idSuper)){
                    mision6Dao.superGana(idZombie,idSuper);
                    exitoso=true;
                }else{
                    mision6Dao.zombieGana(idZombie, idSuper);
                    exitoso=false;
                }
                response.sendRedirect(request.getContextPath()+"/?action=Caceria&mostrar=true&exitoso="+exitoso);
                break;
            case "actualizarPeso":
                int idObjeto5 = Integer.parseInt(request.getParameter("idPeso"));
                double peso = Double.parseDouble(request.getParameter("Peso"));
                mision5Dao.actualizarPeso(peso,idObjeto5);
                response.sendRedirect(request.getContextPath()+"/?action=Objetos");
        }

    }
}