/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Product;
import model.ProductImage;
import model.ProductVariant;
import  dao.ProductDao;
import jakarta.servlet.annotation.MultipartConfig;
import java.math.BigDecimal;
import java.sql.*;
import java.util.*;
/**
 *
 * @author BINH NHI
 */
@WebServlet(urlPatterns = {"/addproduct"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
                 maxFileSize = 10 * 1024 * 1024,
                 maxRequestSize = 50 * 1024 * 1024)

public class addproduct extends HttpServlet {
private ProductDao productDao;
 public void init() throws ServletException {
        try {
            productDao = new ProductDao(); // dùng constructor mặc định
        } catch (Exception e) {
            throw new ServletException("Lỗi khởi tạo ProductDao", e);
        }
    }


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
            out.println("<title>Servlet addproduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addproduct at " + request.getContextPath() + "</h1>");
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
      request.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu sản phẩm từ request
        String productName     = request.getParameter("productName");
        String description = request.getParameter("description");
String usage = request.getParameter("usage");

String fullDescription = description + "\n\n[Cách sử dụng]\n" + usage;
        double price           = Double.parseDouble(request.getParameter("price"));
        double discountPrice   = Double.parseDouble(request.getParameter("discountPrice"));
        int stockQuantity      = Integer.parseInt(request.getParameter("stockQuantity"));
        String sku             = request.getParameter("sku");
        String ingredients     = request.getParameter("ingredients");
        String imageUrl        = request.getParameter("imageUrl");
        int categoryId         = Integer.parseInt(request.getParameter("categoryId"));
        int brandId            = Integer.parseInt(request.getParameter("brandId"));
       String status = (stockQuantity > 0) ? "Còn hàng" : "Hết hàng";
        double ratingAverage   = Double.parseDouble(request.getParameter("ratingAverage"));
        int reviewCount        = Integer.parseInt(request.getParameter("reviewCount"));
        Timestamp now          = new Timestamp(System.currentTimeMillis());

        Product product = new Product(0, productName, fullDescription, price, discountPrice,
                stockQuantity, sku, ingredients, imageUrl, "", // imageGallery sẽ cập nhật sau
                categoryId, brandId, status, ratingAverage, reviewCount, now, now);

        // Lấy danh sách ảnh từ form
        String[] imageUrls = request.getParameterValues("imageUrls");
        List<ProductImage> imageList = new ArrayList<>();
        if (imageUrls != null) {
            for (int i = 0; i < imageUrls.length; i++) {
                ProductImage img = new ProductImage(0, 0, imageUrls[i], "Ảnh phụ " + (i + 1), i, i == 0);
                imageList.add(img);
            }
        }

        // Lấy danh sách biến thể từ form
        String[] variantNames     = request.getParameterValues("variantNames");
        String[] variantValues    = request.getParameterValues("variantValues");
        String[] priceAdjustments = request.getParameterValues("priceAdjustments");
        String[] variantSKUs      = request.getParameterValues("variantSKUs");

        List<ProductVariant> variantList = new ArrayList<>();
        if (variantNames != null && variantValues != null &&
            priceAdjustments != null && variantSKUs != null) {

            for (int i = 0; i < variantNames.length; i++) {
                ProductVariant variant = new ProductVariant(
                        0, 0,
                        variantNames[i],
                        variantValues[i],
                        new BigDecimal(priceAdjustments[i]),
                        stockQuantity,
                        variantSKUs[i],
                        true
                );
                variantList.add(variant);
            }
        }

        try {
            boolean success = productDao.addFullProduct(product, imageList, variantList);
            if (success) {
                request.setAttribute("message", "Thêm sản phẩm thành công");
request.setAttribute("productId", product.getProductId()); // ID vừa thêm
request.getRequestDispatcher("product.jsp").forward(request, response);
            } else {
                response.getWriter().println("Thêm sản phẩm thất bại!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi khi thêm sản phẩm: " + e.getMessage());
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
