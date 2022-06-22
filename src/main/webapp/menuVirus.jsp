<%@ page import="pe.edu.pucp.lab9_red.beans.Virus" %>
<%@ page import="pe.edu.pucp.lab9_red.beans.Variante" %><%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 0021, 21 de junio del 2022
  Time: 10:51a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaVariantes" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab9_red.beans.Variante>"/>
<jsp:useBean id="cantidadVirus" scope="request" type="java.lang.Integer"/>
<html>
<head>
    <link rel="icon" href="icon.png">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <jsp:include page="header_style.jsp"/>


    <title>Menú de Virus</title>
    <style>
        .titulo{
            color:white;
            font-weight: bold;
            font-size: 35px;
            margin-top:20px;
        }
    </style>

</head>
<body>



<div class="container">


    <div class="d-flex flex-row bd-highlight mb-1">
        <p class="titulo">Menú de Virus</p>
    </div>

    <div class="p-2">
        <button type="button" class="btn btn-outline-warning" style="margin-top: -15px" data-bs-toggle="modal" data-bs-target="#extraLargeModal" > Añadir Variante 🧫️</button>
        <br>
        <br>

        <div class="alert alert-danger" role="alert">
            <p class="cantidadVirusActivos" STYLE="text-align: center;font-size:20px;font-weight: bold"><i class="bi bi-radioactive"></i> Cantidad de Virus Activos: <%=cantidadVirus%> <i class="bi bi-radioactive"></i></p>
        </div>
    </div>


    <table class="table table-hover table-dark" style="margin-top: 15px">
        <thead>
        <tr>
            <th scope="col">Virus ID</th>
            <th scope="col">Virus</th>
            <th scope="col">Variante ID</th>
            <th scope="col">Variante</th>
            <th scope="col">Casos encontrados</th>
            <th scope="col">Erradicar Variante</th>
        </tr>
        </thead>
        <tbody>
            <%for (Variante variante : listaVariantes){%>
            <tr>
                <td><%=variante.getVirus().getIdVirus()%></td>
                <td><%=variante.getVirus().getNombre()%></td>
                <td><%=variante.getIdVariante()%></td>
                <td><%=variante.getNombre()%></td>
                <td><%=variante.getCasosEncontrados()%></td>
                <td><a href="<%=request.getContextPath()%>/?action=ErradicarVariante&idVariante=<%=variante.getIdVariante()%>&idVirus=<%=variante.getVirus().getIdVirus()%>"><button type="button" class="btn btn-outline-light">Erradicar Variante</button></a></td>
            </tr>
            <%}%>




        </tbody>
    </table>





</div>












<div class="modal fade" id="extraLargeModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog modal-xl">
        <div class="modal-content" STYLE="background-color: rgb(157,138,142)">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Añadir Variante</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="POST" action="<%=request.getContextPath()%>/?action=AgregarVariante">
                <div class="modal-body" >
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="row">
                                        <div class="col-lg-5">
                                            <div class="row px-2" >
                                                <div class="form-group col-md-6">
                                                    <label class="form-control-label">Virus al que pertenece</label> <input type="text"  id="nvirus" name="nvirus" required="required" placeholder="Virus">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="nvariante" class="form-control-label">Nombre de la variante</label> <input type="text"  id="nvariante" name="nvariante" required="required" placeholder="Variante">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-warning" >Añadir  Variante</button>
                                        </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
