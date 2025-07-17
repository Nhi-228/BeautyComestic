
import java.sql.*;

public class UserDAO {
    private final Connection conn;

    public UserDAO() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cosmetics_store", "root", "");
    }

    public boolean checkLogin(String email, String password) throws SQLException {
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        return rs.next(); // Nếu có dòng nào khớp => đúng
    }
    public User getUserByEmail(String email) throws SQLException {
        String sql = "SELECT user_id, username, email, password, full_name, phone, address, role FROM users WHERE email = ? AND password = ?";

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
    public int add(User u) throws SQLException {
    String sql = "INSERT INTO users(full_name,username,email,phone,password,address) VALUES(?,?,?,?,?,?)";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setString(1, u.getFull_name());
      ps.setString(2, u.getUsername());
      ps.setString(3, u.getEmail());
      ps.setString(4, u.getPhone());
      ps.setString(5, u.getPassword());
      ps.setString(6, u.getAddress());
      return ps.executeUpdate();
    }
        
}
    public boolean exists(String username, String email) throws SQLException {
    String sql = "SELECT user_id FROM users WHERE username=? OR email=?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
      ps.setString(1, username);
      ps.setString(2, email);
      try (ResultSet rs = ps.executeQuery()) {
        return rs.next();
      }
    }
  }
}
