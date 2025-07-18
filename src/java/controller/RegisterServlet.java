package controller;


import dao.UserDAO;
import model.User;
import jakarta.mail.Transport;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import static java.lang.System.out;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String sdt = request.getParameter("sdt");
        String fullname = request.getParameter("fullname");
        String address = request.getParameter("address");

        User u = new User(username, email, password, sdt, fullname, address);
        try {
            UserDAO dao = new UserDAO();
            boolean isValid = dao.exists(username, email);
            if (!isValid) {
                int result = dao.add(u);
                if (result > 0) {
                    out.println("<!DOCTYPE html>");
                    out.println("<html><head><title>Đăng ký</title></head><body>");
                    out.println("<h2>Đăng ký thành công!</h2>");
                    out.println("<a href='login.jsp'>Đăng nhập ngay</a>");
                    out.println("</body></html>");

                    response.sendRedirect("login.html");
                } else {
                    out.println("<h3>Đăng ký thất bại!</h3>");
                }
            } else {
                out.println("<h3>Tài khoản hoặc email đã tồn tại!</h3>");
            }

        } catch (Exception e) {
            throw new ServletException("Lỗi khi xử lý đăng ký", e);
        }
    }
}
