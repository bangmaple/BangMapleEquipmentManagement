/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.controllers.users.using;

import bangmaple.dtos.EquipmentsUsingByUsers;
import bangmaple.dtos.Rooms;
import bangmaple.dtos.Users;
import bangmaple.models.GenericDAO;
import bangmaple.models.RoomsDAO;
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
public class ChangeEquipmentLocationController extends HttpServlet {

    private static final String SUCCESS = "changeEquipmentLocation.jsp";
    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String url = ERROR;
        try {
            GenericDAO dao = new GenericDAO();
            String action = request.getParameter("action");
            if (action != null) {
                if (action.equals("changeLocation")) {

                    int equipUsingID = Integer.parseInt(request.getParameter("txtEquipUsingID"));
                    request.setAttribute("changeLocation", "");
                    request.setAttribute("equipUsing", dao.getEquipUsingByID(equipUsingID));
                    request.setAttribute("roomList", new RoomsDAO().getAllRooms());
                } else if (action.equals("queryInfo")) {

                    int equipUsingID = Integer.parseInt(request.getParameter("txtEquipUsingID"));
                    request.setAttribute("queryInfo", "");
                    request.setAttribute("equipUsing", dao.getEquipUsingByID(equipUsingID));

                } else if (action.equals("changeLocationProcess")) {

                    int roomID = Integer.parseInt(request.getParameter("txtRoomID"));
                    int equipUsingID = Integer.parseInt(request.getParameter("txtEquipUsingID"));
                    EquipmentsUsingByUsers eu = dao.getEquipUsingByID(equipUsingID);
                    if (roomID != eu.getRoomID().getRoomID()) {
                        Rooms oldRoom = dao.getEquipUsingByID(equipUsingID).getRoomID();
                        String changeLocationDescription = request.getParameter("txtChangeLocationDescription");
                        dao.changeEquipmentLocation(equipUsingID, roomID);
                        dao.addEquipmentLocationHistory(Integer.parseInt(RandomUtil.getRandomizedEightNumbers()),
                                ((Users) request.getSession().getAttribute("userInfo")),
                                oldRoom, changeLocationDescription, equipUsingID);
                    }
                }
            }
            request.setAttribute("INFO", dao.getAllCurrentUsing());
            url = SUCCESS;
        } catch (Exception e) {
            log("ERROR at ChangeEquipmentLocationController: " + e.getMessage());
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
