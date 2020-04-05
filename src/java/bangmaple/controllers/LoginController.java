/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.controllers;

import bangmaple.dtos.Users;
import bangmaple.models.UsersDAO;
import bangmaple.resources.EncryptUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bangmaple
 */
public class LoginController extends HttpServlet {

    private static final String USER = "userDashboard";
    private static final String ADMIN = "adminDashboard";
    private static final String ERROR = "notActivatedAccount.jsp";
    private static final String TECH = "techDashboard";
    private static final String NOT_ACTIVATED = "notActivatedAccount.jsp";
    private static final String TWO_FACTOR_AUTHENTICATION = "TwoFactorAuthentication";

    private Users loginProcess(HttpServletRequest request, HttpSession session) throws Exception {
        String username;
        String password;
        username = request.getParameter("txtUsername");
        password = EncryptUtil
                .encryptPassword(request
                        .getParameter("txtPassword"));
        Users u = new Users(username);
        u.setPassword(password);
        return u;
    }

    private String checkRole(HttpServletRequest request, Users u) throws Exception {
        UsersDAO dao = new UsersDAO();
        String role = "";
        try {
            role = dao.checkLogin(u.getUsername(), u.getPassword());
        } catch (Exception e) {
            request.setAttribute("ERROR", e.getMessage());
            return ERROR;
        }
        if (!role.equals("")) {
            switch (role) {
                case "Administrator":
                    return ADMIN;
                case "Technician":
                    return TECH;
                case "User":
                    return USER;
                default:
                    return ERROR;
            }
        } else {
            return ERROR;
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        Users u = null;
        HttpSession session = request.getSession();
        try {
            u = loginProcess(request, session);
            url = checkRole(request, u);
            u = new UsersDAO().getUserByUsername(u.getUsername());
            if (u.getRole() != null) {
                if (u.getPasswordToken() == null) {
                    session.setAttribute("twoFactor", "");
                } else {
                    session.setAttribute("twoFactor", "checked");
                    request.setAttribute("username", u.getUsername());
                    url = TWO_FACTOR_AUTHENTICATION;
                }
            }
            if (!url.equals(TWO_FACTOR_AUTHENTICATION)) {
                if (!url.equals(ERROR)) {
                    session.setAttribute("userInfo", new UsersDAO().getUserByUsername(u.getUsername()));
                }
            }
            if (u.getIsDisabled()) {
                url = NOT_ACTIVATED;
                request.setAttribute("ERROR", "This account has been disabled by administrator!");
                session.invalidate();
            }
            if (!u.getIsActivated()) {
                url = NOT_ACTIVATED;
                request.setAttribute("ERROR", "This account hasn't been activated! Please check your mailbox for activation confirmation link.");
                session.invalidate();
            }

        } catch (Exception e) {
            log("Error at LoginController: " + e.getMessage());
        } finally {
            if (url.equals(TWO_FACTOR_AUTHENTICATION)) {
                request.getRequestDispatcher(url).forward(request, response);
            } else if (url.equals(NOT_ACTIVATED)) {
                request.getRequestDispatcher(url).forward(request, response);
            } else {
                if (u.getRole() != null) {
                    response.sendRedirect(url);
                } else {
                    request.getRequestDispatcher(url).forward(request, response);
                }
            }
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
