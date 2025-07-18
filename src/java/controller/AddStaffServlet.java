/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import model.User;

/**
 *
 * @author BINH NHI
 */
@WebServlet(name = "AddStaffServlet", urlPatterns = {"/addstaff"})
public class AddStaffServlet extends HttpServlet {

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
            out.println("<title>Servlet addstaff</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addstaff at " + request.getContextPath() + "</h1>");
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
      response.sendRedirect("managerstaff.jsp");
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
    try {
    request.setCharacterEncoding("UTF-8");

    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String fullName = request.getParameter("full_name");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String role = request.getParameter("role");
    String password = request.getParameter("password");

    // Thêm dòng tạo updatedAt
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    String updatedAt = LocalDateTime.now().format(formatter);

    User user = new User();
    user.setUsername(username);
    user.setEmail(email);
    user.setFull_name(fullName);
    user.setPhone(phone);
    user.setAddress(address);
    user.setRole(role);
    user.setPassword(password);
    user.setUpdate_at(updatedAt);  // Gọi setter

    UserDAO dao = new UserDAO();
    dao.add(user);

    response.sendRedirect("managerstaff.jsp");
} catch (Exception e) {
    e.printStackTrace();
    response.getWriter().println("Lỗi: " + e.getMessage());
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
