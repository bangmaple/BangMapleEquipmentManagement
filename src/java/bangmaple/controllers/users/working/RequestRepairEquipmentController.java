/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.controllers.users.working;

import bangmaple.beans.ReqListBean;
import bangmaple.dtos.EquipmentsReq;
import bangmaple.dtos.EquipmentsUsingByUsers;
import bangmaple.dtos.Users;
import bangmaple.models.GenericDAO;
import bangmaple.models.UsersDAO;
import bangmaple.resources.RandomUtil;
import java.io.IOException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bangmaple
 */
public class RequestRepairEquipmentController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "workingPlace";
    private static final String QUERY_TABLE = "requestRepair.jsp";
    

    private void request(HttpServletRequest request, int equipUsingID, GenericDAO dao) throws Exception {
        equipUsingID = Integer.parseInt(request.getParameter("txtEquipUsingID"));
        dao = new GenericDAO();
        request.setAttribute("equipUsingID", dao.getEquipUsingByID(equipUsingID));
        request.setAttribute("queryRequest", "");
    }

    private void successRequest(HttpServletRequest request, int equipUsingID, GenericDAO dao) throws Exception {
        dao = new GenericDAO();
        equipUsingID = Integer.parseInt(request.getParameter("txtEquipUsingID"));
        EquipmentsReq req = new EquipmentsReq();
        HttpSession session = request.getSession();
        String usernameReq = String.valueOf(((Users) session.getAttribute("userInfo")).getUsername());
        UsersDAO uDAO = new UsersDAO();

        String repairRequest = request.getParameter("txtRepairRequest");//
        req.setRepairRequestDescription(repairRequest);
        req.setEquipByUserID(dao.getEquipUsingByID(equipUsingID));
        req.setUsernameRequest(uDAO.getUserByUsername(usernameReq));
        req.setRepairRequestDate(new Date());
        req.setRepairResult("Waiting response...");
        req.setEquipReqID(Integer.parseInt(RandomUtil.getRandomizedEightNumbers()));
        dao.requestRepairEquipment(req, equipUsingID);

        List<ReqListBean> list = (List<ReqListBean>) request.getServletContext().getAttribute("reqList");
        if (list == null) {
            list = new LinkedList<>();
        }
        ReqListBean b = new ReqListBean();
        b.setId(equipUsingID);
        b.setDate(new Date());
        b.setTitle("Repair Request from user " + usernameReq + " with ID "+req.getEquipReqID());
        list.add(b);
        request.getServletContext().setAttribute("reqList", list);
    }

    private void revertRequest(HttpServletRequest request, int equipUsingID, GenericDAO dao) throws Exception {
        dao = new GenericDAO();
        equipUsingID = Integer.parseInt(request.getParameter("txtEquipUsingID"));
        dao.setEquipUsingOK(equipUsingID);
        List<ReqListBean> list = (List<ReqListBean>) request.getServletContext().getAttribute("reqList");
        if (list != null) {
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getId() == (equipUsingID)) {
                    list.remove(list.get(i));
                    break;
                }
            }
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            GenericDAO dao = null;
            int equipUsingID = 0;
            if (action == null) {
                showTable(request);
                url = QUERY_TABLE;
            } else {
                switch (action) {
                    case "request":
                        request(request, equipUsingID, dao);
                        break;
                    case "successRequest":
                        successRequest(request, equipUsingID, dao);
                        break;
                    case "revertRequest":
                        revertRequest(request, equipUsingID, dao);
                        break;
                }
                url = SUCCESS;
            }
        } catch (Exception e) {
            log("ERROR at RequestRepairEquipmentController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    public void showTable(HttpServletRequest request) throws Exception {
        GenericDAO dao = new GenericDAO();
        HttpSession session = request.getSession();
        Users u = (Users) session.getAttribute("userInfo");
        List<EquipmentsUsingByUsers> list = dao.getNotOkEquipments(u);
        request.setAttribute("INFO", list);
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
