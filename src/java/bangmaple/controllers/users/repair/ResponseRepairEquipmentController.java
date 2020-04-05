/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.controllers.users.repair;

import bangmaple.beans.ResListBean;
import bangmaple.dtos.Equipments;
import bangmaple.dtos.EquipmentsReq;
import bangmaple.dtos.EquipmentsUsingByUsers;
import bangmaple.dtos.Rooms;
import bangmaple.dtos.Users;
import bangmaple.models.EquipmentsDAO;
import bangmaple.models.GenericDAO;
import bangmaple.models.RoomsDAO;
import bangmaple.models.UsersDAO;
import java.io.IOException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bangmaple
 */
public class ResponseRepairEquipmentController extends HttpServlet {
    
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "responseRepair.jsp";
    
    private void queryUser(HttpServletRequest request) throws Exception {
        String username = request.getParameter("txtUsername");
        UsersDAO dao = new UsersDAO();
        Users u = dao.getUserByUsername(username);
        request.setAttribute("queryUser", "");
        request.setAttribute("userInfo", u);
    }
    
    private void queryRoom(HttpServletRequest request) throws Exception {
        int roomID = Integer.parseInt(request.getParameter("txtRoomID"));
        RoomsDAO dao = new RoomsDAO();
        Rooms r = dao.getRoomByRoomID(roomID);
        request.setAttribute("queryRoom", "");
        request.setAttribute("roomInfo", r);
    }
    
    private void queryEquip(HttpServletRequest request) throws Exception {
        int equipID = Integer.parseInt(request.getParameter("txtEquipID"));
        EquipmentsDAO dao = new EquipmentsDAO();
        Equipments e = dao.getEquipmentBasedOnEquipmentID(equipID);
        request.setAttribute("queryEquip", "");
        request.setAttribute("equipInfo", e);
    }
    
    private void queryRepair(HttpServletRequest request) throws Exception {
        int equipReqID = Integer.parseInt(request.getParameter("txtEquipmentReqID"));
        GenericDAO dao = new GenericDAO();
        EquipmentsReq req = dao.getEquipmentRequestByID(equipReqID);
        request.setAttribute("queryRepair", "");
        request.setAttribute("equipReq", req);
    }
    
    private void startRepairingEquipment(HttpServletRequest request) throws Exception {
        String txtAction = request.getParameter("txtAction");
        int equipReqID = Integer.parseInt(request.getParameter("txtEquipReqID"));
        GenericDAO dao = new GenericDAO();
        EquipmentsReq req = dao.getEquipmentRequestByID(equipReqID);
        req.setUsernameResponse(((Users) request.getSession().getAttribute("userInfo")));
        req.setRepairStartDate(new Date());
        ServletContext context = getServletContext();
        List<ResListBean> list = (List<ResListBean>) context.getAttribute("resList");
        if (list == null) {
            list = new LinkedList<>();
        }
        ResListBean b = new ResListBean();
        b.setDate(new Date());
        b.setId(req.getEquipByUserID().getEquipByUserID());
        String username = ((Users) request.getSession().getAttribute("userInfo")).getUsername();
        String responseRepair = request.getParameter("txtResponseRepair");
        if (txtAction.equals("DECLINED")) {
            req.setRepairResponseDescription(responseRepair);
            req.setRepairEndDate(new Date());
            req.setRepairResult("Declined!");
            EquipmentsUsingByUsers eu = req.getEquipByUserID();
            eu.setUsernameResponse(null);
            eu.setEquipReqID(null);
            eu.setEquipStatus("BROKEN");
            dao.merge(eu);
            b.setTitle(username + ": Your equipment ID " + req.getEquipByUserID().getEquipID().getEquipID() + " has been declined!");
        } else if (txtAction.equals("FIXING")) {
            
            req.setRepairResponseDescription(responseRepair);
            req.setRepairResult("Fixing...");
            EquipmentsUsingByUsers eu = req.getEquipByUserID();
            eu.setEquipStatus("FIXING");
            eu.setUsernameResponse(((Users) request.getSession().getAttribute("userInfo")));
            dao.merge(eu);
            b.setTitle(username + ": Your equipment ID " + req.getEquipByUserID().getEquipID().getEquipID() + " is currently fixing! Please wait...");
        }
        dao.merge(req);
        list.add(b);
        context.setAttribute("resList", list);
    }
    
