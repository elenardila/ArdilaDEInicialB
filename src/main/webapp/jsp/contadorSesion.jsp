<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contador Sesion</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession(true);
            Integer contador = (Integer) sesion.getAttribute("contadorVisitas");

            if (contador == null) {
                contador = 0;
            }

            if ("eliminar".equals(request.getParameter("accion"))) {
                sesion.invalidate();
                sesion = request.getSession(true);
                contador = 0;
            } else {
                contador++;
            }

            sesion.setAttribute("contadorVisitas", contador);
        %>
        <h1>Has visitado la página <%= contador%> veces</h1>

        <form method="post">
            <input type="checkbox" name="accion" value="eliminar"> Eliminar sesión
            <br>
            <input type="submit" value="Recargar página">
            <input type="button" value="Volver" onclick="history.back()">
        </form>
    </body>
</html>
