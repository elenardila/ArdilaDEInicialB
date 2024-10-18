<%@page import="javax.servlet.http.Cookie"%>
<%@page import="java.io.IOException"%>
<%
    String nombre = request.getParameter("nombre");
    String valor = request.getParameter("valor");
    String accion = request.getParameter("accion");
    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;
    
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals(nombre)) {
                cookie = cookies[i];
                break;
            }
        }
    }

    String mensaje = "";

    switch (accion) {
        case "Crear":
            if (cookie == null) {
                cookie = new Cookie(nombre, valor);
                response.addCookie(cookie);
                mensaje = "Cookie creada: " + nombre + " = " + valor;
            } else {
                mensaje = "La cookie ya existe.";
            }
            break;
        case "Visualizar":
            if (cookie != null) {
                mensaje = "Valor de la cookie " + nombre + ": " + cookie.getValue();
            } else {
                mensaje = "La cookie no existe.";
            }
            break;
        case "Modificar":
            if (cookie != null) {
                cookie.setValue(valor);
                response.addCookie(cookie);
                mensaje = "Cookie modificada: " + nombre + " = " + valor;
            } else {
                mensaje = "La cookie no existe.";
            }
            break;
        case "Eliminar":
            if (cookie != null) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                mensaje = "Cookie eliminada: " + nombre;
            } else {
                mensaje = "La cookie no existe.";
            }
            break;
        case "Volver":
            mensaje = "Volviendo al menú.";
            break;
    }

    request.setAttribute("mensaje", mensaje);
    response.sendRedirect("menuCookie.jsp");
%>
