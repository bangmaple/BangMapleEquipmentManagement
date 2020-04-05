/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.controllers.equipments;

import bangmaple.dtos.Equipments;
import bangmaple.models.EquipmentsDAO;
import bangmaple.resources.SecureUUIDUtil;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author bangmaple
 */
@MultipartConfig
public class UpdateEquipmentController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "equipmentManagement";

    private String saveImage(Part imgFile, String fileName, String fileType) throws IOException {
        BufferedImage image = ImageIO.read(imgFile.getInputStream());
        if (image != null) {
            String fullPath = getServletContext().getRealPath("/uploads/equipments/");
            File imageDir = new File(fullPath + fileName + "." + fileType);
            imageDir.getParentFile().mkdirs();
            ImageIO.write(image, fileType, imageDir);
            return fileName + "." + fileType;
        } else {
            throw new IOException("Not " + fileType + " image");
        }
    }

    private void updateEquipment(HttpServletRequest request) throws Exception {
        int equipmentID = Integer.parseInt(request.getParameter("txtEquipID"));
        String equipmentName = request.getParameter("txtEquipmentName");
        String equipmentDescription = request.getParameter("txtEquipmentDescription");
        String equipType = request.getParameter("txtEquipType");
        Part equipmentImage = request.getPart("txtEquipImage");
        EquipmentsDAO dao = new EquipmentsDAO();
        Equipments e = dao.getEquipmentBasedOnEquipmentID(equipmentID);
        String imgDir;
        String imageFileName;
        if (equipmentImage != null) {
            imageFileName = SecureUUIDUtil.getSecureUUID();
            if (equipmentImage.getSize() > 0) {
                String filetype = equipmentImage.getContentType();
                switch (filetype) {
                    case "image/png":
                        imgDir = saveImage(equipmentImage, imageFileName, "png");
                        e.setEquipImage(imgDir);
                        break;
                    case "image/jpg":
                        imgDir = saveImage(equipmentImage, imageFileName, "jpg");
                        e.setEquipImage(imgDir);
                        break;
                    case "image/jpeg":
                        imgDir = saveImage(equipmentImage, imageFileName, "jpg");
                        e.setEquipImage(imgDir);
                        break;
                    case "image/gif":
                        imgDir = saveImage(equipmentImage, imageFileName, "gif");
                        e.setEquipImage(imgDir);
                        break;
                }
            }
        }
        e.setEquipName(equipmentName);
        e.setEquipDescription(equipmentDescription);
        e.setEquipType(equipType);
        dao.updateEquipment(e);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            updateEquipment(request);
            url = SUCCESS;
        } catch (Exception e) {
            log("ERROR at UpdateEquipmentController: " + e.getMessage());
        } finally {
            response.sendRedirect(url);
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
