<%@page import="java.time.Period"%>
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
                boolean hayAnios = edad.getYears() > 0;
                boolean hayMeses = edad.getMonths() > 0;
                boolean hayDias = edad.getDays() > 0;

                if (hayAnios) {
                    mensaje.append("tienes ").append(edad.getYears()).append(" años");
                }
                if (hayMeses) {
                    if (hayAnios) {
                        mensaje.append(", ");
                    } else {
                        mensaje.append("tienes ");
                    }
                    mensaje.append(edad.getMonths()).append(" meses");
                }
                if (hayDias) {
                    if (hayAnios || hayMeses) {
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
