<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder, java.net.URLDecoder" %>

<%
    Cookie cookie = null;
    String nombreUsuario = "";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("nombreUsuario")) {
                cookie = cookies[i];
                nombreUsuario = URLDecoder.decode(cookie.getValue(), "UTF-8");
                break;
            }
        }
    }
    String nombre = request.getParameter("nombre");
    String recordar = request.getParameter("recordar");

    if ("recordar".equals(recordar)) {
        Cookie nombreCookie = new Cookie("nombreUsuario", URLEncoder.encode(nombre, "UTF-8"));
        nombreCookie.setMaxAge(60 * 60 * 24 * 30);
        response.addCookie(nombreCookie);
        nombreUsuario = nombre;
    } else {
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("nombreUsuario")) {
                    cookies[i].setMaxAge(0);
                    response.addCookie(cookies[i]);
                    break;
                }
            }
        }
        nombreUsuario = "";
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recordar Usuario</title>
    </head>
    <body>
        <h1>Introduce los Datos</h1>
        <form action="recordarUsuario.jsp" method="post">
            <label>Nombre: </label>
            <input type="text" name="nombre" value="<%=nombreUsuario%>"><br><br>
            <label>Contraseña: </label>
            <input type="password" name="password" required><br><br>
            <input type="checkbox" name="recordar" value="recordar" <%= (nombreUsuario != null && !nombreUsuario.isEmpty()) ? "checked disabled" : ""%>>Recordar nombre<br>
            <input type="submit" value="Enviar">
            <input type="button" name="Volver" value="Volver" onclick="history.back()">
        </form>
    </body>
</html>