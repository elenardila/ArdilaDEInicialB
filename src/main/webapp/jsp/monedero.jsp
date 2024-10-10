<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%! private double calcularVuelta(StringBuilder mensaje, double vuelta, double billete, String texto) {
            int cantidad = (int) (vuelta / billete);
            if (cantidad > 0) {
                mensaje.append("<li>").append(cantidad).append(" ").append(texto).append("</li>");
            }
            return vuelta % billete;
        }%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monedero</title>
    </head>
    <body>
        <h1>Tu vuelta es:</h1>
        <%
        double precio = Double.parseDouble(request.getParameter("precio"));
        double cantidad = Double.parseDouble(request.getParameter("cantidad"));
        double vuelta = cantidad - precio;
        if (vuelta < 0) {
            out.println("<p>No tiene suficiente dinero para pagar el producto.</p>");
        } else {
            StringBuilder mensaje = new StringBuilder("<p>La vuelta es:</p><ul>");

            vuelta = calcularVuelta(mensaje, vuelta, 500, "billete(s) de 500 euros");
            vuelta = calcularVuelta(mensaje, vuelta, 200, "billete(s) de 200 euros");
            vuelta = calcularVuelta(mensaje, vuelta, 100, "billete(s) de 100 euros");
            vuelta = calcularVuelta(mensaje, vuelta, 50, "billete(s) de 50 euros");
            vuelta = calcularVuelta(mensaje, vuelta, 20, "billete(s) de 20 euros");
            vuelta = calcularVuelta(mensaje, vuelta, 10, "billete(s) de 10 euros");
            vuelta = calcularVuelta(mensaje, vuelta, 5, "billete(s) de 5 euros");
            vuelta = calcularVuelta(mensaje, vuelta, 2, "moneda(s) de 2 euros");
            vuelta = calcularVuelta(mensaje, vuelta, 1, "moneda(s) de 1 euro");
            vuelta = calcularVuelta(mensaje, vuelta, 0.5, "moneda(s) de 0.50 euros");
            vuelta = calcularVuelta(mensaje, vuelta, 0.2, "moneda(s) de 0.20 euros");
            vuelta = calcularVuelta(mensaje, vuelta, 0.1, "moneda(s) de 0.10 euros");
            vuelta = calcularVuelta(mensaje, vuelta, 0.05, "moneda(s) de 0.05 euros");
            vuelta = calcularVuelta(mensaje, vuelta, 0.02, "moneda(s) de 0.02 euros");
            vuelta = calcularVuelta(mensaje, vuelta, 0.01, "moneda(s) de 0.01 euros");

            mensaje.append("</ul>");
            out.println(mensaje.toString());
        }
        
    %>
    <input type="button" name="Volver" value="Volver" onclick="history.back()">
    </body>
</html>
