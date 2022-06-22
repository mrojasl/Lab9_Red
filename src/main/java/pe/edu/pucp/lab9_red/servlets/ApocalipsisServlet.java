package pe.edu.pucp.lab9_red.servlets;

import pe.edu.pucp.lab9_red.beans.Virus;
import pe.edu.pucp.lab9_red.beans.Zombie;
import pe.edu.pucp.lab9_red.daos.Mision1Dao;
import pe.edu.pucp.lab9_red.daos.Mision2Dao;
import pe.edu.pucp.lab9_red.daos.Mision3Dao;
import pe.edu.pucp.lab9_red.daos.Mision4Dao;

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
                ArrayList<Virus> listaVariantes =  mision3Dao.obtenerVariantesDeVirus(idVirus);
                if (listaVariantes.size()==0){
                    mision3Dao.EliminarVirus(idVirus);
                }
                response.sendRedirect(request.getContextPath() + "/?action=Virus");
                break;
            case "Objetos":


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
                requestDispatcher=request.getRequestDispatcher("menuZombies.jsp");
                requestDispatcher.forward(request,response);
                break;




        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action")==null? "redireccionar" : request.getParameter("action");
        Mision2Dao mision2Dao= new Mision2Dao();
        Mision3Dao mision3Dao= new Mision3Dao();
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

            /*case "AgregarVariante":
                String nombreVirus = request.getParameter("nvirus").replaceAll(" ", "");
                String nombreVariante = request.getParameter("nvariante").replaceAll(" ", "");
                ArrayList<Virus> listaVirus = mision3Dao.listarVirus();
                for (Virus virus : listaVirus){
                    if (virus.getNombre().equalsIgnoreCase(nombreVirus)) {
                        ArrayList<Virus> listaVariantesDeVirus = mision3Dao.obtenerVariantesDeVirus(virus.getIdVirus());
                        for (Virus variante : listaVariantesDeVirus){
                            if (variante.getVariante().equalsIgnoreCase(nombreVariante)){
                                response.sendRedirect(request.getContextPath() + "/?action=Virus");
                            }
                        }

                    }
                }*/

            case "AgregarVariante":
                String nombreVirus = request.getParameter("nvirus").replaceAll(" ", "");
                String nombreVariante = request.getParameter("nvariante").replaceAll(" ", "");
                ArrayList<Virus> listaVirus = mision3Dao.listarVirus();
                try{
                    int idSacado = mision3Dao.obtenerIdVirusDeNombre(nombreVirus);
                    ArrayList<Virus> variantesDeIdSacado = mision3Dao.obtenerVariantesDeVirus(idSacado);
                    int centinela = 0;
                    for (Virus variante : variantesDeIdSacado){
                        if (variante.getVariante().equalsIgnoreCase(nombreVariante)) {
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
        }

    }
}