    private void queryFinishRepair(HttpServletRequest request) throws Exception {
        int equipReqID = Integer.parseInt(request.getParameter("txtEquipmentReqID"));
        GenericDAO dao = new GenericDAO();
        EquipmentsReq req = dao.getEquipmentRequestByID(equipReqID);
        request.setAttribute("queryFinishRepair", "");
        request.setAttribute("equipReq", req);
    }
    
    private void executeQueryFinishRepair(HttpServletRequest request) throws Exception {
        int equipReqID = Integer.parseInt(request.getParameter("txtEquipReqID"));
        String txtAction = request.getParameter("txtAction");
        GenericDAO dao = new GenericDAO();
        EquipmentsReq req = dao.getEquipmentRequestByID(equipReqID);
        req.setUsernameResponse(((Users) request.getSession().getAttribute("userInfo")));
        req.setRepairStartDate(new Date());
        ServletContext context = getServletContext();
        List<ResListBean> list = (List<ResListBean>) context.getAttribute("resList");
        if (list == null) {
            list = new LinkedList<>();
        }
        ResListBean b = new ResListBean();
        b.setDate(new Date());
        b.setId(req.getEquipByUserID().getEquipByUserID());
        String username = ((Users) request.getSession().getAttribute("userInfo")).getUsername();
        String responseRepair = request.getParameter("txtResponseRepair");
        if (txtAction.equals("DECLINED")) {
            req.setRepairResponseDescription(responseRepair);
            req.setRepairEndDate(new Date());
            req.setRepairResult("Declined!");
            EquipmentsUsingByUsers eu = req.getEquipByUserID();
            eu.setUsernameResponse(null);
            eu.setEquipReqID(null);
            eu.setEquipStatus("BROKEN");
            dao.merge(eu);
            b.setTitle(username + ": Your equipment ID " + req.getEquipByUserID().getEquipID().getEquipID() + " has been declined!");
        } else if (txtAction.equals("OK")) {
            req.setRepairEndDate(new Date());
            req.setRepairResponseDescription(responseRepair);
            req.setRepairResult("Fixed!");
            EquipmentsUsingByUsers eu = req.getEquipByUserID();
            eu.setEquipReqID(null);
            eu.setUsernameResponse(null);
            eu.setEquipStatus("OK");
            dao.merge(eu);
            b.setTitle(username + ": Your equipment ID " + req.getEquipByUserID().getEquipID().getEquipID() + " has been fixed!");
        }
        dao.merge(req);
        list.add(b);
        context.setAttribute("resList", list);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (action != null) {
                switch (action) {
                    case "queryUser":
                        queryUser(request);
                        break;
                    case "queryRoom":
                        queryRoom(request);
                        break;
                    case "queryEquip":
                        queryEquip(request);
                        break;
                    case "queryRepair":
                        queryRepair(request);
                        break;
                    case "Repair":
                        startRepairingEquipment(request);
                        break;
                    case "queryFinishRepair":
                        queryFinishRepair(request);
                        break;
                    case "Finish Repair":
                        executeQueryFinishRepair(request);
                        break;
                    default:
                        break;
                }
            }
            GenericDAO dao = new GenericDAO();
            List<EquipmentsUsingByUsers> list = dao.getNotOkEquipments();
            request.setAttribute("INFO", list);
            url = SUCCESS;
        } catch (Exception e) {
            log("ERROR at ResponseRepairEquipmentController: " + e.getMessage());
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
