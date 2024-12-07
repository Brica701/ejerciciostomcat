<%--
  Created by IntelliJ IDEA.
  User: isaac
  Date: 07/12/2024
  Time: 13:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Máquina de Helados</title>
  <style>
    .tarrina {
      width: 300px;
      height: 300px;
      border: 1px solid black;
      position: relative;
      margin: 20px auto;
      display: flex;
      flex-direction: column;
      justify-content: flex-end;
    }
    .sabor {
      width: 100%;
    }
    .chocolate {
      background-color: #8B4513;
    }
    .fresa {
      background-color: #FF69B4;
    }
    .vainilla {
      background-color: #FFFFE0;
    }
  </style>
</head>
<body>
<h1>Máquina de Helados</h1>
<form method="post">
  <label for="chocolate">Porcentaje de Chocolate:</label>
  <input type="number" id="chocolate" name="chocolate" min="0" max="100" required><br><br>
  <label for="fresa">Porcentaje de Fresa:</label>
  <input type="number" id="fresa" name="fresa" min="0" max="100" required><br><br>
  <label for="vainilla">Porcentaje de Vainilla:</label>
  <input type="number" id="vainilla" name="vainilla" min="0" max="100" required><br><br>
  <input type="submit" value="Generar Helado">
</form>

<%
  int chocolate = request.getParameter("chocolate") != null ? Integer.parseInt(request.getParameter("chocolate")) : 0;
  int fresa = request.getParameter("fresa") != null ? Integer.parseInt(request.getParameter("fresa")) : 0;
  int vainilla = request.getParameter("vainilla") != null ? Integer.parseInt(request.getParameter("vainilla")) : 0;
  int suma = chocolate + fresa + vainilla;

  if (suma > 100) {
%>
<p style="color: red;">La suma de los porcentajes debe ser menor o igual que 100. Por favor, introduzca de nuevo los porcentajes.</p>
<%
} else if (suma > 0) {
%>
<div class="tarrina">
  <% if (chocolate > 0) { %>
  <div class="sabor chocolate" style="height: <%= chocolate %>%;">Chocolate: <%= chocolate %>%</div>
  <% } %>
  <% if (fresa > 0) { %>
  <div class="sabor fresa" style="height: <%= fresa %>%;">Fresa: <%= fresa %>%</div>
  <% } %>
  <% if (vainilla > 0) { %>
  <div class="sabor vainilla" style="height: <%= vainilla %>%;">Vainilla: <%= vainilla %>%</div>
  <% } %>
</div>
<%
  }
%>
</body>
</html>
