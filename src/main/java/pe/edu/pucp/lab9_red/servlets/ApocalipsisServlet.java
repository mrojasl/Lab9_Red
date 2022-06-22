package pe.edu.pucp.lab9_red.servlets;

import pe.edu.pucp.lab9_red.beans.Superviviente;
import pe.edu.pucp.lab9_red.beans.Variante;
import pe.edu.pucp.lab9_red.beans.Virus;
import pe.edu.pucp.lab9_red.beans.Zombie;
import pe.edu.pucp.lab9_red.daos.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.util.ArrayList;

@WebServlet(name = "Apocalipsis", urlPatterns = {"","/Apocalipsis"})
public class ApocalipsisServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action")==null ? "listar": request.getParameter("action");
        Mision1Dao mision1Dao= new Mision1Dao();
        Mision2Dao mision2Dao= new Mision2Dao();
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
                request.setAttribute("superviviente", sp);
                request.setAttribute("inventario", mision2Dao.listarInventario(idSuper));
                request.setAttribute("objetosDisponibles", mision2Dao.listarObjetosDisponibles());
                requestDispatcher= request.getRequestDispatcher("menuInventario.jsp");
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
        String filtro;
        RequestDispatcher view;
        //Opcion actualizarSuper o añadirSuperviviente
        String nombre= request.getParameter("nombre");//añaSupe
        String peso0= request.getParameter("peso");//añaSupe
        String fuerza0= request.getParameter("fuerza");//añaSupe
        String idpareja= request.getParameter("idpareja");//añaSupe
        String idSuper= request.getParameter("idSuper");

        //Opcion añadirSuperviviente
        String apellido= request.getParameter("napellido");
        String sexo= request.getParameter("sexo");

        //Opcion añadirZombie
        String idtz= request.getParameter("idtipozombie");
        String idvariante= request.getParameter("idvariante");

        //Opcion añadirOjeto
        String idObjeto= request.getParameter("idObjeto");
        String pesoObjeto= request.getParameter("pesoObjeto");
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
                try{
                    int idO= Integer.parseInt(idObjeto);
                    double peso= Double.parseDouble(pesoObjeto);
                    mision2Dao.anadirObjetoSuperviviente(idSuper,idO,peso);
                }catch (NumberFormatException e){
                    System.out.println("Error POST | anadeObjetoInventario convertir dato");
                }
                response.sendRedirect(request.getContextPath()+"/?action=verInventario&idSuper="+idSuper);
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
        }

    }
}