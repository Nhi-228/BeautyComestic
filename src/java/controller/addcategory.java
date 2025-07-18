/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.CategoryDao;
import model.Category;
import jakarta.servlet.*;

/**
 *
 * @author BINH NHI
 */
@WebServlet(name = "addcategory", urlPatterns = {"/addcategory"})
public class addcategory extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addcategory</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addcategory at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
       // processRequest(request, response);
       request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("categoryName");
        String description = request.getParameter("description");
        String imageUrl = request.getParameter("imageUrl");
        String parentIdStr = request.getParameter("parentCategoryId");
        String isActiveStr = request.getParameter("isActive");

        Integer parentId = null;
        if (parentIdStr != null && !parentIdStr.isEmpty()) {
            try {
                parentId = Integer.parseInt(parentIdStr);
            } catch (NumberFormatException e) {
                parentId = null;
            }
        }

        boolean isActive = "1".equals(isActiveStr);

        Category category = new Category();
        category.setCategoryName(name);
        category.setDescription(description);
        category.setImageUrl(imageUrl);
        category.setParentCategoryId(parentId);
        category.setActive(isActive);

        try {
            CategoryDao dao = new CategoryDao();
            boolean success = dao.insertCategory(category);
            if (success) {
                response.sendRedirect("category.jsp?msg=success");
            } else {
                response.sendRedirect("addcategory.jsp?msg=error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addcategory.jsp?msg=exception");
        }
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
