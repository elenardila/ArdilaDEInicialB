<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu Cookie</title>
    </head>
    <body>
        <h1>Control de Cookies</h1>
        <form action="controlCookie.jsp" method="post">
        <label for="nombre">Nombre de la Cookie:</label>
        <input type="text" id="nombre" name="nombre" required><br>
        
        <label for="valor">Valor de la Cookie:</label>
        <input type="text" id="valor" name="valor"><br>
        
        <input type="submit" name="accion" value="Crear">
        <input type="submit" name="accion" value="Visualizar">
        <input type="submit" name="accion" value="Modificar">
        <input type="submit" name="accion" value="Eliminar">
        <input type="submit" name="accion" value="Volver">
    </form>

    <div>
        <% 
            String mensaje = (String) request.getAttribute("mensaje");
            if (mensaje != null) {
                out.println(mensaje);
            }
        %>
    </div>
    </body>
</html>
