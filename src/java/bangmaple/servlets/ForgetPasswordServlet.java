/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.servlets;

import bangmaple.models.UsersDAO;
import bangmaple.resources.EncryptUtil;
import bangmaple.resources.RandomUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bangmaple
 */
public class ForgetPasswordServlet extends HttpServlet {

    private static final String SUBJECT = "[BangMaple] Recovery Password from"
            + " PRJ321_Java Web Assignment";
    private static String CONTENT;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("txtUsernameForgot");
        String url = "EmailSendingServlet";
        try {
            if (username != null) {
                UsersDAO dao = new UsersDAO();
                String email = dao.getEmailByUsername(username);
                request.setAttribute("recipient", email);
                request.setAttribute("subject", SUBJECT);
                String randomizedPassword = RandomUtil
                        .getRandomizedString();
                CONTENT = "Hello username " + username + ",\n\n"
                        + "Look like you want a request for password recovery.\n"
                        + "If it isn't your request, please change your password immediately!\n\n"
                        + "Your new default password is: "
                        + randomizedPassword + "\n\n\nBest regards,\n"
                        + "BangMaple (Ngo Nguyen Bang)";
                request.setAttribute("content", CONTENT);
                randomizedPassword = EncryptUtil.encryptPassword(randomizedPassword);
                dao.setPasswordBasedOnEmail(email, randomizedPassword);
            } else {
                request.setAttribute("ERROR", "Invalid username or e-mail");
            }
        } catch (Exception e) {
            if (e.getMessage().contains("email") || e.getMessage().contains("result")) {
                url = "notActivatedAccount.jsp";
                request.setAttribute("ERROR", "This account doesn't bind with any e-mail!");
            } else {
                log("Error at ForgotPasswordController: " + e.getMessage());
            }
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
