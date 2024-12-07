<%--
  Created by IntelliJ IDEA.
  User: isaac
  Date: 07/12/2024
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Calcular Media de Notas</title>
</head>
<body>
<%
    Double nota1 = null;
    Double nota2 = null;
    Double nota3 = null;
    Double media = null;
    String error = null;

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            nota1 = Double.parseDouble(request.getParameter("nota1"));
            nota2 = Double.parseDouble(request.getParameter("nota2"));
            nota3 = Double.parseDouble(request.getParameter("nota3"));
            media = (nota1 + nota2 + nota3) / 3;
        } catch (NumberFormatException e) {
            error = "Error: Por favor, introduce números válidos para las notas.";
        }
    }
%>

<h1>Introduce tus notas</h1>
<form method="post">
    <label for="nota1">Nota 1:</label>
    <input type="number" id="nota1" name="nota1" step="0.01" required><br><br>
    <label for="nota2">Nota 2:</label>
    <input type="number" id="nota2" name="nota2" step="0.01" required><br><br>
    <label for="nota3">Nota 3:</label>
    <input type="number" id="nota3" name="nota3" step="0.01" required><br><br>
    <input type="submit" value="Calcular Media">
</form>

<% if (error != null) { %>
<p style="color: red;"><%= error %></p>
<% } else if (media != null) { %>
<h2>Resultado de la Media</h2>
<p>La media de las notas introducidas es: <%= String.format("%.2f", media) %></p>
<% } %>
</body>
</html>

