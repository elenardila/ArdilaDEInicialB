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
public class Datos2 extends HttpServlet {

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
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet Datos2</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>ERROR</h1>");

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
                while (parametros.hasMoreElements()) {
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
