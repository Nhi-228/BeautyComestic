package controller;

import dao.ProductDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/deleteproduct"})
public class DeleteProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        try {
            if (idStr != null && !idStr.isEmpty()) {
                int id = Integer.parseInt(idStr);
                ProductDao dao = new ProductDao();
                dao.deleteProduct(id);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("viewProduct");
    }
} 