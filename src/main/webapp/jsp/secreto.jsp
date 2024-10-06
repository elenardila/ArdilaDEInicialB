<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Random"%>
<%
    Random random = new Random();
    String numeroPensadoStr = request.getParameter("numeroPensado");
    String intentosIntroducidos = request.getParameter("intentos");
    String historialNumeros = request.getParameter("historialNumeros");
    String historialMensajes = request.getParameter("historialMensajes");
    int numeroPensado;
    int contadorIntentos;
    String mensaje = "";
    String resultado = "";

    if (numeroPensadoStr == null || intentosIntroducidos == null) {
        numeroPensado = random.nextInt(100) + 1;
        contadorIntentos = 0;
        historialNumeros = "";
        historialMensajes = "";
    } else {
        numeroPensado = Integer.parseInt(numeroPensadoStr);
        contadorIntentos = Integer.parseInt(intentosIntroducidos);
    }

    String numeroIntroducido = request.getParameter("numero");
    if (numeroIntroducido != null) {
        int numero = Integer.parseInt(numeroIntroducido);
        contadorIntentos++;
        if (numero < numeroPensado) {
            mensaje = "Es mayor";
        } else if (numero > numeroPensado) {
            mensaje = "Es menor";
        } else {
            mensaje = "¡Acertado!";
            resultado = "Número de intentos: " + contadorIntentos;
            numeroPensado = random.nextInt(100) + 1; // Reiniciar el juego
            contadorIntentos = 0;
            historialNumeros = "";
            historialMensajes = "";
        }
        historialNumeros += numero + ",";
        historialMensajes += mensaje + ",";
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juego del Número Secreto</title>
    </head>
    <body>
        <h1>Juego del Número Secreto</h1>
        <form method="post">
            <label for="numero">Introduce un número entre 1 y 100:</label>
            <select name="numero" id="numero">
                <% for (int i = 1; i <= 100; i++) {%>
                <option value="<%= i%>"><%= i%></option>
                <% }%>
            </select>
            <input type="hidden" name="numeroPensado" value="<%= numeroPensado%>">
            <input type="hidden" name="intentos" value="<%= contadorIntentos%>">
            <input type="hidden" name="historialNumeros" value="<%= historialNumeros%>">
            <input type="hidden" name="historialMensajes" value="<%= historialMensajes%>">
            <button type="submit">Comprobar</button>
        </form>
        <table border="1">
            <tr>
                <th>Número</th>
                <th>Mensaje</th>
            </tr>
            <%
                if (historialNumeros != null && !historialNumeros.isEmpty()) {
                    String[] numeros = historialNumeros.split(",");
                    String[] mensajes = historialMensajes.split(",");
                    for (int i = 0; i < numeros.length; i++) {
            %>
            <tr>
                <td><%= numeros[i]%></td>
                <td><%= mensajes[i]%></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        <p><%= resultado%></p>

    </body>
</html>
