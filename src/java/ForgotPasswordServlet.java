import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.User;
import dao.UserDAO;

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        try {
            UserDAO userDAO = new UserDAO();
            User user = userDAO.getUserByEmail(email);

            if (user != null) {
                // Hiển thị mật khẩu ra màn hình (KHÔNG an toàn, chỉ demo)
                request.setAttribute("message", "Mật khẩu của bạn là: " + user.getPassword());
            } else {
                request.setAttribute("error", "Email không tồn tại!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi!");
        }

        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
    }
}
