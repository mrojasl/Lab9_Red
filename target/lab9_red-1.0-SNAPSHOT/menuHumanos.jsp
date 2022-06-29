<%@ page import="pe.edu.pucp.lab9_red.beans.Humano" %><%--
  Created by IntelliJ IDEA.
  User: Angel
  Date: 0020, 20 de junio del 2022
  Time: 09:55p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="listaHumanos" scope="request" type="java.util.ArrayList<pe.edu.pucp.lab9_red.beans.Humano>"/>
<html>
<head>
  <link rel="icon" href="icon.png">
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
    <p class="titulo">Menú de Humanos <img src="totalista.png" alt="Haunt" style="width: 65px;height: 55px"></p>
  </div>
  <table class="table table-hover table-dark">
    <thead>
    <tr>
      <th scope="col">Número de identificación</th>
      <th scope="col">Nombres</th>
      <th scope="col">Sexo</th>
      <th scope="col">Estado</th>
    </tr>
    </thead>
    <tbody>
      <%for(Humano humano: listaHumanos){%>
    <tr>
      <th scope="row"><%=humano.getIdHumano()%></th>
      <td><%=humano.getNombre()+" "+humano.getApellido()%></td>
      <td><%=humano.getSexo()%></td>
      <%if(!humano.getEstadoZombie()){%>
        <td><button type="button" class="btn btn-success" disabled>Superviviente ✅</button></td>
      <%}else{%>
        <td><button type="button" class="btn btn-danger" disabled>Zombie ☣️</button></td>
      <%}%>
    </tr>
      <%}%>
    </tbody>
  </table>





</div>

</body>
</html>
