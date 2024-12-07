<%--
  Created by IntelliJ IDEA.
  User: isaac
  Date: 07/12/2024
  Time: 13:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Tabla de Multiplicar</title>
  <style>
    table {
      width: 50%;
      border-collapse: collapse;
      margin: 20px auto;
    }
    table, th, td {
      border: 1px solid black;
    }
    th, td {
      padding: 10px;
      text-align: center;
    }
  </style>
</head>
<body>
<h1>Calcula la Tabla de Multiplicar</h1>
<form method="post">
  <label for="numero">Introduce un número:</label>
  <input type="number" id="numero" name="numero" required><br><br>
  <input type="submit" value="Calcular">
</form>

<%
  Integer numero = null;
  String error = null;

  if ("POST".equalsIgnoreCase(request.getMethod())) {
    try {
      numero = Integer.parseInt(request.getParameter("numero"));
    } catch (NumberFormatException e) {
      error = "Error: Por favor, introduce un número válido.";
    }
  }

  if (numero != null) {
%>
<h2>Tabla de Multiplicar del <%= numero %></h2>
<table>
  <thead>
  <tr>
    <th>Multiplicador</th>
    <th>Resultado</th>
  </tr>
  </thead>
  <tbody>
  <% for (int i = 1; i <= 10; i++) { %>
  <tr>
    <td><%= numero %> x <%= i %></td>
    <td><%= numero * i %></td>
  </tr>
  <% } %>
  </tbody>
</table>
<% } %>

<% if (error != null) { %>
<p style="color: red;"><%= error %></p>
<% } %>
</body>
</html>


