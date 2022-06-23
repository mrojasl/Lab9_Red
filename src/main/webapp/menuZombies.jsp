<%@ page import="pe.edu.pucp.lab9_red.beans.Zombie" %>
<%@ page import="pe.edu.pucp.lab9_red.beans.Variante" %>
<%@ page import="pe.edu.pucp.lab9_red.beans.TiposDeZombie" %><%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 0021, 21 de junio del 2022
  Time: 11:46a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="zombies" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab9_red.beans.Zombie>"/>
<jsp:useBean id="porcH" scope="request" type="java.lang.Double"/>
<jsp:useBean id="porcM" scope="request" type="java.lang.Double"/>
<jsp:useBean id="porcO" scope="request" type="java.lang.Double"/>
<jsp:useBean id="proVict" scope="request" type="java.lang.Double"/>
<jsp:useBean id="varianteComun" scope="request" type="java.lang.String"/>
<jsp:useBean id="listaVariantes" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab9_red.beans.Variante>"/>
<jsp:useBean id="tiposZombie" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab9_red.beans.TiposDeZombie>"/>
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


    <title>Menú de Zombies</title>
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
        <p class="titulo">Menú de Zombies</p>
    </div>

    <div class="p-2">
        <button type="button" class="btn btn-outline-warning" style="margin-top: -15px" data-bs-toggle="modal" data-bs-target="#extraLargeModal" > Añadir Zombie ☣️ </button>
    </div>


    <div class="container mt-3">
        <button type="button" class="btn btn-outline-primary" data-bs-toggle="collapse" data-bs-target="#demo">Ver Estadísticas</button>
        <div id="demo" class="collapse">
            <table class="table table-hover table-dark" style="margin-top: 15px">
                <thead>
                <tr>
                    <th scope="col">Variante más común</th>
                    <th scope="col">% Zombies Hombres</th>
                    <th scope="col">% Zombies Mujeres</th>
                    <th scope="col">% Zombies Otros</th>
                    <th scope="col">Promedio de Víctimas por Zombie</th>

                </tr>
                </thead>
                <tbody>
                <tr>
                    <td style="text-align: center"><%=varianteComun%></td>
                    <td style="text-align: center"><%=Math.round(porcH*100.0)/100.0%></td>
                    <td style="text-align: center"><%=Math.round(porcM*100.0)/100.0%></td>
                    <td style="text-align: center"><%=Math.round(porcO*100.0)/100.0%></td>
                    <td style="text-align: center"><%=(int)(double)proVict%></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <table class="table table-hover table-dark" style="margin-top: 15px">
        <thead>
        <tr>
            <th scope="col">Número de identificación</th>
            <th scope="col">Nombres</th>
            <th scope="col">Sexo</th>
            <th scope="col">Tiempo Infectado</th>
            <th scope="col">VarianteVirus</th>
            <th scope="col">Número de Víctimas</th>
            <th scope="col">Tipo de Zombie</th>
        </tr>
        </thead>
        <tbody>
        <%for(Zombie z: zombies){%>
        <tr>
            <td><%=z.getIdHumano()%></td>
            <td><%=z.getNombre()+" "+z.getApellido()%></td>
            <td><%=z.getSexo()%></td>
            <td><%=z.getHorasInfectado()%> horas</td>
            <td><%=z.getVariante().getNombre()%></td>
            <td><%=z.getNumVictimas()%></td>
            <td><%=z.getTz().getNombre()%></td>
        </tr>
        <%}%>
        </tbody>
    </table>













</div>


<div class="modal fade" id="extraLargeModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog modal-xl">
        <div class="modal-content" STYLE="background-color: rgb(157,138,142)">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><p STYLE="color: white;font-size: 30px"> <strong>Añadir Zombie</strong></p></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="POST" action="<%=request.getContextPath()%>/?action=anadeZombie">
                <div class="modal-body" STYLE="background-color: rgb(157,138,142)">
                    <div class="row justify-content-center" STYLE="background-color: rgb(157,138,142)">
                        <div class="col-lg-12" STYLE="background-color: rgb(157,138,142)">
                            <div class="card" STYLE="background-color: rgb(157,138,142)">
                                <div class="row" STYLE="background-color: rgb(157,138,142)">
                                    <div class="col-lg-5" STYLE="background-color: rgb(157,138,142)">
                                        <div class="row px-2" >
                                            <div class="form-group col-md-6"> <label for="nnombre"><strong style="color: black">Nombre</strong></label><input type="text" class="form-control" id="nnombre" name="nombre"  placeholder="Nombre" required="required"> </div>
                                            <div class="form-group col-md-6"> <label for="napellido"><strong style="color: black">Apellido</strong></label><input type="text" class="form-control" id="napellido" name="napellido"  placeholder="Apellido" required="required"> </div>
                                        </div>
                                        <div class="row px-2">
                                            <div class="form-group col-md-6">
                                                <label for="tipozombie" class="form-control-label"><strong style="color: black">Tipo de Zombie</strong></label></label>
                                                <select id="tipozombie" name="idtipozombie" class="form-control">
                                                    <%for(TiposDeZombie tz: tiposZombie){%>
                                                    <option value="<%=tz.getIdTipo()%>"><%=tz.getNombre()%></option>
                                                    <%}%>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="variante" class="form-control-label"><strong style="color: black">Variante de Virus</strong></label></label>
                                                <select id="variante" name="idvariante" class="form-control">
                                                    <%for(Variante v: listaVariantes){%>
                                                    <option value="<%=v.getIdVariante()%>"><%=v.getNombre()%></option>
                                                    <%}%>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row px-2">
                                            <div class="form-group col-md-6">
                                                <label for="nsexo"><strong style="color: black">Sexo</strong></label>
                                                <select id="nsexo" name="sexo" class="form-control">
                                                    <option value="Masculino">Masculino</option>
                                                    <option value="Femenino">Femenino</option>
                                                    <option value="Otro" >otro</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-warning" >Añadir Zombie</button>
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
