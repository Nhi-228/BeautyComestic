
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false); // không tạo nếu không tồn tại
        try {
            UserDAO dao = new UserDAO();
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        if (session != null && session.getAttribute("userEmail") != null) {
            // Nếu tồn tại email trong session → chuyển tiếp tới home.jsp
            req.getRequestDispatcher("/home.jsp").forward(req, resp);
        } else {
            // Ngược lại redirect về login
            resp.sendRedirect("login.html");
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Nếu ai gửi POST tới /home, có thể xử lý tương tự GET
        doGet(req, resp);
    }
}
