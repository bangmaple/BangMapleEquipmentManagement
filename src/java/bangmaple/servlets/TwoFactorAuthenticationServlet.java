/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.servlets;

import bangmaple.dtos.Users;
import bangmaple.models.UsersDAO;
import bangmaple.resources.RandomUtil;
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
public class TwoFactorAuthenticationServlet extends HttpServlet {

    private static final String ERROR = "notActivatedAccount.jsp";
    private static final String SUCCESS = "login.jsp";
    private static final String SEND_MAIL = "EmailSendingServlet";
    private static final String SUBJECT = "[BangMaple] Two-Factor Authentication Password Token from"
            + " PRJ321_Java Web Assignment";
    private static String CONTENT = "";

    private String sendMail(HttpServletRequest request, UsersDAO dao, String username) throws Exception {
        String token = RandomUtil.getRandomizedSixNumbers();
        request.setAttribute("recipient", dao.getEmailByUsername(username));
        request.setAttribute("subject", SUBJECT);
        CONTENT = "Hello username " + username + ",\n"
                + "You just logged into your account with two-factor authentication enabled!\n"
                + "Please input the below 6-digit password token so as to authenticate to your dashboard.\n\n"
                + "Your token is: " + token + "\n\n"
                + "If you don't want this two-factor authentication process. Please kindly disable it in the user setting later.\n"
                + "Thank you for using our service.\n"
                + "Ngo Nguyen Bang (BangMaple).";
        dao.setPasswordToken(token, username);
        request.setAttribute("content", CONTENT);
        request.setAttribute("type", "Authenticate");
        return SEND_MAIL;
    }

    private String authenticate(HttpServletRequest request, UsersDAO dao) throws Exception {
        String inputToken = request.getParameter("txtToken");
        Users u = dao.getUserByUsername(String.valueOf(request.getParameter("txtUsername")));
        String userToken = u.getPasswordToken();
        if (inputToken.equals(userToken)) {
//            dao.setPasswordToken("", u.getUsername());
//            request.setAttribute("authenticated", "");
//            request.setAttribute("username", u.getUsername());
//            request.setAttribute("password", u.getPassword());
            request.getSession().setAttribute("userInfo", u);
            return SUCCESS;
        }
        request.setAttribute("ERROR", "Invalid password token.\nPlase login again.");
        return ERROR;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            UsersDAO dao = new UsersDAO();
            String username = request.getParameter("txtUsername");
            String action = request.getParameter("action");
            if (action.equals("Login")) {
                url = sendMail(request, dao, username);
            } else if (action.equals("Authenticate")) {
                url = authenticate(request, dao);
            } else {
                request.setAttribute("ERROR", "You didn't pass the two-factor authentication!");
            }
        } catch (Exception e) {
            log("ERROR at TwoFactorAuthentictionServlet: " + e.getMessage());
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
