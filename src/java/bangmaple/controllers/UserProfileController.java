/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bangmaple.controllers;

import bangmaple.dtos.Users;
import bangmaple.models.UsersDAO;
import bangmaple.resources.SecureUUIDUtil;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author bangmaple
 */
@MultipartConfig
public class UserProfileController extends HttpServlet {

    private static final String SUCCESS = "login.jsp";
    private static final String ERROR = "error.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String url = ERROR;
        try {
            UsersDAO dao = new UsersDAO();
            String username = request.getParameter("txtUsername");
            String fullname = request.getParameter("txtFullname");
            Date birthDate = new SimpleDateFormat("dd/MM/yyyy").parse(request.getParameter("txtDate"));
            String email = request.getParameter("txtEmail");
            Part avatarImage = request.getPart("txtAvatarImage");
            Users u = dao.getUserByUsername(username);
            if (!dao.checkExistEmail(email)) {
                u.setEmail(email);
            }
            u.setDoB(birthDate);

            u.setFullname(fullname);
            HttpSession session = request.getSession();
            String avatarImageFileName = SecureUUIDUtil.getSecureUUID();
            String imgDir = "";
            if (avatarImage.getSize() > 0) {
                String filetype = avatarImage.getContentType();
                switch (filetype) {
                    case "image/png":
                        imgDir = saveImage(avatarImage, avatarImageFileName, "png");
                        break;
                    case "image/jpg":
                        imgDir = saveImage(avatarImage, avatarImageFileName, "jpg");
                        break;
                    case "image/jpeg":
                        imgDir = saveImage(avatarImage, avatarImageFileName, "jpg");
                        break;
                    case "image/gif":
                        imgDir = saveImage(avatarImage, avatarImageFileName, "gif");
                        break;
                }
                if (imgDir == null || imgDir.equals("")) {
                    u.setAvatarImage(null);
                    session.setAttribute("avatarImage", "uploads/avatar/default.png");
                } else {
                    u.setAvatarImage(imgDir);
                    session.setAttribute("avatarImage", "uploads/avatar/" + imgDir);
                }
            }

            session.setAttribute("userInfo", u);
            session.setAttribute("fullName", u.getFullname());
            dao.merge(u);

            url = SUCCESS;
        } catch (Exception e) {
            log("ERROR at UserProfileController:" + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private String saveImage(Part imgFile, String fileName, String fileType) throws IOException {
        BufferedImage image = ImageIO.read(imgFile.getInputStream());
        if (image != null) {
            String fullPath = getServletContext().getRealPath("/uploads/avatar/");
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
