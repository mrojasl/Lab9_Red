<%@ page import="pe.edu.pucp.lab9_red.beans.Objeto" %><%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 0021, 21 de junio del 2022
  Time: 11:46a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="inventario" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab9_red.beans.Objeto>"/>
<jsp:useBean id="objetosDisponibles" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab9_red.beans.Objeto>"/>
<jsp:useBean id="superviviente" scope="request" type="pe.edu.pucp.lab9_red.beans.Superviviente"/>
<jsp:useBean id="mostrar" scope="request" type="java.lang.Boolean"/>
<jsp:useBean id="exitoso" scope="request" type="java.lang.Boolean"/>
<html>
<head>
    <link rel="icon" href="icon.png">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <jsp:include page="header_style.jsp"/>


    <title>Inventario del superviviente: </title>
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
        <p class="titulo">Inventario del Superviviente, <%=superviviente.getNombre()%>  <img src="inventario.png" alt="Haunt" style="width: 55px;height: 55px"></p>
    </div>
    <!--BOOTSTRAP ADVERTENCIAS-->
    <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
        <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
        </symbol>
        <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
        </symbol>
        <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
        </symbol>
    </svg>
    <!--ALERTA DE OBJETO A??ADIDO O SI ERA MUY PESADO-->
    <%if(mostrar){%>
        <%if(exitoso){%>
        <div class="alert alert-success alert-dismissible fade show d-flex align-items-center" role="alert">
            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
            <div>
                Se a??adi?? el objeto exitosamente!
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%}else{%>
        <div class="alert alert-danger alert-dismissible fade show d-flex align-items-center" role="alert">
            <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
            <div>
                El superviviente no posee la fuerza suficiente! El objeto es muy pesado.
            </div>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
        <%}%>
    <%}%>
    <div class="p-2">
        <button type="button" class="btn btn-info"  data-bs-toggle="modal" data-bs-target="#extraLargeModal" STYLE="margin-top: -15px"> A??adir Objeto <i class="bi bi-briefcase-fill"></i> </button>
    </div>


    <table class="table table-hover table-dark" style="margin-top: 15px">
        <thead>
        <tr>
            <th scope="col">Nombre del objeto</th>
            <th scope="col">Cantidad</th>
            <th scope="col">Peso(KG)</th>
            <th scope="col">??Es vacuna?</th>
            <th scope="col">Eliminar Objeto</th>
        </tr>
        </thead>
        <tbody>
        <%for(Objeto o:inventario){%>
        <form method="POST" action="<%=request.getContextPath()%>/?action=eliminarObjetoInventario">
        <tr>
            <input type="hidden" value="<%=o.getIdObjeto()%>" name="idObjeto">
            <input type="hidden" value="<%=superviviente.getIdHumano()%>" name="idSuper">
            <td><%=o.getNombre()%></td>
            <td><%=o.getCantidad()%></td>
            <td><%=o.getMasa()%></td>
            <%if(o.getVacuna()){%>
            <td>Vacuna</td>
            <%}else{%>
            <td>Normal</td>
            <%}%>
            <td><button type="submit" class="btn btn-outline-danger" >Eliminar Objeto</button></td>
        </tr>
        </form>
        <%}%>
        </tbody>
    </table>
    <%if(inventario.size()==0){%>
    <div class="alert alert-danger" role="alert">
        <h4 class="alert-heading">El inventario est?? vac??o</h4>
        <p>Cuando un superviviente es creado por primera vez, este empieza con el inventario vac??o. Tambi??n, cuando
            los zombies se convierten en supervivientes, estos comienzan sin objeto alguno.</p>
        <hr>
        <p class="mb-0">Para a??adir un objeto al superviviente presiona "A??adir Objeto"!</p>
    </div>
    <%}%>
</div>




<!--      A??ADIR OBJETO  MODAL        -->
<!--      A??ADIR OBJETO  MODAL        -->
<!--      A??ADIR OBJETO  MODAL        -->

<div class="modal fade" id="extraLargeModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog modal-xl">
        <div class="modal-content" STYLE="background-color: rgb(157,138,142)">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><strong STYLE="color: white">Lista de Objetos disponibles</strong></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table table-dark table-hover">

                    <thead>
                    <tr>
                        <th scope="col">Nombre del objeto</th>
                        <th scope="col">Peso(KG)</th>
                        <th scope="col">??Es vacuna?</th>
                        <th scope="col">A??adir objeto</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%for(Objeto o:objetosDisponibles){%>
                    <form method="POST" action="<%=request.getContextPath()%>/?action=anadeObjetoInventario">
                    <tr>
                        <input type="hidden" name="idObjeto" value="<%=o.getIdObjeto()%>">
                        <input type="hidden" name="idSuper" value="<%=superviviente.getIdHumano()%>">
                        <input type="hidden" name="pesoObjeto" value="<%=o.getMasa()%>">
                        <td><%=o.getNombre()%></td>
                        <td><%=o.getMasa()%></td>
                        <%if(o.getVacuna()){%>
                        <td>Vacuna</td>
                        <%}else{%>
                        <td>Normal</td>
                        <%}%>
                        <td><button type="submit" class="btn btn-info" >A??adir Objeto</button></td>
                    </tr>
                    </form>
                    <%}%>
                    </tbody>
                </table>

            </div>
                </div>

        </div>
    </div>
</div>
<!--      A??ADIR OBJETO MODAL1        -->
<!--      A??ADIR OBJETO MODAL        -->
<!--      A??ADIR OBJETO MODAL        -->



<script>
    $(function(){
        // Enables popover

        $("[data-toggle=popover]").popover();
    });
</script>
</body>
</html>
