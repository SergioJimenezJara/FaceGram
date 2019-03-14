/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.AmigoFacade;
import dao.UsuarioFacade;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;

/**
 *
 * @author Jimmy-Dev
 */
@WebServlet("/amigos")
public class servletAmigos extends HttpServlet {

    @EJB
    AmigoFacade amigoFacade;

    private static final String SUCCESS = "amigos.jsp";
    private static final String ERROR = "amigos.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        try {
            //Datos del usuario
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

            //Buscar amigos del usuario
            List<Usuario> amigos;
            amigos = amigoFacade.traerAmigos(usuario);

            if (amigos == null) {
                request.setAttribute("error", "No se han encontrado amigos");
                request.getRequestDispatcher(ERROR).forward(request, response);
            } else {
                //Guardar en la sesión
                request.getSession().setAttribute("amigos", amigos);
                request.getRequestDispatcher(SUCCESS).forward(request, response);
            }

        } catch (Exception ex) {
            request.setAttribute("error", "Error al conectar");
            request.getRequestDispatcher(ERROR).forward(request, response);
        }
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
