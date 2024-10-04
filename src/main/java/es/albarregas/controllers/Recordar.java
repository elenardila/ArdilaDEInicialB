package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author elena
 */
public class Recordar extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String domicilio = request.getParameter("domicilio");

        if ( nombre.isEmpty() || fechaNacimiento.isEmpty() || domicilio.isEmpty()) {
            // Redirigir a la página de error con los datos del formulario como parámetros
            response.sendRedirect("Recordar?error=true&nombre=" + nombre + "&fechaNacimiento=" + fechaNacimiento + "&domicilio=" + domicilio);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String fechaNacimiento = request.getParameter("fechaNacimiento");
        String domicilio = request.getParameter("domicilio");
        boolean error = request.getParameter("error") != null;

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Formulario</title>");
        out.println("</head>");
        out.println("<body>");

        if (error) {
            out.println("<h1>Hubo un error en el formulario</h1>");
        }

        out.println("<form action=\"Recordar\" method=\"post\">");
        out.println("Nombre: <input type=\"text\" name=\"nombre\" value=\"" + (nombre != null ? nombre : "") + "\" /><br/>");
        out.println("Fecha de Nacimiento: <input type=\"date\" name=\"fechaNacimiento\" value=\"" + (fechaNacimiento != null ? fechaNacimiento : "") + "\" /><br/>");
        out.println("Domicilio: <input type=\"text\" name=\"domicilio\" value=\"" + (domicilio != null ? domicilio : "") + "\" /><br/>");

        Enumeration<String> parametros = request.getParameterNames();
        
        out.println("<input type=\"hidden\" name=\"nombre\" value=\"" + (nombre != null ? nombre : "") + "\" />");
        out.println("<input type=\"hidden\" name=\"fechaNacimiento\" value=\"" + (fechaNacimiento != null ? fechaNacimiento : "") + "\" />");
        out.println("<input type=\"hidden\" name=\"domicilio\" value=\"" + (domicilio != null ? domicilio : "") + "\" />");

        out.println("<input type=\"submit\" value=\"Enviar\" />");
        out.println("</form>");

        out.println("</body>");
        out.println("</html>");
    }
}
