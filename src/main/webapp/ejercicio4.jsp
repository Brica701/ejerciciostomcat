<%--
  Created by IntelliJ IDEA.
  User: isaac
  Date: 07/12/2024
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Conversor de Dólares a Euros</title>
</head>
<body>
<%
  Double dolares = null;
  Double euros = null;
  String error = null;

  if ("POST".equalsIgnoreCase(request.getMethod())) {
    try {
      dolares = Double.parseDouble(request.getParameter("dolares"));
      double tipoDeCambio = 0.85;
      euros = dolares * tipoDeCambio;
    } catch (NumberFormatException e) {
      error = "Error: Por favor, introduce una cantidad válida en dólares.";
    }
  }
%>

<h1>Conversor de Dólares a Euros</h1>
<form method="post">
  <label for="dolares">Cantidad en Dólares:</label>
  <input type="number" id="dolares" name="dolares" step="0.01" required><br><br>
  <input type="submit" value="Convertir">
</form>

<% if (error != null) { %>
<p style="color: red;"><%= error %></p>
<% } else if (euros != null) { %>
<h2>Resultado de la Conversión</h2>
<p><%= dolares %> dólares son <%= String.format("%.2f", euros) %> euros.</p>
<% } %>
</body>
</html>

