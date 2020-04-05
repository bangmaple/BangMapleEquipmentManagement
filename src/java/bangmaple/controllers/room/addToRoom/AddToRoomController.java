/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.controllers.room.addToRoom;

import bangmaple.dtos.EquipmentsUsingByUsers;
import bangmaple.dtos.Users;
import bangmaple.models.EquipmentsDAO;
import bangmaple.models.GenericDAO;
import bangmaple.models.RoomsDAO;
import bangmaple.models.UsersDAO;
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
public class AddToRoomController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "addToRoom.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("add");
            EquipmentsDAO eDAO = new EquipmentsDAO();
            UsersDAO uDAO = new UsersDAO();
            RoomsDAO rDAO = new RoomsDAO();
            if (action != null) {
                String username = request.getParameter("txtUsername");
                int roomID = Integer.parseInt(request.getParameter("txtRoomID"));
                int equipID = Integer.parseInt(request.getParameter("txtEquipID"));
                GenericDAO dao = new GenericDAO();
                int equipUsingID = Integer.parseInt(RandomUtil.getRandomizedEightNumbers());
                dao.addUEToRoom(equipUsingID, uDAO.getUserByUsername(username), rDAO.getRoomByRoomID(roomID), eDAO.getEquipmentBasedOnEquipmentID(equipID));
                request.setAttribute("successAddToRoom", "");
            }
            request.setAttribute("uINFO", uDAO.getEnabledUsers());
            request.setAttribute("rINFO", rDAO.getEnabledRooms());
            request.setAttribute("eINFO", eDAO.getEnabledEquipments());
            url = SUCCESS;
        } catch (Exception e) {
            log("ERROR at AddToRoomController: " + e.getMessage());
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
