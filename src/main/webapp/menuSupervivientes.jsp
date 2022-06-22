<%@ page import="pe.edu.pucp.lab9_red.beans.Superviviente" %>
<%@ page import="pe.edu.pucp.lab9_red.beans.Humano" %><%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 0020, 20 de junio del 2022
  Time: 09:55p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaSuper" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab9_red.beans.Superviviente>"/>
<jsp:useBean id="filtroSuper" scope="request" type="java.lang.String"/>
<jsp:useBean id="parejas" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab9_red.beans.Superviviente>"/>
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
      <form method="POST" action="<%=request.getContextPath()%>/?action=filtrarSuper">
        <select id="sexoseleccionado" name="filtroSuper" class="form-control">
          <option value="Todo" <%=filtroSuper.equals("Todo")? "selected" : ""%>>Todo</option>
          <option value="Masculino" <%=filtroSuper.equals("Masculino")? "selected" : ""%>>Masculino</option>
          <option value="Femenino" <%=filtroSuper.equals("Femenino")? "selected" : ""%>>Femenino</option>
          <option value="Otro" <%=filtroSuper.equals("Otro")? "selected" : ""%>>otro</option>
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
      <th scope="col">Edición | Eliminar</th>
    </tr>
    </thead>
    <tbody>
    <%for(Superviviente sp :listaSuper){%>
    <form method="POST" action="<%=request.getContextPath()%>/?action=actualizarSuper">
    <tr>
      <input type="hidden" name="idSuper" value="<%=sp.getIdHumano()%>">
      <input type="hidden" name="filtroSuper" value="<%=filtroSuper%>">
      <th scope="row"><%=sp.getIdHumano()%></th>
      <td>
       <input type="text" class="form-control" name="nombre"  value="<%=sp.getNombre()+" "+sp.getApellido()%>" required="required">
      </td>
      <td><%=sp.getSexo()%></td>
      <td>
          <input type="number" class="form-control" name="peso"   value="<%=sp.getPeso()%>" required="required" min="1" step="any">
      </td>
      <td>
          <%double pesoCargado=Math.round(sp.getPesoCargado()*100)/(100.0);%>
          <input type="number" class="form-control" name="fuerza" value="<%=sp.getFuerza()%>" required="required" min="<%=pesoCargado*9.8%>"  step="any">
      </td>
      <td>
        <select name="idpareja" class="form-control">
          <option value="Soltero" <%=sp.getIdPareja()==null? "selected" : ""%>>Soltero</option>
          <%for(Superviviente pareja: parejas){%>
            <%if(!pareja.getIdHumano().equals(sp.getIdHumano())){%>
              <option value="<%=pareja.getIdHumano()%>" <%=pareja.getIdHumano().equals(sp.getIdPareja())?"selected" : ""%>><%=pareja.getNombre()+" "+pareja.getApellido()%></option>
            <%}%>
          <%}%>
        </select>
      </td>
      <td><%=pesoCargado%></td>
      <td><button type="submit" class="btn btn-primary">Actualizar</button>
    </form>
          <form method="POST" action="<%=request.getContextPath()%>/?action=eliminar">
            <input type="hidden" name="idSuper" value="<%=sp.getIdHumano()%>">
            <input type="hidden" value="<%=filtroSuper%>" name="filtroSuper">
            <button type="submit" class="btn btn-danger">Eliminar</button>
          </form>
      </td>
    </tr>

    <%}%>
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
      <form method="POST" action="<%=request.getContextPath()%>/?action=anadirsuperviviente">
        <div class="modal-body">
          <div class="row justify-content-center">
            <div class="col-lg-12">
              <div class="card">
                <div class="row">
                  <div class="col-lg-5">
                    <div class="row px-2">
                      <input type="hidden" name="filtroSuper" value="<%=filtroSuper%>">
                      <div class="form-group col-md-6"><label class="form-control-label">Apellidos</label> <input type="text"  id="napellido" name="napellido" required="required" placeholder="Apellidos">  </div>
                      <div class="form-group col-md-6"> <label for="nnombre" class="form-control-label">Nombre(s)</label> <input type="text"  id="nnombre" name="nombre" required="required" placeholder="Nombre" > </div>
                    </div>
                    <div class="row px-2">
                      <div class="form-group col-md-6"> <label class="form-control-label">Peso(en KG)</label> <input type="number"  id="npeso" name="peso" required="required" min="1" step="any" placeholder="peso"> </div>
                      <div class="form-group col-md-6"> <label for="nfuerza">Fuerza(en N)</label><input type="number" class="form-control" id="fuerza" required="required" name="fuerza" min="1" step="any" placeholder="Fuerza"></div>
                    </div>
                    <div class="row px-2">
                      <div class="form-group col-md-6"> <label for="nsexo">Sexo</label>
                        <select id="nsexo" name="sexo" class="form-control">
                          <option value="Masculino">Masculino</option>
                          <option value="Femenino">Femenino</option>
                          <option value="Otro" >otro</option>
                        </select>
                      </div>
                      <div class="form-group col-md-6"> <label for="npareja">Pareja(Opcional)</label>
                        <select name="idpareja" class="form-control">
                          <option value="Soltero">Soltero</option>
                          <%for(Superviviente pareja: parejas){%>
                            <%if(pareja.getIdPareja()==null){%>
                              <option value="<%=pareja.getIdHumano()%>"><%=pareja.getNombre()+ " "+pareja.getApellido()%></option>
                            <%}%>
                          <%}%>
                        </select>
                      </div>
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
