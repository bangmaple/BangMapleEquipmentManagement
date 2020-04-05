/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.controllers;

import bangmaple.dtos.Equipments;
import bangmaple.dtos.Rooms;
import bangmaple.dtos.Users;
import bangmaple.models.EquipmentsDAO;
import bangmaple.models.RoomsDAO;
import bangmaple.models.UsersDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bangmaple
 */
public class QueryController extends HttpServlet {
    
    private static final String SUCCESS_USER = "userManagement";
    private static final String SUCCESS_EQUIPMENT = "equipmentManagement";
    private static final String SUCCESS_ROOM = "roomManagement";
    private static final String ERROR = "error.jsp";
    
    private void queryUser(HttpServletRequest request) throws Exception {
        String username = request.getParameter("txtUsername");
        UsersDAO dao = new UsersDAO();
        Users u = dao.getUserByUsername(username);
        if (request.getParameter("actionQueryUpdate") != null) {
            request.setAttribute("queryUpdate", u);
        } else {
            request.setAttribute("queryDelete", u);
        }
    }
    
    private void queryRoom(HttpServletRequest request) throws Exception {
        int roomID = Integer.parseInt(request.getParameter("txtRoomID"));
        RoomsDAO dao = new RoomsDAO();
        Rooms r = dao.getRoomByRoomID(roomID);
        if (request.getParameter("actionQueryUpdate") != null) {
            request.setAttribute("queryUpdate", r);
        } else {
            request.setAttribute("queryDelete", r);
        }
    }
    
    private void queryEquipment(HttpServletRequest request) throws Exception {
        int equipmentID = Integer.parseInt(request.getParameter("txtEquipmentID"));
        EquipmentsDAO dao = new EquipmentsDAO();
        Equipments e = dao.getEquipmentBasedOnEquipmentID(equipmentID);
        if ((request.getParameter("actionQueryUpdate")) != null) {
            request.setAttribute("queryUpdate", e);
        } else {
            request.setAttribute("queryDelete", e);
        }
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("actionQuery");
            switch (action) {
                case "queryUser":
                    queryUser(request);
                    url = SUCCESS_USER;
                    break;
                
                case "queryRoom":
                    queryRoom(request);
                    url = SUCCESS_ROOM;
                    break;
                
                case "queryEquipment":
                    queryEquipment(request);
                    url = SUCCESS_EQUIPMENT;
                    break;
                
            }
        } catch (Exception e) {
            log("ERROR at QueryController: " + e.getMessage());
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
