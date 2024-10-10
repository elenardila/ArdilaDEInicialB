<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado de la Conversión</title>
    </head>
    <body>
        <%
            double numero = Double.parseDouble(request.getParameter("numero"));
            String monedaOriginal = request.getParameter("monedaOriginal");
            String monedaFinal = request.getParameter("monedaFinal");

            // Tasas de cambio ficticias para el ejemplo
            double tasaOrigen = 1.0;
            double tasaDestino = 1.0;

            if ("euros".equals(monedaOriginal)) {
                tasaOrigen = 1.0;
            } else if ("libras".equals(monedaOriginal)) {
                tasaOrigen = 0.84;
            } else if ("yenes".equals(monedaOriginal)) {
                tasaOrigen = 162.70;
            } else if ("dolares".equals(monedaOriginal)) {
                tasaOrigen = 1.1;
            }

            if ("euros".equals(monedaFinal)) {
                tasaDestino = 1.0;
            } else if ("libras".equals(monedaFinal)) {
                tasaDestino = 0.84;
            } else if ("yenes".equals(monedaFinal)) {
                tasaDestino = 162.70;
            } else if ("dolares".equals(monedaFinal)) {
                tasaDestino = 1.1;
            }

            double resultado = (numero / tasaOrigen) * tasaDestino;
        %>
        <h1>Resultado de la Conversión</h1>
        <p><%= numero%> <%= monedaOriginal%> son <%= resultado%> <%= monedaFinal%>.</p>
    </body>
</html>
