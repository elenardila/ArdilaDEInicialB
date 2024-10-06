<%@page import="java.time.Period"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            StringBuilder mensaje = new StringBuilder("Hola ");
            String nombre = request.getParameter("nombre");
            LocalDate fechaIntroducida = LocalDate.parse(request.getParameter("fechaNacimiento"));
            LocalDate fechaActual = LocalDate.now();

            mensaje.append(nombre).append(", ");

            if (fechaIntroducida.isEqual(fechaActual)) {
                mensaje.append(" has nacido hoy.");
            } else if (fechaIntroducida.isAfter(fechaActual)) {
                mensaje.append(" no has nacido todavía.");

            } else {
                Period edad = Period.between(fechaIntroducida, fechaActual);
                boolean hasYears = edad.getYears() > 0;
                boolean hasMonths = edad.getMonths() > 0;
                boolean hasDays = edad.getDays() > 0;

                if (hasYears) {
                    mensaje.append("tienes ").append(edad.getYears()).append(" años");
                }
                if (hasMonths) {
                    if (hasYears) {
                        mensaje.append(", ");
                    } else {
                        mensaje.append("tienes ");
                    }
                    mensaje.append(edad.getMonths()).append(" meses");
                }
                if (hasDays) {
                    if (hasYears || hasMonths) {
                        mensaje.append(" y ");
                    } else {
                        mensaje.append("tienes ");
                    }
                    mensaje.append(edad.getDays()).append(" días");
                }
                mensaje.append(".");
            }

            out.println("<h1>" + mensaje.toString() + "</h1>");

        %>
    </body>
</html>
