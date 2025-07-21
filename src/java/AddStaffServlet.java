
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.User;

@WebServlet("/ADMIN/addstaff")
public class AddStaffServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String fullname = req.getParameter("full_name");
        String sdt = req.getParameter("phone");
        String address = req.getParameter("address");
        String role = req.getParameter("role");

        User u = new User(username, email, password, sdt, fullname, address, role);
        try {
            UserDAO dao = new UserDAO();
            boolean isValid = dao.exists(username, email);
            if (!isValid) {
                int result = dao.addStaff(u);
                if (result > 0) {
                    req.setAttribute("message", "Thêm nhân viên thành công!");
                } else {
                    req.setAttribute("message", "Thêm thất bại. Kiểm tra lại.");
                }
            } else {
                req.setAttribute("message", "Tên đăng nhập hoặc email đã tồn tại!");
            }
            req.getRequestDispatcher("addstaff.jsp").forward(req, res);
        } catch (Exception e) {
            throw new ServletException("Lỗi khi xử lý đăng ký", e);
        }
    }
}
