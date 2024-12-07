<%--
  Created by IntelliJ IDEA.
  User: isaac
  Date: 07/12/2024
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Calendar, java.util.HashMap, java.util.Map" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Generador de Calendario</title>
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
    th {
      background-color: #f2f2f2;
    }
    .empty {
      background-color: #fff;
    }
  </style>
</head>
<body>
<h1>Generador de Calendario</h1>
<form method="post">
  <label for="mes">Nombre del Mes:</label>
  <input type="text" id="mes" name="mes" required><br><br>
  <label for="anio">Año:</label>
  <input type="number" id="anio" name="anio" required><br><br>
  <input type="submit" value="Generar Calendario">
</form>

<%
  String mes = null;
  Integer anio = null;
  String error = null;
  int mesNumero = -1;

  Map<String, Integer> meses = new HashMap<>();
  meses.put("enero", Calendar.JANUARY);
  meses.put("febrero", Calendar.FEBRUARY);
  meses.put("marzo", Calendar.MARCH);
  meses.put("abril", Calendar.APRIL);
  meses.put("mayo", Calendar.MAY);
  meses.put("junio", Calendar.JUNE);
  meses.put("julio", Calendar.JULY);
  meses.put("agosto", Calendar.AUGUST);
  meses.put("septiembre", Calendar.SEPTEMBER);
  meses.put("octubre", Calendar.OCTOBER);
  meses.put("noviembre", Calendar.NOVEMBER);
  meses.put("diciembre", Calendar.DECEMBER);

  if ("POST".equalsIgnoreCase(request.getMethod())) {
    mes = request.getParameter("mes").toLowerCase();
    try {
      anio = Integer.parseInt(request.getParameter("anio"));
      if (meses.containsKey(mes)) {
        mesNumero = meses.get(mes);
      } else {
        error = "Error: Nombre del mes no es válido.";
      }
    } catch (NumberFormatException e) {
      error = "Error: Por favor, introduce un año válido.";
    }
  }

  if (mesNumero != -1 && anio != null) {
    Calendar calendario = Calendar.getInstance();
    calendario.set(Calendar.MONTH, mesNumero);
    calendario.set(Calendar.YEAR, anio);
    calendario.set(Calendar.DAY_OF_MONTH, 1);

    int primerDiaDelMes = calendario.get(Calendar.DAY_OF_WEEK);
    int diasEnMes = calendario.getActualMaximum(Calendar.DAY_OF_MONTH);

%>
<h2>Calendario de <%= mes.substring(0, 1).toUpperCase() + mes.substring(1) %> <%= anio %></h2>
<table>
  <thead>
  <tr>
    <th>Domingo</th>
    <th>Lunes</th>
    <th>Martes</th>
    <th>Miércoles</th>
    <th>Jueves</th>
    <th>Viernes</th>
    <th>Sábado</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <% for (int i = 1; i < primerDiaDelMes; i++) { %>
    <td class="empty"></td>
    <% } %>

    <% for (int dia = 1; dia <= diasEnMes; dia++) { %>
    <td><%= dia %></td>
    <% if ((dia + primerDiaDelMes - 1) % 7 == 0) { %>
  </tr><tr>
    <% } %>
    <% } %>
  </tr>
  </tbody>
</table>
<%
} else if (error != null) {
%>
<p style="color: red;"><%= error %></p>
<%
  }
%>
</body>
</html>

