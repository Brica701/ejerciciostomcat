<%--
  Created by IntelliJ IDEA.
  User: isaac
  Date: 07/12/2024
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Configurador de Interior de Vehículo</title>
  <style>
    .car-interior {
      border: 1px solid black;
      padding: 20px;
      margin: 20px auto;
      width: 60%;
      text-align: center;
    }
    .tapiceria-blanco { background-color: #ffffff; color: black; }
    .tapiceria-negro { background-color: #000000; color: white; }
    .tapiceria-berenjena { background-color: #800080; color: white; }
    .moldura-madera { border: 5px solid #8B4513; }
    .moldura-carbono { border: 5px solid #2F4F4F; }
  </style>
</head>
<body>
<h1>Configurador de Interior de Vehículo</h1>
<form method="post">
  <label for="tapiceria">Color de la Tapicería:</label>
  <select id="tapiceria" name="tapiceria" required>
    <option value="blanco">Blanco</option>
    <option value="negro">Negro</option>
    <option value="berenjena">Berenjena</option>
  </select><br><br>
  <label for="moldura">Material de las Molduras:</label>
  <select id="moldura" name="moldura" required>
    <option value="madera">Madera</option>
    <option value="carbono">Carbono</option>
  </select><br><br>
  <input type="submit" value="Mostrar Interior">
</form>

<%
  String tapiceria = request.getParameter("tapiceria");
  String moldura = request.getParameter("moldura");

  String tapiceriaClase = "";
  String molduraClase = "";

  if (tapiceria != null) {
    switch (tapiceria) {
      case "blanco":
        tapiceriaClase = "tapiceria-blanco";
        break;
      case "negro":
        tapiceriaClase = "tapiceria-negro";
        break;
      case "berenjena":
        tapiceriaClase = "tapiceria-berenjena";
        break;
    }
  }

  if (moldura != null) {
    switch (moldura) {
      case "madera":
        molduraClase = "moldura-madera";
        break;
      case "carbono":
        molduraClase = "moldura-carbono";
        break;
    }
  }
%>

<% if (tapiceria != null && moldura != null) { %>
<div class="car-interior <%= tapiceriaClase %> <%= molduraClase %>">
  <h2>Configuración del Interior del Vehículo</h2>
  <p>Tapicería: <%= tapiceria.substring(0, 1).toUpperCase() + tapiceria.substring(1) %></p>
  <p>Moldura: <%= moldura.substring(0, 1).toUpperCase() + moldura.substring(1) %></p>
</div>
<% } %>
</body>
</html>
