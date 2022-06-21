<%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 0021, 21 de junio del 2022
  Time: 11:46a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <td>aa</td>
                    <td>33</td>
                    <td>33</td>
                    <td>33</td>
                    <td>2</td>
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
        <tr>
            <td>49929129381</td>
            <td>El pepe</td>
            <td>Masculino</td>
            <td>1000 horas</td>
            <td>Omicrón</td>
            <td>23</td>
            <td>Demoledor</td>

        </tr>

        </tbody>
    </table>













</div>









<div class="modal fade" id="extraLargeModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog modal-xl">
        <div class="modal-content" STYLE="background-color: rgb(157,138,142)">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Añadir Zombie</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="POST" action="<%=request.getContextPath()%>/Zombies?a=anadeZombie">
                <div class="modal-body" >
                    <div class="row justify-content-center">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="row">
                                    <div class="col-lg-5">
                                        <div class="row px-2" >
                                            <div class="form-group col-md-6"> <label for="nnombre">Nombres</label><input type="text" class="form-control" id="nnombre" name="nnombre"  placeholder="nombres" required="required"> </div>
                                            <div class="form-group col-md-6"> <label for="napellido">Apellidos</label><input type="text" class="form-control" id="napellido" name="napellido"  placeholder="apellidos" required="required"> </div>
                                        </div>
                                        <div class="row px-2">
                                            <div class="form-group col-md-6"> <label for="nidentificacion">N°identificacion</label><input type="number" class="form-control" id="nidentificacion" name="nidentificacion" min="1" placeholder="identificador" required="required"> </div>

                                            <div class="form-group col-md-6"> <label for="nsexo">Sexo</label><input type="text" class="form-control" id="nsexo" name="nsexo"  placeholder="Sexo" required="required"> </div>
                                        </div>
                                        <div class="row px-2">
                                            <div class="form-group col-md-6">
                                                <label for="tipozombie" class="form-control-label">Tipo de Zombie</label>
                                                <select id="tipozombie" name="tipozombie" class="form-control">
                                                    <option value="Demoledor">Demoledor</option>
                                                    <option value="Rápido" >Rapido</option>
                                                    <option value="Nino" >Niño</option>
                                                    <option value="Normal" >Normal</option>
                                                    <option value="Otro" >Otro</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="variante" class="form-control-label">Variante de Virus</label>
                                                <select id="variante" name="variante" class="form-control">
                                                    <option value="omicron">omicron</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="virust" class="form-control-label">Tipo de Virus</label>
                                                <select id="virust" name="virust" class="form-control">
                                                    <option value="corona">corona</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-warning" >Añadir  Zombie</button>
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
