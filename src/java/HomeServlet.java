
import jakarta.enterprise.context.SessionScoped;
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
           
            if (session != null && session.getAttribute("userEmail") != null) {
                
            String email = (String) session.getAttribute("userEmail");
            String fullName = (String) session.getAttribute("userFullName");
            String role = (String) session.getAttribute("userRole");
            String userName = (String) session.getAttribute("userName");
            // Đẩy dữ liệu sang JSP để hiển thị
            req.setAttribute("email", email);
            req.setAttribute("fullName", fullName);
            req.setAttribute("role", role);
            req.setAttribute("userName", userName);
            // Nếu tồn tại email trong session → chuyển tiếp tới home.jsp
                if ("admin".equalsIgnoreCase(role)) {
                    resp.sendRedirect("ADMIN/Admin.jsp"); // hoặc "admin/home"
                } else if ("customer".equalsIgnoreCase(role)) {
                    resp.sendRedirect("home.jsp"); // hoặc "home"
                }
        } else {
            // Ngược lại redirect về login
            resp.sendRedirect("login.html");
        }       
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Nếu ai gửi POST tới /home, có thể xử lý tương tự GET
        doGet(req, resp);
    }
}
