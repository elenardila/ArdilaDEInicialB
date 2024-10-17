<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Cookie cookie = null;
    Boolean existe = false;

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("nombreConCookie")) {
                cookie = cookies[i];
                break;
            }
        }
    }
    
    if (cookie == null){
        cookie = new Cookie("nombreConCookie", URLEncoder.encode("Elena Ardila Delgado", "UTF-8"));
    } else {
        existe = Boolean.TRUE;
    }
    
    cookie.setMaxAge(3600);
    response.addCookie(cookie);
    StringBuilder mensaje = new StringBuilder();
    
    if(existe){
    mensaje.append("Hola ").append(URLDecoder.decode(cookie.getValue(), "UTF-8"));
    } else {
        mensaje.append("No tenemos datos tuyos todavía");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mi nombre en una cookie</title>
    </head>
    <body>
        <h1><%= mensaje.toString()%></h1>
        <form action="miNombre.jsp" mothod="post">
            <span class="botones"><input type="submit" value="Recargar" name="recarga"/></span>
            <span class="botones"><input type="button" value="Menu" name="menu"onclick="history.back()"/></span>
        </form>
    </body>
</html>
