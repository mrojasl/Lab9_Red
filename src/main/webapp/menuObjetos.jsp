<%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 0021, 21 de junio del 2022
  Time: 11:46a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaObjetos" scope="request" type=""/>
<html>
<head>

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
        <p class="titulo">Menú de Objetos</p>
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
            <th scope="col">Mostrar efectividad</th>

        </tr>
        </thead>
        <tbody>

        <tr>
            <td>Botella de agua</td>

            <td>
                <form method="POST" action="<%=request.getContextPath()%>/?action=actualizarPeso">
                    <input type="number" class="form-control" name="Peso" value="<%=10%>" required="required" min="0" step="any">
                    <button type="submit" class="btn btn-info" >Actualizar</button>
                </form>
            </td>
            <td>Objeto</td>
            <td> </td>


        </tr>
        <tr>
            <td>Aromas de chamán</td>
            <td>
                <form method="POST" action="<%=request.getContextPath()%>/?action=actualizarPeso">
                    <input type="number" class="form-control" name="Peso" value="<%=0.08%>" required="required" min="0" max="0.5" step="any">
                    <button type="submit" class="btn btn-info" >Actualizar</button>
                </form>
            </td>
            <td>Vacuna</td>
            <td><button type="button" class="btn btn-outline-primary" data-bs-toggle="collapse" data-bs-target="#demo">Efectividad</button>
                <div id="demo" class="collapse">

                    <form method="POST" action="<%=request.getContextPath()%>/?action=actualizarEfectividad">
                        <label for="vDemoledor" class="form-control-label"></label>
                        <input type="number" class="form-control" id="vDemoledor" name="vDemoledor" value="<%=10%>" required="required" min="0" step="any">
                        <br>
                        <input type="number" class="form-control" name="vRapido" value="<%=10%>" required="required" min="0" max="100" step="any">
                        <br>
                        <input type="number" class="form-control" name="vNiño" value="<%=10%>" required="required" min="0" max="100" step="any">
                        <br>
                        <input type="number" class="form-control" name="vNormal" value="<%=10%>" required="required" min="0" max="100" step="any">
                        <br>
                        <input type="number" class="form-control" name="vOtro" value="<%=10%>" required="required" min="0" max="100" step="any">
                        (Valores desde 0 hasta el 100% )
                        <br>
                        <button type="submit" class="btn btn-info" >Actualizar</button>
                    </form>
                </div>
            </td>


        </tr>

        </tbody>
    </table>




</div>






<!--      AÑADIR OBJETO COMUN MODAL        -->
<!--      AÑADIR OBJETO COMUN MODAL        -->
<!--      AÑADIR OBJETO COMUN MODAL        -->

<div class="modal fade" id="extraLargeModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog modal-xl">
        <div class="modal-content" STYLE="background-color: rgb(157,138,142)">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Añadir Objeto Común</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="POST" action="<%=request.getContextPath()%>/">
                <div class="modal-body" >
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="row">
                                    <div class="col-lg-5">
                                        <div class="row px-2" >
                                            <div class="form-group col-md-6"> <label for="nObjeto">Nombre</label><input type="text" class="form-control" id="nObjeto" name="nObjeto"  placeholder="nombre" required="required"> </div>
                                            <div class="form-group col-md-6"> <label for="nPesoObjeto">Peso (en Kg)</label><input type="number" class="form-control" id="nPesoObjeto" name="nPesoObjeto" min="0" step="any" placeholder="420"> </div>
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
                <h5 class="modal-title" id="exampleModalLabel1">Añadir Vacuna</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="POST" action="<%=request.getContextPath()%>/">
                <div class="modal-body" >
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="row">
                                    <div class="col-lg-5">
                                        <div class="row px-2" >
                                            <div class="form-group col-md-6"> <label for="nVacuna">Nombre</label><input type="text" class="form-control" id="nVacuna" name="nVacuna"  placeholder="nombre" required="required"> </div>
                                            <div class="form-group col-md-6"> <label for="nPesoVacuna">Peso (en Kg)</label><input type="number" class="form-control" id="nPesoVacuna" name="nPesoVacuna" min="0" max="0.5" step="any" placeholder="0.001"> </div>
                                        </div>

                                        <div class="row px-2">
                                            <div class="form-group col-md-6">
                                                <label for="vDemoledor1" class="form-control-label"><strong>Efectividad por tipo de Zombies:</strong><br>Demoledor:</label>
                                                <input type="number" class="form-control" id="vDemoledor1" name="vDemoledor1" value="<%=10%>" required="required" min="0" step="any">

                                                <label for="vRapido1" class="form-control-label">Rapido:</label>
                                                <input type="number" class="form-control" id="vRapido1" name="vRapido1" value="<%=10%>" required="required" min="0" max="100" step="any">

                                                <label for="vNiño1" class="form-control-label">Niño:</label>
                                                <input type="number" class="form-control" id="vNiño1" name="vNiño1" value="<%=10%>" required="required" min="0" max="100" step="any">

                                                <label for="vNormal1" class="form-control-label">Normal:</label>
                                                <input type="number" class="form-control" id="vNormal1" name="vNormal1" value="<%=10%>" required="required" min="0" max="100" step="any">

                                                <label for="vOtro1" class="form-control-label">Otro:</label>
                                                <input type="number" class="form-control" id="vOtro1" name="vOtro1" value="<%=10%>" required="required" min="0" max="100" step="any">
                                                (Valores desde 0 hasta el 100% )

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
