package dao;

import java.sql.*;
import java.util.*;
import model.Order;
import model.Order;

public class OrderDao {
    private Connection conn;

    public OrderDao() {
        try {
            conn = Connect.getConnection(); // Đổi từ connect thành Connect (viết hoa đúng class name)
            if (conn == null) {
                System.err.println("Không thể kết nối đến cơ sở dữ liệu trong OrderDao.");
            }
        } catch (Exception e) {
            System.err.println("Lỗi khi khởi tạo OrderDao: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders ORDER BY order_date DESC";
        if (conn == null) return list;

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Order o = new Order(
                    rs.getInt("order_id"),
                    rs.getString("order_number"),
                    rs.getInt("customer_id"),
                    rs.getDouble("subtotal"),
                    rs.getDouble("shipping_fee"),
                    rs.getDouble("discount_amount"),
                    rs.getDouble("total_amount"),
                    rs.getString("status"),
                    rs.getString("payment_status"),
                    rs.getString("payment_method"),
                    rs.getString("shipping_address"),
                    rs.getString("shipping_phone"),
                    rs.getDate("order_date"),
                    rs.getDate("delivery_date"),
                    rs.getString("notes")
                );
                list.add(o);
            }
        } catch (SQLException e) {
            System.err.println("Lỗi trong getAllOrders: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public Map<String, Double> getRevenueByDate() {
        Map<String, Double> revenueMap = new LinkedHashMap<>();
        String sql = "SELECT DATE(order_date) AS date, SUM(total_amount) AS revenue " +
                     "FROM orders GROUP BY DATE(order_date) ORDER BY DATE(order_date)";
        if (conn == null) return revenueMap;

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                revenueMap.put(rs.getString("date"), rs.getDouble("revenue"));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi trong getRevenueByDate: " + e.getMessage());
            e.printStackTrace();
        }
        return revenueMap;
    }

    public int countAllOrders() {
        String sql = "SELECT COUNT(*) FROM orders";
        if (conn == null) return 0;

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            System.err.println("Lỗi trong countAllOrders: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }

    public int countSuccessfulOrders() {
        String sql = "SELECT COUNT(*) FROM orders WHERE status = 'Delivered'";
        if (conn == null) return 0;

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            System.err.println("Lỗi trong countSuccessfulOrders: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }

    public int countFailedOrders() {
        String sql = "SELECT COUNT(*) FROM orders WHERE status = 'Failed'";
        if (conn == null) return 0;

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            System.err.println("Lỗi trong countFailedOrders: " + e.getMessage());
            e.printStackTrace();
        }
        return 0;
    }
}
