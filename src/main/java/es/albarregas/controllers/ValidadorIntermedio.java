package es.albarregas.controllers;

import static java.io.FileDescriptor.out;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author elena
 */
@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class ValidadorIntermedio extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        StringBuilder formulario = new StringBuilder();
        formulario.append("<html>");
        formulario.append("<head>");
        formulario.append("<title>Formulario</title>");
        formulario.append("</head>");
        formulario.append("<body>");
        formulario.append("<h1>Entrada de datos</h1>");
        formulario.append("<form action=\"ValidadorIntermedio\" method=\"post\">");
        formulario.append("<label>Nombre: </label>");
        formulario.append("<input type=\"text\" name=\"nombre\"><br>");
        formulario.append("<br>");
        formulario.append("<label>Apellido: </label>");
        formulario.append("<input type=\"text\" name=\"apellido\"><br>");
        formulario.append("<br>");
        formulario.append("<label>Fecha de nacimiento: </label><br>");
        formulario.append("<input type=\"date\" name=\"nacimiento\"><br>");
        formulario.append("<br>");
        formulario.append("<label>Preferencias:</label><br>");
        formulario.append("<input type=\"checkbox\" name=\"op1\" value=\"musica\"> M&uacute;sica<br>");
        formulario.append("<input type=\"checkbox\" name=\"op2\" value=\"cine\"> Cine<br>");
        formulario.append("<input type=\"checkbox\" name=\"op3\" value=\"teatro\">Teatro<br>");
        formulario.append("<input type=\"checkbox\" name=\"op4\" value=\"videojuegos\"> Videojuegos<br>");
        formulario.append("<br>");
        formulario.append("<label>Selecciona la opci&oacute;n:</label><br>");
        formulario.append("<select id=\"sistemas_operativos\" name=\"sistemas-operativos\" required>");
        formulario.append("<option value=\"windows\">Windows</option>");
        formulario.append("<option value=\"macos\">macOS</option>");
        formulario.append("<option value=\"linux\">Linux</option><br>");
        formulario.append("</select>");
        formulario.append("<br><br>");
        formulario.append("<label>Seleccione su género:</label><br>");
        formulario.append("<input type=\"radio\" id=\"masculino\" name=\"genero\" value=\"masculino\">");
        formulario.append("<label for=\"masculino\">Masculino</label><br>");
        formulario.append("<input type=\"radio\" id=\"femenino\" name=\"genero\" value=\"femenino\" checked>");
        formulario.append("<label for=\"femenino\">Femenino</label><br>");
        formulario.append("<input type=\"radio\" id=\"otros\" name=\"genero\" value=\"otros\">");
        formulario.append("<label for=\"otros\">Otros</label><br>");
        formulario.append("<br>");
        formulario.append("<input type=\"submit\" name=\"primera\" value=\"Enumeration\">");
       
        formulario.append("</form>");
        formulario.append("</body>");
        formulario.append("</html>");
        out.println(formulario.toString());

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Datos2</title>");
            out.println("</head>");
            out.println("<body>");

            if (request.getParameter("enumeration") != null) {
                Enumeration<String> parametros = request.getParameterNames();
                boolean error = false;
                while (parametros.hasMoreElements() && !error) {
                    String nombre = parametros.nextElement();
                    out.println("<p>El valor de " + nombre + " es " + request.getParameter(nombre) + "</p>");

                }
            } else {

                Map<String, String[]> parametrosMap = request.getParameterMap();
                for (Map.Entry<String, String[]> entry : parametrosMap.entrySet()) {
                    String paramName = entry.getKey();
                    String[] paramValues = entry.getValue();
                    out.println("Nombre del parámetro: " + paramName);
                    for (String value : paramValues) {
                        out.println("Valor del parámetro: " + value);
                    }
                }
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
