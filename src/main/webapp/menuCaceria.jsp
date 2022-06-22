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


    <title>Cacería 🩸</title>
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
        <p class="titulo">Menú de cacería <img src="Popup_solder_red%25402x.png" alt="Haunt" style="width: 55px;height: 55px"> </p>
    </div>



    <div class="row">
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">

        <table class="table table-hover table-secondary" style="margin-top: 5px">
            <p STYLE="margin-top: 10px;font-weight: bold;font-size: 20px;color: white">Lista de Humanos:</p>
            <thead>
            <tr>
                <th scope="col">Número de identificación</th>
                <th scope="col">Nombre</th>
                <th scope="col">Nombre de la Pareja</th>
            </tr>
            </thead>
            <tbody>

            <tr>

                <td>134124124124124124</td>
                <td>sdnjkad</td>
                <td>nashndankjdbnsa</td>


            </tr>

            </tbody>
        </table>


    </div>


    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">

        <table class="table table-hover table-danger" style="margin-top: 5px">
            <p STYLE="margin-top: 10px;font-weight: bold;font-size: 20px;color: white">Lista de Zombies:</p>
            <thead>
            <tr>
                <th scope="col">Número de identificación</th>
                <th scope="col">Nombre</th>
                <th scope="col">Número de víctimas</th>
                <th scope="col">Atacar a:</th>
                <th scope="col">Atacar</th>

            </tr>
            </thead>
            <tbody>

            <tr>

                <td>13422222222224</td>
                <td>Zombi3</td>
                <td>322</td>

                <td>
                    <select name="atacarA" class="form-control">


                    <option value="humano">asd</option>

                        <option value="humano1">asd</option>

                    </select>


                </td>

                <td>
                    <button type="submit" class="btn btn-outline-danger" >Atacar</button>
                </td>



            </tr>

            </tbody>
        </table>



    </div>
    </div>





</div>










<script>
    $(function(){
        // Enables popover

        $("[data-toggle=popover]").popover();
    });
</script>
</body>
</html>
