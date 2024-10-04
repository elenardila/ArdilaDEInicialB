<%@page import="java.time.LocalTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saludo</title>
        <link href="<%= request.getContextPath() %>/css/estilo.css">
    </head>
    <body>
        <% 
        StringBuilder mensaje = new StringBuilder("Buen");
        int horas = LocalTime.now().getHour();
        String sexo = (request.getParameter("sexo").equals("Hombre")) ? " señor ":" señora ";
        if(horas>=8 && horas <13) {
            mensaje.append("os dias");
            } else if (horas >=13&& horas<20) {
            mensaje.append("as tardes");
            } else {
            mensaje.append("as noches");
            }
        mensaje.append(sexo).append(request.getParameter("nombre"));
        %>
        <h2><%= mensaje.toString() %></h2>
        <p><a href="<%= request.getContextPath() %>"</a>Menú</p>
    </body>
</html>
