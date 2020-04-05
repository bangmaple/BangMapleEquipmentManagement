/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.controllers.equipments.statistics;

import bangmaple.dtos.EquipmentsLocationHistory;
import bangmaple.dtos.EquipmentsUsingByUsers;
import bangmaple.models.EquipmentLocationHistoryDAO;
import bangmaple.models.GenericDAO;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bangmaple
 */
public class EquipmentStatisticsController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "equipmentStatistics.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("search");
            GenericDAO dao = new GenericDAO();
            if (action == null) {
                List<EquipmentsUsingByUsers> list = dao.getAllCurrentUsing();
                request.setAttribute("INFO", list);
            } else if (action.equals("Search by Date")) {
                String dateFrom = request.getParameter("txtDateFrom");
                String dateTo = request.getParameter("txtDateTo");
                if (dateFrom.length() == 0 || dateTo.length() == 0) {
                    List<EquipmentsUsingByUsers> list = dao.getAllCurrentUsing();
                    request.setAttribute("INFO", list);
                } else {
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    List<EquipmentsUsingByUsers> list = dao.getAllCurrentUsingDateRange(sdf.parse(dateFrom), sdf.parse(dateTo));
                    request.setAttribute("INFO", list);
                }
            } else if (action.equals("Search from repair time")) {
                String repairTime = request.getParameter("txtRepairNum");
                if (repairTime.length() == 0) {
                    List<EquipmentsUsingByUsers> list = dao.getAllCurrentUsing();
                    request.setAttribute("INFO", list);
                } else {
                    List<EquipmentsUsingByUsers> list = dao.getAllCurrentUsingRepairTime(Integer.parseInt(repairTime));
                    request.setAttribute("INFO", list);
                }
            }
            String actionEquip = request.getParameter("action");
            if (actionEquip != null) {
                if (actionEquip.equals("viewInfo")) {
                    String equipUsingID = request.getParameter("txtEquipUsing");
                    int equipUID = Integer.parseInt(equipUsingID);
                    request.setAttribute("viewMoreEquipUsingInfo", "");
                    EquipmentsUsingByUsers eu = dao.getEquipUsingByID(equipUID);
                    request.setAttribute("equipUsingInfo", eu);
                    List<EquipmentsUsingByUsers> list = dao.getAllCurrentUsing();
                    request.setAttribute("INFO", list);
                } else if (actionEquip.equals("equipLocationHistory")) {
                    int equipUsingID = Integer.parseInt(request.getParameter("txtEquipUsing"));
                    EquipmentLocationHistoryDAO ehDAO = new EquipmentLocationHistoryDAO();
                    List<EquipmentsLocationHistory> ehList = ehDAO.getAllLocationHistoryByUsingID(equipUsingID);
                    request.setAttribute("equipLocationHistoryList", ehList);
                    request.setAttribute("equipLocationHistoryTable", dao);
                    List<EquipmentsUsingByUsers> list = dao.getAllCurrentUsing();
                    request.setAttribute("INFO", list);
                }
            }
            url = SUCCESS;
        } catch (Exception e) {
            log("ERROR at EquipmentStatisticsController: " + e.getMessage());
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
