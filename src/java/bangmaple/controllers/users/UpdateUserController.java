/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.controllers.users;

import bangmaple.dtos.Users;
import bangmaple.models.UsersDAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bangmaple
 */
public class UpdateUserController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "userManagement";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String username = request.getParameter("txtUsername");
            String fullname = request.getParameter("txtFullname");
            String email = request.getParameter("txtEmail");
            String dateOfBirth = request.getParameter("txtDate");

            UsersDAO dao = new UsersDAO();
            System.out.println(dao.checkExistEmail(email));
            Users u = dao.getUserByUsername(username);
            HttpSession session = request.getSession();
            if (((Users) session.getAttribute("userInfo")).getUsername().equals(username)) {
                session.setAttribute("userInfo", u);
            }
            u.setFullname(fullname);
            if (!dateOfBirth.equals("")) {
                u.setDoB(new SimpleDateFormat("dd/MM/yyyy").parse(dateOfBirth));
            } else {
                u.setDoB(null);
            }
            if (!dao.checkExistEmail(email)) {
                u.setEmail(email);
            } else {
                request.setAttribute("duplicateEmail", "You can't update the user with a duplicated e-mail. Please try with another e-mail!");
            }
            dao.updateUser(u);
            url = SUCCESS;
        } catch (Exception e) {
            log("ERROR at UpdateUserController: " + e.getMessage());

        } finally {
            if (url.equals(SUCCESS)) {
                response.sendRedirect(url);
            } else {
                request.getRequestDispatcher(url).forward(request, response);
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
