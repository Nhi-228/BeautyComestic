package dao;

import model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private final Connection conn;

    // Constructor để khởi tạo kết nối
    public UserDAO() throws Exception {
        this.conn = connect.kn(); // Gọi phương thức kn() từ lớp connect
    }

    // Kiểm tra đăng nhập
    public boolean checkLogin(String email, String password) throws SQLException {
    String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, email);
        stmt.setString(2, password);
        try (ResultSet rs = stmt.executeQuery()) {
            return rs.next();
        }
    }
}

    // Lấy thông tin user theo email
    public User getUserByEmail(String email) throws SQLException {
        String sql = "SELECT user_id, username, email, password, full_name, phone, address, role FROM users WHERE email = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User u = new User();
                    u.setUser_id(rs.getInt("user_id"));
                    u.setUsername(rs.getString("username"));
                    u.setEmail(rs.getString("email"));
                    u.setPassword(rs.getString("password"));
                    u.setFull_name(rs.getString("full_name"));
                    u.setPhone(rs.getString("phone"));
                    u.setAddress(rs.getString("address"));
                    u.setRole(rs.getString("role"));
                    return u;
                }
            }
        }
        return null;
    }

    // Thêm người dùng
  public int add(User u) throws SQLException {
    String sql = "INSERT INTO users(full_name, username, email, phone, password, address, updated_at, role) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, u.getFull_name());
        ps.setString(2, u.getUsername());
        ps.setString(3, u.getEmail());
        ps.setString(4, u.getPhone());
        ps.setString(5, u.getPassword());
        ps.setString(6, u.getAddress());
        ps.setString(7, u.getUpdate_at()); // giá trị yyyy-MM-dd
        ps.setString(8, u.getRole());      // bạn nên set mặc định là "staff" nếu cần
        return ps.executeUpdate();
    }
}
    // Kiểm tra username hoặc email đã tồn tại chưa
    public boolean exists(String username, String email) throws SQLException {
        String sql = "SELECT user_id FROM users WHERE username = ? OR email = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }
    public List<User> getAllStaff() throws SQLException {
    List<User> list = new ArrayList<>();
    String sql = "SELECT * FROM users WHERE role = 'staff'";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            User u = new User();
            u.setUser_id(rs.getInt("user_id"));
            u.setUsername(rs.getString("username"));
            u.setEmail(rs.getString("email"));
            u.setPassword(rs.getString("password"));
            u.setFull_name(rs.getString("full_name"));
            u.setPhone(rs.getString("phone"));
            u.setAddress(rs.getString("address"));
            u.setRole(rs.getString("role"));
            u.setUpdate_at(rs.getString("updated_at"));
            list.add(u);
        }
    }
    return list;
}
public User getUserById(int id) throws SQLException {
    String sql = "SELECT * FROM users WHERE user_id = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setInt(1, id);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
        User user = new User();
        user.setUser_id(rs.getInt("user_id"));
        user.setUsername(rs.getString("username"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setFull_name(rs.getString("full_name"));
        user.setPhone(rs.getString("phone"));
        user.setAddress(rs.getString("address"));
        user.setRole(rs.getString("role"));
        user.setUpdate_at(rs.getString("updated_at"));
        return user;
    }
    return null;
}

}
