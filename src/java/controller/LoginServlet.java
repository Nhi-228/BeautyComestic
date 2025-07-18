package controller;


import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            UserDAO dao = new UserDAO();
            boolean isValid = dao.checkLogin(email, password);
            if (isValid) {
                HttpSession session = req.getSession(); // tạo hoặc lấy session hiện tại
                session.setAttribute("userEmail", email);   // lưu email vào session
                res.sendRedirect("home");              // hoặc forward
            } else {
                res.sendRedirect("login.html?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("login.html?error=true");
        }
    }
}
/*
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        System.out.println("🔥 LoginServlet has been CALLED");
        res.getWriter().println("✅ LoginServlet is working");
    }
}*/
