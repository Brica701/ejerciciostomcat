<%--
  Created by IntelliJ IDEA.
  User: isaac
  Date: 25/11/24
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Saludo Multilingüe</title>
</head>
<body>
<%
    String nombre = request.getParameter("nombre");
    String idioma = request.getParameter("idioma");
    String saludo = null;
    if (nombre != null && idioma != null) {
        switch (idioma) {
            case "es":
                saludo = "Hola";
                break;
            case "pt":
                saludo = "Olá";
                break;
            case "en":
                saludo = "Hello";
                break;
            default:
                saludo = "Hola";
        }
    }
%>

<h1>Introduce tu nombre y selecciona un idioma</h1>
<form method="post">
    <label for="nombre">Nombre:</label>
    <input type="text" id="nombre" name="nombre" required><br><br>
    <label for="idioma">Selecciona un idioma:</label>
    <select id="idioma" name="idioma">
        <option value="es">Español</option>
        <option value="pt">Portugués</option>
        <option value="en">Inglés</option>
    </select><br><br>
    <input type="submit" value="Saludar">
</form>

<% if (saludo != null) { %>
<h1><%= saludo %> <%= nombre %>!</h1>
<% } %>
</body>
</html>
