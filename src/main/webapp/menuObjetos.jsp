<%@ page import="pe.edu.pucp.lab9_red.beans.Objeto" %>
<%@ page import="pe.edu.pucp.lab9_red.beans.Efectividad" %><%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 0021, 21 de junio del 2022
  Time: 11:46a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaObjetos" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab9_red.beans.Objeto>"/>
<jsp:useBean id="listaEfectividad" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab9_red.beans.Efectividad>"/>
<jsp:useBean id="listaObjetosNoUsados" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab9_red.beans.Objeto>"/>
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


    <title>Menú de Objetos</title>
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
        <p class="titulo">Menú de Objetos  <img src="objetos.png" alt="Haunt" style="width: 65px;height: 55px"></p>
    </div>

    <div class="p-2">
        <button type="button" class="btn btn-outline-primary" data-bs-toggle="collapse" data-bs-target="#demo1" style="margin-top: -15px">Añadir Objeto</button>
        <div id="demo1" class="collapse">
            <br>
            <button type="button" class="btn btn-light"  data-bs-toggle="modal" data-bs-target="#extraLargeModal" > Añadir Objeto Común <i class="bi bi-briefcase-fill"></i> </button>
            <button type="button" class="btn btn-light"  data-bs-toggle="modal" data-bs-target="#extraLargeModal1" > Añadir Vacuna <i class="bi bi-eyedropper"></i> </button>
        </div>


    </div>



    <table class="table table-hover table-dark" style="margin-top: 15px">
        <thead>
        <tr>
            <th scope="col">Nombre del objeto</th>
            <th scope="col">Peso(KG)</th>
            <th scope="col">Tipo</th>
            <th scope="col">Mostrar efectividad de cura</th>
        </tr>
        </thead>
        <tbody>
            <%for (Objeto objeto : listaObjetos){%>

            <tr>
                <td>
                    <%=objeto.getNombre()%>
                </td>

                <td>
                    <%int centi=objeto.getIdObjeto();%>
                    <%for (Objeto objetoNoUsado : listaObjetosNoUsados) {
                    if (objeto.getIdObjeto()==objetoNoUsado.getIdObjeto()){%>

                    <form method="POST" action="<%=request.getContextPath()%>/?action=actualizarPeso&idPeso=<%=objeto.getIdObjeto()%>">
                        <%if(!objeto.getVacuna()){%>
                        <input type="number" class="form-control" name="Peso" value="<%=objeto.getMasa()%>" required="required" min="0" step="any">
                        <%}else{%>
                        <input type="number" class="form-control" name="Peso" value="<%=objeto.getMasa()%>" required="required" max="0.5" min="0" step="any">
                        <%}%>
                        <button type="submit" class="btn btn-info" >Actualizar</button>
                    </form>
                    <%centi++;%>
                    <%}} if (centi==objeto.getIdObjeto()){%>

                    <form method="POST" action="<%=request.getContextPath()%>/?action=actualizarPeso">
                        <input type="number" class="form-control" name="Peso" value="<%=objeto.getMasa()%>" required="required" min="0" max="0.5" step="any">
                        <button disabled type="button" class="btn btn-info" >Objeto usado</button>
                    </form>
                    <%}%>

                </td>

                <td>
                    <%if(objeto.getVacuna()){%>Vacuna<%}else{%>Objeto<%}%>
                </td>

                <td>
                    <%if(!objeto.getVacuna()){%>
                        <p>No genera efecto</p>
                    <%}else{%>
                    <button type="button" class="btn btn-outline-primary" data-bs-toggle="collapse" data-bs-target="#demo<%=objeto.getIdObjeto()%>">Efectividad</button>
                    <div id="demo<%=objeto.getIdObjeto()%>" class="collapse">

                        <form method="POST" action="<%=request.getContextPath()%>/?action=actualizarEfectividad&idObjeto=<%=objeto.getIdObjeto()%>">

                            <br>Demoledor
                            <input type="number" class="form-control" id="vDemoledor" name="vDemoledor"
                                <%for (Efectividad efectividad : listaEfectividad){%>

                            <%if (efectividad.getObjeto().getIdObjeto()==objeto.getIdObjeto() && efectividad.getTipoDeZombie().getNombre().equalsIgnoreCase("Demoledor")){%>
                                   value="<%=efectividad.getPorcentaje()%>"
                                   <%}}%>
                                   required="required" min="0" step="any">
                            <br>Rápido
                            <input type="number" class="form-control" name="vRapido"
                                <%for (Efectividad efectividad : listaEfectividad){%>

                                <%if (efectividad.getObjeto().getIdObjeto()==objeto.getIdObjeto() && efectividad.getTipoDeZombie().getNombre().equalsIgnoreCase("Rápido")){%>
                                   value="<%=efectividad.getPorcentaje()%>"
                                <%}}%>

                                   required="required" min="0" max="100" step="any">
                            <br>Niño:
                            <input type="number" class="form-control" name="vNino"
                                <%for (Efectividad efectividad : listaEfectividad){%>

                                <%if (efectividad.getObjeto().getIdObjeto()==objeto.getIdObjeto() && efectividad.getTipoDeZombie().getNombre().equalsIgnoreCase("Niño")){%>
                                   value="<%=efectividad.getPorcentaje()%>"
                                <%}}%>

                                   required="required" min="0" max="100" step="any">
                            <br>Normal
                            <input type="number" class="form-control" name="vNormal"
                                <%for (Efectividad efectividad : listaEfectividad){%>

                                <%if (efectividad.getObjeto().getIdObjeto()==objeto.getIdObjeto() && efectividad.getTipoDeZombie().getNombre().equalsIgnoreCase("Normal")){%>
                                   value="<%=efectividad.getPorcentaje()%>"
                                <%}}%>

                                   required="required" min="0" max="100" step="any">
                            <br>Otro:
                            <input type="number" class="form-control" name="vOtro"
                                <%for (Efectividad efectividad : listaEfectividad){%>

                                <%if (efectividad.getObjeto().getIdObjeto()==objeto.getIdObjeto() && efectividad.getTipoDeZombie().getNombre().equalsIgnoreCase("Otro")){%>
                                   value="<%=efectividad.getPorcentaje()%>"
                                <%}}%>

                                   required="required" min="0" max="100" step="any">
                            (Valores desde 0 hasta el 100% )

                            <button type="submit" class="btn btn-info" >Actualizar</button>
                        </form>


                    </div>
                    <%}%>
                </td>


            </tr>

            <%}%>
        </tbody>
    </table>




