/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.controllers;

import bangmaple.models.UsersDAO;
import bangmaple.resources.EncryptUtil;
import bangmaple.resources.IPAddressUtil;
import bangmaple.resources.SecureUUIDUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bangmaple
 */
public class RegisterController extends HttpServlet {

    private static final String SUCCESS = "EmailSendingServlet";
    private static final String ERROR = "notActivatedAccount.jsp";
    private static final String NOT_ACTIVATED_OR_EXIST = "notActivatedAccount.jsp";
    private static final String SUBJECT = "[BangMaple] Account Confirmation"
            + " from PRJ321_Java Web Assignment";
    private static String CONTENT = "Dear valued user!\n\nThanks for your registration!\n"
            + "As your request from the registration form, you need to activate your account"
            + " before using any service from us.\nYou will need to confirm your registration "
            + "from this link to continue!\n\n";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String username = request.getParameter("txtUsernameRegistration");
            String password = request.getParameter("txtPasswordRegistration");
            String email = request.getParameter("txtEmailRegistration");
            request.setAttribute("recipient", email);
            request.setAttribute("subject", SUBJECT);
            UsersDAO dao = new UsersDAO();
            if (!dao.checkIfExistUsernameOrEmail(username, email)) {
                password = EncryptUtil.encryptPassword(password);
                if (dao.registerAccount(username, password, email)) {
                    url = SUCCESS;
                    String ip = IPAddressUtil.getCurrentIPv4Address();
                    String uuid = SecureUUIDUtil.getSecureUUID();
                    CONTENT += "Your verification link: https://" + ip + ":8443"
                            + "/Assignment_Spring2020/activateAccount?e=" + email + "&h=" + uuid + "\n\n"
                            + "Please activate this account as soon as possible!\n"
                            + "Best regards,\n"
                            + "BangMaple (Ngo Nguyen Bang).";
                    request.setAttribute("content", CONTENT);
                    request.setAttribute("type", "Register");
                    dao.setHashBasedOnUsername(username, uuid);
                } else {
                    url = ERROR;
                    request.setAttribute("ERROR", "Username or e-mail already exist. Please try with another!");
                }
            } else {
                request.setAttribute("ERROR", "Username or e-mail already exist. Please try with another!");
                url = NOT_ACTIVATED_OR_EXIST;
            }
        } catch (Exception e) {
            log("Error at RegisterController: " + e.getMessage());
            url = NOT_ACTIVATED_OR_EXIST;
            request.setAttribute("ERROR", "Invalid username or email. Please try again.");
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
