package pe.edu.pucp.lab9_red.servlets;

import pe.edu.pucp.lab9_red.beans.Virus;
import pe.edu.pucp.lab9_red.daos.Mision1Dao;
import pe.edu.pucp.lab9_red.daos.Mision2Dao;
import pe.edu.pucp.lab9_red.daos.Mision3Dao;

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

@WebServlet(name = "Apocalipsis", value = "")
public class ApocalipsisServlet extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action= request.getParameter("action")==null ? "listar": request.getParameter("action");
        Mision1Dao mision1Dao= new Mision1Dao();
        Mision2Dao mision2Dao= new Mision2Dao();
        Mision3Dao mision3Dao= new Mision3Dao();
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
        }

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action")==null? "redireccionar" : request.getParameter("action");
        Mision2Dao mision2Dao= new Mision2Dao();
        Mision3Dao mision3Dao= new Mision3Dao();
        String filtro;
        RequestDispatcher view;
        //Opcion actualizarSuper
        String nombre= request.getParameter("nombre");
        String peso0= request.getParameter("peso");
        String fuerza0= request.getParameter("fuerza");
        String idpareja= request.getParameter("idpareja");
        String idSuper= request.getParameter("idSuper");

        switch (action){
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
                    mision3Dao.AgregarVariante(nombreVariante,idSacado);

                }catch (NullPointerException e){
                    System.out.println("Virus no encontrado, creando Virus");
                    mision3Dao.AgregarVirus(nombreVirus);
                    int idVirusNuevo = mision3Dao.obtenerIdVirusDeNombre(nombreVirus);
                    mision3Dao.AgregarVariante(nombreVariante,idVirusNuevo);
                }
                response.sendRedirect(request.getContextPath() + "/?action=Virus");





        }


    }
}