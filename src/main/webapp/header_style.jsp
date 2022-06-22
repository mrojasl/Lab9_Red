<%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 0020, 20 de junio del 2022
  Time: 07:13p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

<nav class="navbar navbar-light" style="background:#484f4f;">
    <h1 class="glow" style="color: white; ">Apocalipsis Zombie⠀<img class="hazard" src="biohazard.png" alt="DNA" style="width:35px;height:35px; opacity: 1;margin-top: -13px" ></h1>
    <div class="nav2">
        <a href="<%=request.getContextPath()%>/?action=listar" class="my-1 mx-1"><button type="button" class="btn btn-outline-info">   Humanos <i class="bi bi-person-badge-fill"></i>️</button> </a>
        <a href="<%=request.getContextPath()+"/?action=Supervivientes"%>" class="my-1 mx-1"><button type="button" class="btn btn-outline-success"> Supervivientes <i class="bi bi-person-heart"></i>️</button> </a>
        <a href="<%=request.getContextPath()%>/?action=Virus" class="my-1 mx-1"><button type="button" class="btn btn-outline-warning"> Virus <i class="bi bi-bug-fill"></i>️</button> </a>
        <a href="<%=request.getContextPath()%>/?action=Zombies" class="my-1 mx-1"><button type="button" class="btn btn-outline-dark"> Zombies <i class="bi bi-person-x-fill"></i>️</button> </a>
        <a href="<%=request.getContextPath()%>/?action=Objetos" class="my-1 mx-1"><button type="button" class="btn btn-outline-light"> Objetos <i class="bi bi-eyedropper"></i> ️</button> </a>
        <a href="<%=request.getContextPath()%>/?action=Caceria" class="my-1 mx-1"><button type="button" class="btn btn-outline-danger"> Cacería ⚔️</button> </a>
    </div>

    <img src="necroa.png" alt="DNA" style="width:250px;height:80px; opacity: 0.5;margin-top: -25px" >
</nav>

<body class="bodycolor">

</body>

<style>
    .nav2{
        margin-left: 0px;
    }
    .bodycolor{
        background:#563f46;
    }
    h1.glow:link {
        text-decoration: none;
    }

    h1.glow:visited {
        text-decoration: none;
        color: #fff;
    }

    h1.glow {
        color:#fff;
        -moz-transition: all 0.2s ease-in;
        -o-transition: all 0.2s ease-in;
        -webkit-transition: all 0.2s ease-in;
        transition: all 0.2s ease-in;
    }

    h1.glow:hover {
        color: #FD6E6EFF;
        text-shadow:0px 0px 30px #FD6E6EFF;
        -moz-transition: all 0.2s ease-in;
        -o-transition: all 0.2s ease-in;
        -webkit-transition: all 0.2s ease-in;
        transition: all 0.2s ease-in;


    }
    .hazard{
        margin-left: -15px;
    }
</style>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
