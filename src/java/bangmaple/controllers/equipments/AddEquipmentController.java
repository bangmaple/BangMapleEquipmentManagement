/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.controllers.equipments;

import bangmaple.models.EquipmentsDAO;
import bangmaple.resources.RandomUtil;
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
public class AddEquipmentController extends HttpServlet {

    private static final String SUCCESS = "equipmentManagement";
    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String url = SUCCESS;
        String equipmentName = request.getParameter("txtEquipmentName");
        String equipmentDescription = request.getParameter("txtEquipmentDescription");
        String equipmentType = request.getParameter("txtEquipType");
        EquipmentsDAO dao = new EquipmentsDAO();
        try {
            int equipID = Integer.parseInt(RandomUtil.getRandomizedEightNumbers());
            Part equipImage = request.getPart("txtEquipImage");
            String imgDir = null;
            if (equipImage != null) {
                if (equipImage.getSize() > 0) {
                    String filetype = equipImage.getContentType();
                    String imageFileName = SecureUUIDUtil.getSecureUUID();
                    switch (filetype) {
                        case "image/png":
                            imgDir = saveImage(equipImage, imageFileName, "png");
                            break;
                        case "image/jpg":
                            imgDir = saveImage(equipImage, imageFileName, "jpg");
                            break;
                        case "image/jpeg":
                            imgDir = saveImage(equipImage, imageFileName, "jpg");
                            break;
                        case "image/gif":
                            imgDir = saveImage(equipImage, imageFileName, "gif");
                            break;
                    }
                }
            }
            dao.addEquipment(equipID, equipmentName, equipmentDescription, imgDir, equipmentType);
        } catch (Exception e) {
            log("ERROR at AddEquipmentController: " + e.getMessage());
            url = ERROR;
        } finally {
            response.sendRedirect(url);
        }
    }

    private String saveImage(Part imgFile, String fileName, String fileType) throws IOException {
        BufferedImage image = ImageIO.read(imgFile.getInputStream());
        if (image != null) {
            String fullPath = getServletContext().getRealPath("/uploads/equipments/");
            System.out.println(fullPath);
            File imageDir = new File(fullPath + fileName + "." + fileType);
            imageDir.getParentFile().mkdirs();
            ImageIO.write(image, fileType, imageDir);
            return fileName + "." + fileType;
        } else {
            throw new IOException("Not " + fileType + " image");
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
