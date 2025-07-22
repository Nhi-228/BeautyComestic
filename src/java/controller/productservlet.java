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
import java.math.BigDecimal;
import java.io.File;
import java.io.InputStream;
import java.io.FileOutputStream;
import model.ProductImage;
import dao.ProductImageDao;

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
        String action = request.getParameter("action");
        if (action == null) action = "list";

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
                    request.getRequestDispatcher("editProduct.jsp").forward(request, response);
                    break;

                case "add":
                    request.getRequestDispatcher("addProduct.jsp").forward(request, response);
                    break;

                default: // list
                    List<Product> productList = dao.getAllProducts();
                    request.setAttribute("productList", productList);
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
          request.setCharacterEncoding("UTF-8");

        try {
            int id = request.getParameter("product_id") != null && !request.getParameter("product_id").isEmpty() ? Integer.parseInt(request.getParameter("product_id")) : 0;

            // Đọc các field từ form, kiểm tra null và đồng bộ tên trường
            String name = request.getParameter("productName");
            String description = request.getParameter("description");
            String priceStr = request.getParameter("price");
            BigDecimal price = new BigDecimal(priceStr != null && !priceStr.isEmpty() ? priceStr : "0");
            String discountStr = request.getParameter("discountPrice");
            BigDecimal discount = new BigDecimal(discountStr != null && !discountStr.isEmpty() ? discountStr : "0");
            String quantityStr = request.getParameter("stockQuantity");
            int quantity = quantityStr != null && !quantityStr.isEmpty() ? Integer.parseInt(quantityStr) : 0;
            String sku = request.getParameter("sku");
            String ingredients = request.getParameter("ingredients");
            // Xử lý ảnh đại diện (imageUrl) dạng file upload
            String image = "";
            Part imagePart = request.getPart("imageUrl");
            if (imagePart != null && imagePart.getSize() > 0) {
                String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = "D:/doan2/BeautyComestic-master (1)/BeautyComestic-master/web/uploaded_images/";
                if (!uploadPath.endsWith(File.separator)) uploadPath += File.separator;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs();
                try (InputStream input = imagePart.getInputStream();
                     FileOutputStream output = new FileOutputStream(uploadPath + fileName)) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = input.read(buffer)) != -1) {
                        output.write(buffer, 0, bytesRead);
                    }
                }
                image = "uploaded_images/" + fileName;
            }
            // Xử lý upload nhiều ảnh phụ (imageUrls)
            StringBuilder galleryBuilder = new StringBuilder();
            Collection<Part> parts = request.getParts();
            for (Part part : parts) {
                if ("imageUrls".equals(part.getName()) && part.getSize() > 0) {
                    String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    String uploadPath = "D:/doan2/BeautyComestic-master (1)/BeautyComestic-master/web/uploaded_images/";
                    if (!uploadPath.endsWith(File.separator)) uploadPath += File.separator;
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) uploadDir.mkdirs();
                    try (InputStream input = part.getInputStream();
                         FileOutputStream output = new FileOutputStream(uploadPath + fileName)) {
                        byte[] buffer = new byte[1024];
                        int bytesRead;
                        while ((bytesRead = input.read(buffer)) != -1) {
                            output.write(buffer, 0, bytesRead);
                        }
                    }
                    if (galleryBuilder.length() > 0) galleryBuilder.append(",");
                    galleryBuilder.append("uploaded_images/" + fileName);
                }
            }
            String gallery = galleryBuilder.toString();
            String categoryIdStr = request.getParameter("categoryId");
            int categoryId = categoryIdStr != null && !categoryIdStr.isEmpty() ? Integer.parseInt(categoryIdStr) : 0;
            String brandIdStr = request.getParameter("brandId");
            int brandId = brandIdStr != null && !brandIdStr.isEmpty() ? Integer.parseInt(brandIdStr) : 0;
            String status = "active";
            String ratingAvgStr = request.getParameter("ratingAverage");
            float ratingAvg = ratingAvgStr != null && !ratingAvgStr.isEmpty() ? Float.parseFloat(ratingAvgStr) : 0;
            String reviewCountStr = request.getParameter("reviewCount");
            int reviewCount = reviewCountStr != null && !reviewCountStr.isEmpty() ? Integer.parseInt(reviewCountStr) : 0;

            Timestamp now = new Timestamp(System.currentTimeMillis());

            Product p = new Product();
            p.setProductId(id);
            p.setProductName(name);
            p.setDescription(description);
            p.setPrice(price);
            p.setDiscountPrice(discount);
            p.setStockQuantity(quantity);
            p.setSku(sku);
            p.setIngredients(ingredients);
            p.setImageUrl(image);
            p.setImageGallery(gallery);
            p.setCategoryId(categoryId);
            p.setBrandId(brandId);
            p.setStatus(status);
            p.setRatingAverage(ratingAvg);
            p.setReviewCount(reviewCount);
            p.setUpdatedAt(now);

            ProductDao dao = new ProductDao();
            ProductImageDao imageDao = new ProductImageDao();

            if (id == 0) {
                p.setCreatedAt(now);
                // Thêm sản phẩm và lấy product_id vừa tạo
                int newProductId = dao.addProductReturnId(p);
                // Lưu ảnh đại diện (is_primary=1)
                if (!image.isEmpty()) {
                    ProductImage img = new ProductImage();
                    img.setProductId(newProductId);
                    img.setImageUrl(image);
                    img.setAltText(name);
                    img.setSortOrder(0);
                    img.setPrimary(true);
                    imageDao.addProductImage(img);
                }
                // Lưu các ảnh phụ (is_primary=0)
                int sortOrder = 1;
                for (Part part : parts) {
                    if ("imageUrls".equals(part.getName()) && part.getSize() > 0) {
                        String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                        String uploadPath = "D:/doan2/BeautyComestic-master (1)/BeautyComestic-master/web/uploaded_images/";
                        if (!uploadPath.endsWith(File.separator)) uploadPath += File.separator;
                        File uploadDir = new File(uploadPath);
                        if (!uploadDir.exists()) uploadDir.mkdirs();
                        try (InputStream input = part.getInputStream();
                             FileOutputStream output = new FileOutputStream(uploadPath + fileName)) {
                            byte[] buffer = new byte[1024];
                            int bytesRead;
                            while ((bytesRead = input.read(buffer)) != -1) {
                                output.write(buffer, 0, bytesRead);
                            }
                        }
                        ProductImage img = new ProductImage();
                        img.setProductId(newProductId);
                        img.setImageUrl("uploaded_images/" + fileName);
                        img.setAltText(name);
                        img.setSortOrder(sortOrder++);
                        img.setPrimary(false);
                        imageDao.addProductImage(img);
                    }
                }
                response.sendRedirect("category.jsp");
                return;
            } else {
                dao.updateProduct(p);
                response.sendRedirect("product?action=list");
                return;
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("exception", e);
            request.getRequestDispatcher("error.jsp").forward(request, response);
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
