package bangmaple.servlets;

import bangmaple.resources.MailUtil;
import java.io.IOException;
import javax.mail.MessagingException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author bangmaple
 */
public class EmailSendingServlet extends HttpServlet {

    private static final String DEFAULT = "/verifyEmailSent.jsp";
    private String host;
    private String port;
    private String user;
    private String pass;

    @Override
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        String recipient;
        String subject;
        String content;
        String type = "";
        String url = DEFAULT;
        if (request.getParameter("recipient") != null) {
            recipient = request.getParameter("recipient");
            subject = request.getParameter("subject");
            content = request.getParameter("content");
        } else {
            recipient = String.valueOf(request.getAttribute("recipient"));
            subject = String.valueOf(request.getAttribute("subject"));
            content = String.valueOf(request.getAttribute("content"));
            type = String.valueOf(request.getAttribute("type"));
        }
        String resultMessage = "";
        if (type.equals("Register")) {
            url = DEFAULT;
        } else if (type.equals("Authenticate")) {
            url = "/twoFactor.jsp";
        }
        try {
            MailUtil.sendEmail(host, port, user, pass, recipient, subject, content);
        } catch (MessagingException ex) {
            resultMessage = "There were an error: " + ex.getMessage();
            System.out.println("ERROR at EmailSendingServlet: " + ex.getMessage());
            url = "/login.jsp";
        } finally {
            request.setAttribute("Message", resultMessage);
            getServletContext().getRequestDispatcher(url).forward(request, response);
        }
    }
}