</div>






<!--      AÑADIR OBJETO COMUN MODA1L        -->
<!--      AÑADIR OBJETO COMUN MODAL        -->
<!--      AÑADIR OBJETO COMUN MODAL        -->

<div class="modal fade" id="extraLargeModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog modal-xl">
        <div class="modal-content" STYLE="background-color: rgb(157,138,142)">
            <div class="modal-header" STYLE="background-color: rgb(157,138,142)">
                <h5 class="modal-title" id="exampleModalLabel"><p STYLE="color: white;font-size: 30px"> <strong>Añadir Objeto Común</strong></p></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="POST" action="<%=request.getContextPath()%>/?action=agregarObjetoComun">
                <div class="modal-body" STYLE="background-color: rgb(157,138,142)" >
                    <div class="row justify-content-center" STYLE="background-color: rgb(157,138,142)">
                        <div class="col-lg-12" STYLE="background-color: rgb(157,138,142)">
                            <div class="card" STYLE="background-color: rgb(157,138,142)">
                                <div class="row" STYLE="background-color: rgb(157,138,142)">
                                    <div class="col-lg-5" STYLE="background-color: rgb(157,138,142)">
                                        <div class="row px-2" >
                                            <div class="form-group col-md-6"> <label for="nObjeto"><strong style="color: black">Nombre</strong></label><input type="text" class="form-control" id="nObjeto" name="nObjeto"  placeholder="nombre" required="required"> </div>
                                            <div class="form-group col-md-6"> <label for="nPesoObjeto"><strong style="color: black">Peso (en Kg)</strong></label><input type="number" class="form-control" id="nPesoObjeto" name="nPesoObjeto" min="0" step="any" placeholder="Peso (kg)"> </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-info" >Añadir Objeto Común</button>
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
<!--      AÑADIR OBJETO COMUN MODAL        -->
<!--      AÑADIR OBJETO COMUN MODAL        -->
<!--      AÑADIR OBJETO COMUN MODAL        -->

