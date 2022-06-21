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
    <p class="titulo">Menú de Humanos</p>
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
    <tr>
      <th scope="row">322420696666</th>
      <td>El Pepe</td>
      <td>Masculino</td>
      <td><button type="button" class="btn btn-success" disabled>Superviviente ✅</button></td>
    </tr>
    <tr>
      <th scope="row">322420696667</th>
      <td>La Pepe</td>
      <td>Femenino</td>
      <td><button type="button" class="btn btn-danger" disabled>Zombie ☣️</button></td>
    </tr>
    <tr>
      <th scope="row">322420696666</th>
      <td>El Pepe</td>
      <td>Masculino</td>
      <td><button type="button" class="btn btn-success" disabled>Superviviente ✅</button></td>
    </tr>
    <tr>
      <th scope="row">322420696667</th>
      <td>La Pepe</td>
      <td>Femenino</td>
      <td><button type="button" class="btn btn-danger" disabled>Zombie ☣️</button></td>
    </tr>

    </tbody>
  </table>





</div>

</body>
</html>