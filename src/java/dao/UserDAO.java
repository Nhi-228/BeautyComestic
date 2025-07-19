package dao;

import model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private final Connection conn;

    public UserDAO() throws Exception {
        this.conn = connect.kn();
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
        String sql = "SELECT * FROM users WHERE email = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return extractUser(rs);
                }
            }
        }
        return null;
    }

    // Thêm người dùng
    public int add(User u) throws SQLException {
        String sql = "INSERT INTO users(full_name, username, email, phone, password, address, role, created_at, updated_at, verified, blocked, is_active) " +
                     "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getFull_name());
            ps.setString(2, u.getUsername());
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getPhone());
            ps.setString(5, u.getPassword());
            ps.setString(6, u.getAddress());
            ps.setString(7, u.getRole());
            ps.setString(8, u.getCreated_at());
            ps.setString(9, u.getUpdated_at());
            ps.setBoolean(10, u.isVerified());
            ps.setBoolean(11, u.isBlocked());
            ps.setBoolean(12, u.isActive());
            return ps.executeUpdate();
        }
    }

    // Kiểm tra username hoặc email đã tồn tại
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

    // Lấy danh sách nhân viên
    public List<User> getAllStaff() throws SQLException {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE role = 'staff'";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractUser(rs));
            }
        }
        return list;
    }

    // Lấy user theo ID
    public User getUserById(int id) throws SQLException {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            return extractUser(rs);
        }
        return null;
    }

    // Lấy danh sách khách hàng
    public List<User> getAllCustomers() throws Exception {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE role = 'customer'";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            list.add(extractUser(rs));
        }
        return list;
    }

    // Đếm đơn giao thành công
    public int countSuccessfulOrdersByCustomer(int userId) throws Exception {
        String sql = "SELECT COUNT(*) FROM orders WHERE customer_id = ? AND status = 'DELIVERED'";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) return rs.getInt(1);
        return 0;
    }

    // Đếm đơn đã hủy
    public int countCanceledOrdersByCustomer(int userId) throws Exception {
        String sql = "SELECT COUNT(*) FROM orders WHERE customer_id = ? AND status = 'CANCELLED'";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) return rs.getInt(1);
        return 0;
    }

    // Hàm extractUser để tái sử dụng
    private User extractUser(ResultSet rs) throws SQLException {
        User user = new User();
        user.setUser_id(rs.getInt("user_id"));
        user.setUsername(rs.getString("username"));
        user.setEmail(rs.getString("email"));
        user.setPassword(rs.getString("password"));
        user.setFull_name(rs.getString("full_name"));
        user.setPhone(rs.getString("phone"));
        user.setAddress(rs.getString("address"));
        user.setRole(rs.getString("role"));
        user.setCreated_at(rs.getString("created_at"));
        user.setUpdated_at(rs.getString("updated_at"));
        user.setVerified(rs.getBoolean("verified"));
        user.setBlocked(rs.getBoolean("blocked"));
        user.setActive(rs.getBoolean("is_active"));
        return user;
    }
    public void updateVerified(int userId) throws SQLException {
    String sql = "UPDATE users SET verified = NOT verified WHERE user_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, userId);
        ps.executeUpdate();
    }
}

public void updateBlocked(int userId) throws SQLException {
    String sql = "UPDATE users SET blocked = NOT blocked WHERE user_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, userId);
        ps.executeUpdate();
    }
}

public void updateActive(int userId) throws SQLException {
    String sql = "UPDATE users SET is_active = NOT is_active WHERE user_id = ?";
    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, userId);
        ps.executeUpdate();
    }
}
}