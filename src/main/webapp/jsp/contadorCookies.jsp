<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>

<%
    Cookie cookie = null;
    Boolean existe = false;
    int visitas = 1;
    Cookie[] cookies = request.getCookies();
        if (cookies != null) {
        for (Cookie c : cookies) {
            if ("primeraCookie".equals(c.getName())) {
                cookie = c;
                existe = true;
                try {
                    visitas = Integer.parseInt(URLDecoder.decode(cookie.getValue(), "UTF-8")) + 1;
                } catch (NumberFormatException e) {
                    visitas = 1; 
                }
                break;
            }
        }
    }

    if (!existe) {
        cookie = new Cookie("primeraCookie", URLEncoder.encode(String.valueOf(visitas), "UTF-8"));
    } else {
        cookie.setValue(URLEncoder.encode(String.valueOf(visitas), "UTF-8"));
    }

    cookie.setMaxAge(3600); 
    response.addCookie(cookie);

    StringBuilder mensaje = new StringBuilder();
    mensaje.append(visitas);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Has visitado la página <%= mensaje.toString()%> veces</h1>
        <h2>Información de la Cookie</h2>
        <p>Caducidad de la cookie: <%= cookie.getMaxAge()%> segundos</p>
        <p>Nombre de la cookie: <%= cookie.getName()%></p>
        <p>Segura: <%= cookie.getSecure()%></p>
        <p>Versión: <%= cookie.getVersion()%></p>
        <form action="contadorCookies.jsp" mothod="post">
            <span class="botones"><input type="submit" value="Recargar" name="recarga"/></span>
            <span class="botones"><input type="button" value="Menu" name="menu" onclick="history.back()"/></span>
        </form>
    </body>
</html>
