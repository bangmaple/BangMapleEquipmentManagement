/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.filter;

import bangmaple.dtos.Users;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bangmaple
 */
public class AuthFilter implements Filter {

    private List<String> admin;
    private List<String> guest;
    private List<String> tech;
    private List<String> user;
    private final String[] listPermission = {"", "login.jsp", "error.jsp", "404.jsp", "genericFooter.jsp", "genericSidebar.jsp",
        "genericSettingsModal.jsp", "genericDashboard.jsp", "genericFooterScript.jsp", "genericLogo.html", "genericTopbar.jsp", "MainController"};
    private static final boolean debug = true;

    private FilterConfig filterConfig = null;

    public AuthFilter() {
        loadGuestPermission();
        loadAdminPermission();
        loadUserPermission();
        loadTechPermission();
    }

    private void loadTechPermission() {
        tech = new ArrayList<>();
        tech.addAll(Arrays.asList(listPermission));
        tech.add("techDashboard");
        tech.add("LoginController");
        tech.add("LogoutController");
        tech.add("SaveImageServlet");
        tech.add("UserSettingsController");
        tech.add("TwoFactorAuthentication");
        tech.add("UserProfileController");
        tech.add("showReq");
        tech.add("changeEquipmentLocation");
        tech.add("equipmentStatistics");
        tech.add("responseRepair");
        tech.add("ChangePasswordController");
        tech.add("techEquipmentHistory");
        tech.add("techEquipmentStatistics");
    }

    private void loadAdminPermission() {
        admin = new ArrayList<>();
        admin.addAll(Arrays.asList(listPermission));
        admin.add("adminDashboard");
        admin.add("LoginController");
        admin.add("LogoutController");
        admin.add("userManagement");
        admin.add("equipmentManagement");
        admin.add("roomManagement");
        admin.add("DeleteRoomController");
        admin.add("DeleteUserController");
        admin.add("DeleteEquipmentController");
        admin.add("DisableUserController");
        admin.add("AddRoomController");
        admin.add("AddUserController");
        admin.add("AddEquipmentController");
        admin.add("ViewMoreEquipInfoController");
        admin.add("DisableItemController");
        admin.add("UpdateEquipmentController");
        admin.add("QueryController");
        admin.add("UpdateRoomController");
        admin.add("UpdateUserController");
        admin.add("AddToRoomController");
        admin.add("SaveImageServlet");
        admin.add("UpdateController");
        admin.add("AddController");
        admin.add("DeleteController");
        admin.add("UserSettingsController");
        admin.add("TwoFactorAuthentication");
        admin.add("UserProfileController");
        admin.add("showReq");
        admin.add("equipmentStatistics");
        admin.add("repairingHistory");
        admin.add("ChangePasswordController");
        admin.add("adminEquipmentHistory");
    }

    private void loadUserPermission() {
        user = new ArrayList<>();
        user.addAll(Arrays.asList(listPermission));
        user.add("userDashboard");
        user.add("LogoutController");
        user.add("LoginController");
        user.add("requestRepair");
        user.add("workingPlace");
        user.add("viewMoreUsersWorking");
        user.add("UserSettingsController");
        user.add("TwoFactorAuthentication");
        user.add("UserProfileController");
        user.add("ChangePasswordController");
        user.add("userEquipmentHistory");
        user.add("userEquipmentStatistics");
        user.add("showRes");
    }

    private void loadGuestPermission() {
        guest = new ArrayList<>();
        guest.addAll(Arrays.asList(listPermission));
        guest.add("register.jsp");
        guest.add("twoFactor.jsp");
        guest.add("successfulRegister.html");
        guest.add("failRegister.jsp");
        guest.add("notActivatedAccount.jsp");
        guest.add("verifyEmailsent.html");
        guest.add("LoginController");
        guest.add("TwoFactorAuthentication");
        guest.add("activateAccount");
        guest.add("EmailSendingServlet");
        guest.add("AuthenticationServlet");
        guest.add("RegisterController");
    }

    private void doBeforeProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthFilter:DoBeforeProcessing");
        }
    }

    private void doAfterProcessing(ServletRequest request, ServletResponse response)
            throws IOException, ServletException {
        if (debug) {
            log("AuthFilter:DoAfterProcessing");
        }
    }

    /**
     *
     * @param request The servlet request we are processing
     * @param response The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI();
        int index = uri.lastIndexOf("/");
        String resource = uri.substring(index + 1);
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userInfo") == null) {
            //chua dang nhap
            if (guest.contains(resource) || resource.matches(".*(css|jpg|png|gif|js|woff2)")) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect("login.jsp");
            }
        } else {
            //da dang nhap
            String role = ((Users) session.getAttribute("userInfo")).getRole();
            if (!role.equals("")) {
                if ((role.equals("Administrator") && admin.contains(resource)) || resource.matches(".*(css|jpg|png|gif|js|woff2)")) {
                    chain.doFilter(request, response);
                } else if ((role.equals("Technician") && tech.contains(resource)) || resource.matches(".*(css|jpg|png|gif|js|woff2)")) {
                    chain.doFilter(request, response);
                } else if ((role.equals("User") && user.contains(resource)) || resource.matches(".*(css|jpg|png|gif|js|woff2)")) {
                    chain.doFilter(request, response);
                } else {
                    res.sendRedirect("404.jsp");
                }
            } else {
                res.sendRedirect("404.jsp");
            }
        }
    }

    /**
     * Return the filter configuration object for this filter.
     */
    public FilterConfig getFilterConfig() {
        return (this.filterConfig);
    }

    /**
     * Set the filter configuration object for this filter.
     *
     * @param filterConfig The filter configuration object
     */
    public void setFilterConfig(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    /**
     * Destroy method for this filter
     */
    public void destroy() {
    }

    /**
     * Init method for this filter
     */
    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
        if (filterConfig != null) {
            if (debug) {
                log("AuthFilter:Initializing filter");
            }
        }
    }

    /**
     * Return a String representation of this object.
     */
    @Override
    public String toString() {
        if (filterConfig == null) {
            return ("AuthFilter()");
        }
        StringBuffer sb = new StringBuffer("AuthFilter(");
        sb.append(filterConfig);
        sb.append(")");
        return (sb.toString());
    }

    private void sendProcessingError(Throwable t, ServletResponse response) {
        String stackTrace = getStackTrace(t);

        if (stackTrace != null && !stackTrace.equals("")) {
            try {
                response.setContentType("text/html");
                PrintStream ps = new PrintStream(response.getOutputStream());
                PrintWriter pw = new PrintWriter(ps);
                pw.print("<html>\n<head>\n<title>Error</title>\n</head>\n<body>\n"); //NOI18N

                // PENDING! Localize this for next official release
                pw.print("<h1>The resource did not process correctly</h1>\n<pre>\n");
                pw.print(stackTrace);
                pw.print("</pre></body>\n</html>"); //NOI18N
                pw.close();
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        } else {
            try {
                PrintStream ps = new PrintStream(response.getOutputStream());
                t.printStackTrace(ps);
                ps.close();
                response.getOutputStream().close();
            } catch (Exception ex) {
            }
        }
    }

    public static String getStackTrace(Throwable t) {
        String stackTrace = null;
        try {
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            t.printStackTrace(pw);
            pw.close();
            sw.close();
            stackTrace = sw.getBuffer().toString();
        } catch (Exception ex) {
        }
        return stackTrace;
    }

    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }

}
