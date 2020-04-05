/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.resources;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author bangmaple
 */
public class SaveImageServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String imageDir = "";
        try {
            String nameFile = SecureUUIDUtil.getSecureUUID();
            Part imageFile = request.getPart("imageFile");
            System.out.println(imageFile.toString());
            if (imageFile.getSize() > 0) {
                String fileType = imageFile.getContentType();
                switch (fileType) {
                    case "image/png":
                        imageDir = saveImage(imageFile, nameFile, "png");
                        break;
                    case "image/jpeg":
                        imageDir = saveImage(imageFile, nameFile, "jpg");
                        break;
                }
            }
            System.out.println(imageDir);
        } catch (IOException | ServletException e) {
            log("Error at SaveImageServlet: " + e.getMessage());
        } finally {
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }
    }

    private String saveImage(Part imgFile, String fileName, String fileType) throws IOException {
        BufferedImage image = ImageIO.read(imgFile.getInputStream());
        if (image != null) {
            String fullPath = getServletContext().getRealPath("/imgUploads/");
            File imageDir = new File(fullPath + fileName + "." + fileType);
            imageDir.getParentFile().mkdirs();
            ImageIO.write(image, fileType, imageDir);
            return "/imgUploads/" + fileName + "." + fileType;
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
