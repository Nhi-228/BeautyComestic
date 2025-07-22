/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;
import dao.OrderDao;
import java.sql.*;
import java.util.*;
import model.Order;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author BINH NHI
 */
@WebServlet(name = "ReportServlet", urlPatterns = {"/report"})
public class ReportServlet extends HttpServlet {


    private OrderDao orderDao;

    @Override
    public void init() throws ServletException {
        try {
            orderDao = new OrderDao();
        } catch (Exception e) {
            throw new ServletException("Lỗi khi khởi tạo OrderDao", e);
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
            out.println("<title>Servlet ReportServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReportServlet at " + request.getContextPath() + "</h1>");
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
       try {
            // Lấy dữ liệu thống kê từ DAO
            Map<String, Double> revenueMap = orderDao.getRevenueByDate();
            int totalOrders = orderDao.countAllOrders();
            int successfulOrders = orderDao.countSuccessfulOrders();
            int failedOrders = orderDao.countFailedOrders();

            // Gửi dữ liệu sang JSP
            request.setAttribute("revenueMap", revenueMap);
            request.setAttribute("totalOrders", totalOrders);
            request.setAttribute("successfulOrders", successfulOrders);
            request.setAttribute("failedOrders", failedOrders);

            // Chuyển tiếp đến trang báo cáo
            request.getRequestDispatcher("report.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Lỗi khi lấy dữ liệu thống kê", e);
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
       // processRequest(request, response);
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
