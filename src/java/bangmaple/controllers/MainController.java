/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bangmaple
 */
public class MainController extends HttpServlet {

    private static final String LOGIN = "LoginController";
    private static final String ERROR = "error.jsp";
    private static final String LOGOUT = "LogoutController";
    private static final String REGISTER = "RegisterController";
    private static final String FORGOT = "ForgetPasswordController";
    private static final String ADD = "AddController";
    private static final String DISABLE = "DisableItemController";
    private static final String UPDATE = "UpdateController";
    private static final String QUERY = "QueryController";
    private static final String DELETE = "DeleteController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            switch (action) {
                case "Login":
                    url = LOGIN;
                    break;
                case "Logout":
                    url = LOGOUT;
                    break;
                case "Register":
                    url = REGISTER;
                    break;
                case "Next step":
                    url = FORGOT;
                    break;
                case "Add":
                    url = ADD;
                    break;
                case "Disable":
                    url = DISABLE;
                    break;
                case "Update":
                    url = UPDATE;
                    break;
                case "Delete":
                    url = DELETE;
                    break;
                case "Query":
                    url = QUERY;
                    break;
                default:
                    request.setAttribute("ERROR", "Invalid action detected");
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
