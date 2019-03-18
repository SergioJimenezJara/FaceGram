/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.PostFacade;
import dao.UsuarioFacade;
import java.io.IOException;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Post;
import model.Usuario;

/**
 *
 * @author julio
 */
@WebServlet("/registro")
public class servletRegistro extends HttpServlet {

    @EJB
    UsuarioFacade usuarioFacade;

    @EJB
    PostFacade postFacade;

    private static final String SUCCESS = "/login.jsp";
    private static final String ERROR = "/createuser_form.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        Usuario usuario = null;

        try {
            //Datos del formulario
            usuario = new Usuario();

            //Buscamos si el correo ya está registrado en la plataforma
            usuario = usuarioFacade.comprobarUsuario(usuario.getCorreo());

            if (usuario != null) {
                //Dado que lo encuentra, el usuario ya existe, damos un mensaje de error
                request.setAttribute("error", "Ya existe una cuenta con ese correo");
                request.getRequestDispatcher(ERROR).forward(request, response);

            } else {
                usuario.setUsuario(request.getParameter("username"));
                usuario.setCorreo(request.getParameter("email"));
                usuario.setPass(request.getParameter("password"));
                // Si es nulo, no está en la base de datos y lo registramos
                usuarioFacade.registrarUsuario(usuario);
                //Lo enviamos a su página principal
                request.getRequestDispatcher(SUCCESS).forward(request, response);

            }

        } catch (Exception ex) {
            request.setAttribute("error", "Error al registrar");
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
