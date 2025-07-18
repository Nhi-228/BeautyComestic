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
import jakarta.servlet.http.Part;
import java.nio.file.Paths;
import model.Product;
import dao.ProductDao;
import dao.connect;
import java.util.*;
import java.sql.*;

import jakarta.servlet.annotation.MultipartConfig;

/**
 *
 * @author BINH NHI
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
@WebServlet(name = "product", urlPatterns = {"/product"})
public class productservlet extends HttpServlet {

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
            out.println("<title>Servlet product</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet product at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        try {
            ProductDao dao = new ProductDao();

            switch (action) {
                case "delete":
                    int deleteId = Integer.parseInt(request.getParameter("id"));
                    dao.deleteProduct(deleteId);
                    response.sendRedirect("product?action=list");
                    break;

                case "edit":
                    int editId = Integer.parseInt(request.getParameter("id"));
                    Product product = dao.getProductById(editId);
                    request.setAttribute("product", product);
                    request.getRequestDispatcher("editproduct.jsp").forward(request, response);
                    break;

                case "add":
                    request.getRequestDispatcher("addproduct.jsp").forward(request, response);
                    break;

                default: // action = list
                    List<Product> list = dao.getAllProducts();
                    request.setAttribute("productList", list);
                    request.getRequestDispatcher("managerProduct.jsp").forward(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
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
        //processRequest(request, response);
        request.setCharacterEncoding("UTF-8");

        try {
            int id = request.getParameter("product_id") != null && !request.getParameter("product_id").isEmpty()
                    ? Integer.parseInt(request.getParameter("product_id")) : 0;

            String name = request.getParameter("product_name");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            double discount = Double.parseDouble(request.getParameter("discount_price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String image = request.getParameter("image");
            String gallery = request.getParameter("image_gallery");
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            int brandId = Integer.parseInt(request.getParameter("brand_id"));
            String status = request.getParameter("status");
boolean active = (status != null && status.equalsIgnoreCase("Active"));

            // Kiểm tra và chuẩn hóa status (nếu cần)
            if (status == null || status.trim().isEmpty()) {
                status = "Inactive";
            } else if (status.equalsIgnoreCase("1") || status.equalsIgnoreCase("true") || status.equalsIgnoreCase("active")) {
                status = "Active";
            } else {
                status = "Inactive";
            }

            Product p = new Product();
            p.setProductId(id);
            p.setProductName(name);
            p.setDescription(description);
            p.setPrice(price);
            p.setDiscountPrice(discount);
            p.setStockQuantity(quantity);
            p.setImageUrl(image);
            p.setImageGallery(gallery);
            p.setCategoryId(categoryId);
            p.setBrandId(brandId);
          p.setActive(active);
            p.setUpdatedAt(new Timestamp(System.currentTimeMillis()));

            ProductDao dao = new ProductDao();

            if (id == 0) {
                p.setCreatedAt(new Timestamp(System.currentTimeMillis()));
                dao.addProduct(p);
            } else {
                dao.updateProduct(p);
            }

            response.sendRedirect("product?action=list");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
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
