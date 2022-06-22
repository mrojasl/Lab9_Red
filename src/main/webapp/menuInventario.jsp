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


    <title>Inventario del superviviente</title>
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
        <p class="titulo">Inventario del Superviviente</p>
    </div>

    <div class="p-2">
        <button type="button" class="btn btn-info"  data-bs-toggle="modal" data-bs-target="#extraLargeModal" STYLE="margin-top: -15px"> Añadir Objeto <i class="bi bi-briefcase-fill"></i> </button>

    </div>



    <table class="table table-hover table-dark" style="margin-top: 15px">
        <thead>
        <tr>
            <th scope="col">Nombre del objeto</th>
            <th scope="col">Cantidad</th>
            <th scope="col">Peso(KG)</th>
            <th scope="col">¿Es vacuna?</th>
            <th scope="col">Eliminar Objeto</th>
        </tr>
        </thead>
        <tbody>

        <tr>


            <td>Botella de agua</td>
            <td>3</td>
            <td>2.4</td>
            <td>Nou</td>
            <td><button type="submit" class="btn btn-outline-danger" >Eliminar Objeto</button></td>


        </tr>
        <tr>
            <td>Aromas de chamán</td>
            <td>2</td>
            <td>0.442</td>
            <td>Claro que yes</td>
            <td><button type="submit" class="btn btn-outline-danger" >Eliminar Objeto</button></td>




        </tr>

        </tbody>
    </table>




</div>






<!--      AÑADIR OBJETO  MODAL        -->
<!--      AÑADIR OBJETO  MODAL        -->
<!--      AÑADIR OBJETO  MODAL        -->

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
                        <th scope="col">¿Es vacuna?</th>
                        <th scope="col">Añadir objeto</th>

                    </tr>
                    </thead>
                    <tbody>

                    <tr>


                        <td>Botella de agua</td>
                        <td>15.4</td>
                        <td>Nou</td>
                        <td><button type="submit" class="btn btn-info" >Añadir Objeto</button></td>



                    </tr>
                    <tr>
                        <td>Aromas de chamán</td>
                        <td>0.005</td>
                        <td>Claro que yes</td>
                        <td><button type="submit" class="btn btn-info" >Añadir Objeto</button></td>



                    </tr>

                    </tbody>







                </table>

            </div>
                </div>

        </div>
    </div>
</div>
<!--      AÑADIR OBJETO MODAL1        -->
<!--      AÑADIR OBJETO MODAL        -->
<!--      AÑADIR OBJETO MODAL        -->



<script>
    $(function(){
        // Enables popover

        $("[data-toggle=popover]").popover();
    });
</script>
</body>
</html>
