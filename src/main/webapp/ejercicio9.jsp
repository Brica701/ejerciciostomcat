<%--
  Created by IntelliJ IDEA.
  User: isaac
  Date: 07/12/2024
  Time: 13:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tablero de Ajedrez</title>
    <style>
        table {
            width: 40%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
            height: 50px;
            width: 50px;
        }
        .black {
            background-color: #000000;
            color: #ffffff;
        }
        .white {
            background-color: #ffffff;
        }
        .piece {
            font-size: 1.5em;
        }
    </style>
</head>
<body>
<h1>Tablero de Ajedrez</h1>

<%
    Random random = new Random();
    int[][] board = new int[8][8];

    int bishopRow, bishopCol;
    bishopRow = random.nextInt(8);
    bishopCol = random.nextInt(8);
    board[bishopRow][bishopCol] = 1;


    int knightRow, knightCol;
    do {
        knightRow = random.nextInt(8);
        knightCol = random.nextInt(8);
    } while (knightRow == bishopRow && knightCol == bishopCol);
    board[knightRow][knightCol] = 2;
%>

<table>
    <thead>
    <tr>
        <th></th>
        <% for (int col = 0; col < 8; col++) { %>
        <th><%= (char) ('A' + col) %></th>
        <% } %>
    </tr>
    </thead>
    <tbody>
    <% for (int row = 0; row < 8; row++) { %>
    <tr>
        <th><%= (row + 1) %></th>
        <% for (int col = 0; col < 8; col++) { %>
        <td class="<%= (row + col) % 2 == 0 ? "white" : "black" %>">
            <% if (board[row][col] == 1) { %>
            <span class='piece'>♝</span>
            <% } else if (board[row][col] == 2) { %>
            <span class='piece'>♞</span>
            <% } %>
        </td>
        <% } %>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>

