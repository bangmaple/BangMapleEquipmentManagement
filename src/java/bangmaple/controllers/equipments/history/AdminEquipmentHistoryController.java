/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.controllers.equipments.history;

import bangmaple.dtos.EquipmentsReq;
import bangmaple.models.EquipmentHistoryDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bangmaple
 */
public class AdminEquipmentHistoryController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "admin/adminEquipmentHistory.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String url = ERROR;
        try {
            EquipmentHistoryDAO dao = new EquipmentHistoryDAO();
            List<EquipmentsReq> list = dao.getAllForAdmin();
            request.setAttribute("INFO", list);
            String action = request.getParameter("action");
            if (action != null) {
                if (action.equals("viewInfo")) {
                    int equipReqID = Integer.parseInt(request.getParameter("txtEquipReqID"));
                    EquipmentHistoryDAO hDAO = new EquipmentHistoryDAO();
                    EquipmentsReq req = hDAO.getEquipmentReqByID(equipReqID);
                    request.setAttribute("equipReq", req);
                    request.setAttribute("viewInfoEquipReq", "");
                } else if (action.equals("remove")) {
                    int equipReqID = Integer.parseInt(request.getParameter("txtEquipReqID"));
                    EquipmentHistoryDAO hDAO = new EquipmentHistoryDAO();
                    EquipmentsReq req = hDAO.getEquipmentReqByID(equipReqID);
                    dao.remove(req);
                    request.setAttribute("removeEquipReq", "");
                } else if (action.equals("Remove All History Entries")) {
                    dao.removeAll();
                    request.setAttribute("removeEquipReq", "");
                }
            }
            url = SUCCESS;
        } catch (Exception e) {
            log("ERROR at AdminEquipmentHistoryController: " + e.getMessage());
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
