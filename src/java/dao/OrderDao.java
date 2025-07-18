/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import model.Order;
import java.sql.*;
import java.util.*;
/**
 *
 * @author BINH NHI
 */
public class OrderDao {
    private Connection conn;

    public OrderDao() throws Exception {
        conn = connect.kn();  // Kết nối đến DB
    }

    public List<Order> getAllOrders() throws SQLException {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            Order o = new Order();
            o.setOrderId(rs.getInt("order_id"));
            o.setOrderNumber(rs.getString("order_number"));
            o.setCustomerId(rs.getInt("customer_id"));
            o.setSubtotal(rs.getDouble("subtotal"));
            o.setShippingFee(rs.getDouble("shipping_fee"));
            o.setDiscountAmount(rs.getDouble("discount_amount"));
            o.setTotalAmount(rs.getDouble("total_amount"));
            o.setStatus(rs.getString("status"));
            o.setPaymentStatus(rs.getString("payment_status"));
            o.setPaymentMethod(rs.getString("payment_method"));
            o.setShippingAddress(rs.getString("shipping_address"));
            o.setShippingPhone(rs.getString("shipping_phone"));
            o.setOrderDate(rs.getDate("order_date"));
            o.setDeliveryDate(rs.getDate("delivery_date"));
            o.setNotes(rs.getString("notes"));
            list.add(o);
        }
        return list;
    }
    
public int countAllOrders() throws Exception {
    String sql = "SELECT COUNT(*) FROM orders";
    Connection conn = connect.kn();
    PreparedStatement ps = conn.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        return rs.getInt(1);
    }
    return 0;
}
}
