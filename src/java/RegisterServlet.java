
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
                    request.setAttribute("message", "Đăng ký thành công!");
                } else {
                    request.setAttribute("message", "Đăng ký thất bại! Vui lòng thử lại.");
                }
            } else {
                request.setAttribute("message", "Tài khoản hoặc email đã tồn tại!");
            }
            request.getRequestDispatcher("register.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Lỗi khi xử lý đăng ký", e);
        }
    }
}
