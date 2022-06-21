<%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 0020, 20 de junio del 2022
  Time: 09:55p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
  <title>Menú de humanos</title>
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
    <p class="titulo">Menú de Supervivientes</p>


  </div>



  <div class="d-flex">
    <div class="p-2">
      <button type="button" class="btn btn-success" style="margin-top: -15px" data-bs-toggle="modal" data-bs-target="#extraLargeModal" > Añadir Superviviente <i class="bi bi-person-heart"></i>️</button>
    </div>

    <div class="ml-auto p-2" style="margin-top: -35px">
      <span STYLE="color: white;font-weight: bold">Filtrar por Sexo </span>
      <form method="POST" action="<%=request.getContextPath()%>/Supervivientes?a=filtrarsexo">
        <select id="sexoseleccionado" class="form-control">
          <option selected>Masculino</option>
          <option>Femenino</option>
        </select>
        <button type="submit" class="btn btn-primary">Filtrar</button>
      </form>
    </div>
  </div>





  <table class="table table-hover table-dark" style="margin-top: 15px">
    <thead>
    <tr>
      <th scope="col">Número de identificación</th>
      <th scope="col">Nombres</th>
      <th scope="col">Sexo</th>
      <th scope="col">Peso-KG-</th>
      <th scope="col">Fuerza-N-</th>
      <th scope="col">Nombres de la Pareja</th>
      <th scope="col">Peso Cargado-KG-</th>
    </tr>
    </thead>
    <tbody>



    <tr>
      <th scope="row">322420696666</th>
      <td>
      <form method="POST" action="<%=request.getContextPath()%>/Supervivientes?a=actualizarnombre">
        <input type="text" class="form-control" name="nombre" id="nombre"  value="Mickey Mouse" required="required">
        <button type="submit" class="btn btn-primary">Actualizar</button>
      </form>
      </td>

      <td>Masculino</td>
      <td>
        <form method="POST" action="<%=request.getContextPath()%>/Supervivientes?a=actualizarpeso">
          <input type="number" class="form-control" name="peso" id="peso"  value="<%=50%>" required="required" min="1">
          <button type="submit" class="btn btn-primary">Actualizar</button>
        </form>
      </td>
      <td>
        <form method="POST" action="<%=request.getContextPath()%>/Supervivientes?a=actualizarfuerza">
          <input type="number" class="form-control" name="fuerza" id="fuerza"  value="<%=500%>" required="required" min="1">
          <button type="submit" class="btn btn-primary">Actualizar</button>
        </form>
      </td>
      <td>
        <form method="POST" action="<%=request.getContextPath()%>/Supervivientes?a=actualizarpareja">
          <input type="text" class="form-control" name="pareja" id="pareja"  value="Minnie Mouse" required="required">
          <button type="submit" class="btn btn-primary">Actualizar</button>
        </form>
      </td>

      <td>12</td>

    </tr>


    <tr>
      <th scope="row">322420696666</th>
      <td>
        <form method="POST" action="<%=request.getContextPath()%>/Supervivientes?a=actualizarnombre">
          <input type="text" class="form-control" name="nombre0" id="nombre0"  value="Minnie Mouse" required="required">
          <button type="submit" class="btn btn-primary">Actualizar</button>
        </form>
      </td>

      <td>Femenino</td>
      <td>
        <form method="POST" action="<%=request.getContextPath()%>/Supervivientes?a=actualizarpeso">
          <input type="number" class="form-control" name="peso0" id="peso0"  value="<%=50%>" required="required" min="1">
          <button type="submit" class="btn btn-primary">Actualizar</button>
        </form>
      </td>
      <td>
        <form method="POST" action="<%=request.getContextPath()%>/Supervivientes?a=actualizarfuerza">
          <input type="number" class="form-control" name="fuerza0" id="fuerza0"  value="<%=500%>" required="required" min="1">
          <button type="submit" class="btn btn-primary">Actualizar</button>
        </form>
      </td>
      <td>
        <form method="POST" action="<%=request.getContextPath()%>/Supervivientes?a=actualizarpareja">
          <input type="text" class="form-control" name="pareja0" id="pareja0"  value="Mickey Mouse" required="required">
          <button type="submit" class="btn btn-primary">Actualizar</button>
        </form>
      </td>

      <td>12</td>

    </tr>




    </tbody>
  </table>





</div>














<div class="modal fade" id="extraLargeModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Añadir Superviviente</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form method="POST" action="<%=request.getContextPath()%>/Supervivientes?a=anadirsuperviviente">
        <div class="modal-body">
          <div class="row justify-content-center">
            <div class="col-lg-12">
              <div class="card">
                <div class="row">
                  <div class="col-lg-5">
                    <div class="row px-2">
                      <div class="form-group col-md-6"><label class="form-control-label">Apellidos</label> <input type="text"  id="napellido" name="napellido" required="required" placeholder="Apellidos">  </div>
                      <div class="form-group col-md-6"> <label for="nnombre" class="form-control-label">Nombre(s)</label> <input type="text"  id="nnombre" name="nnombre" required="required" placeholder="Nombre" > </div>
                    </div>
                    <div class="row px-2">
                      <div class="form-group col-md-6"> <label class="form-control-label">N°identificacion</label> <input type="number" id="nidentificacion" name="nidentificacion" required="required" placeholder="identificador"> </div>
                      <div class="form-group col-md-6"> <label for="nsexo">Sexo</label><input type="text" class="form-control" id="nsexo" name="nsexo"  placeholder="Sexo"> </div>
                    </div>
                    <div class="row px-2">
                      <div class="form-group col-md-6"> <label class="form-control-label">Peso(en KG)</label> <input type="number"  id="npeso" name="npeso" required="required" min="1" placeholder="peso"> </div>
                      <div class="form-group col-md-6"> <label for="nfuerza">Fuerza(en N)</label><input type="number" class="form-control" id="nfuerza" name="nfuerza" min="1"  placeholder="Fuerza"> </div>
                    </div>
                    <div class="row px-2">
                      <div class="form-group col-md-6"> <label class="form-control-label">Peso Cargado(en KG)</label> <input type="number"  id="npesocargado" name="npesocargado" required="required" min="1" placeholder="pesocargado"> </div>
                      <div class="form-group col-md-6"> <label for="npareja">Pareja(Opcional)</label><input type="text" class="form-control" id="npareja" name="npareja"   placeholder="Pareja Opcional"> </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" >Añadir  Superviviente</button>
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
<script>

</script>
</html>