<!--     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   -->


<!--      AÑADIR VACUNA MODAL        -->
<!--      AÑADIR VACUNA MODAL        -->
<!--      AÑADIR VACUNA MODAL        -->

<div class="modal fade" id="extraLargeModal1" tabindex="-1" role="dialog" >
    <div class="modal-dialog modal-xl">
        <div class="modal-content" STYLE="background-color: rgb(157,138,142)">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1"><p STYLE="color: white;font-size: 30px"> <strong>Añadir Vacuna</strong></p></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="POST" action="<%=request.getContextPath()%>/?action=agregarObjetoVacuna">
                <div class="modal-body" STYLE="background-color: rgb(157,138,142)">
                    <div class="row justify-content-center" STYLE="background-color: rgb(157,138,142)">
                        <div class="col-lg-12" STYLE="background-color: rgb(157,138,142)">
                            <div class="card" STYLE="background-color: rgb(157,138,142)">
                                <div class="row" STYLE="background-color: rgb(157,138,142)">
                                    <div class="col-lg-5" STYLE="background-color: rgb(157,138,142)">
                                        <div class="row px-2" STYLE="background-color: rgb(157,138,142)" >
                                            <div class="form-group col-md-6"> <label for="nVacuna"><strong style="color: black">Nombre</strong></label><input type="text" class="form-control" id="nVacuna" name="nVacuna"  placeholder="nombre" required="required"> </div>
                                            <div class="form-group col-md-6"> <label for="nPesoVacuna"><strong style="color: black">Peso (en Kg)</strong></label><input type="number" class="form-control" id="nPesoVacuna" name="nPesoVacuna" min="0.001" max="0.5" step="any" value="0.01"> </div>
                                        </div>

                                        <div class="row px-2">
                                            <div class="form-group col-md-6">
                                                <label for="vDemoledor1" class="form-control-label"><strong style="font-size: 20px">Efectividad por tipo de Zombies:</strong><br><br><strong>Demoledor:</strong></label>
                                                <input type="number" class="form-control" id="vDemoledor1" name="vDemoledor1" value="10" required="required" min="0" step="any">

                                                <label for="vRapido1" class="form-control-label"><strong style="color: black">Rapido:</strong></label>
                                                <input type="number" class="form-control" id="vRapido1" name="vRapido1" value="10" required="required" min="0" max="100" step="any">

                                                <label for="vNiño1" class="form-control-label"><strong style="color: black">Niño:</strong></label>
                                                <input type="number" class="form-control" id="vNiño1" name="vNino1" value="10" required="required" min="0" max="100" step="any">

                                                <label for="vNormal1" class="form-control-label"><strong style="color: black">Normal:</strong></label>
                                                <input type="number" class="form-control" id="vNormal1" name="vNormal1" value="10" required="required" min="0" max="100" step="any">

                                                <label for="vOtro1" class="form-control-label"><strong style="color: black">Otro:</strong></label>
                                                <input type="number" class="form-control" id="vOtro1" name="vOtro1" value="10" required="required" min="0" max="100" step="any">
                                                <strong>(Valores desde 0 hasta el 100% )</strong>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-info" >Añadir Vacuna</button>
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
<!--      AÑADIR VACUNA MODAL        -->
<!--      AÑADIR VACUNA MODAL        -->
<!--      AÑADIR VACUNA MODAL        -->

<script>
    $(function(){
        // Enables popover

        $("[data-toggle=popover]").popover();
    });
</script>
</body>
</html>
