package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class ProductDao {

    private Connection conn;

    public ProductDao() throws Exception {
        conn = connect.kn();
        if (conn == null) {
            throw new SQLException("Không thể kết nối tới cơ sở dữ liệu. Hãy kiểm tra lại kết nối!");
        }
    }

    // Thêm sản phẩm mới
    public void addProduct(Product product) throws SQLException {
        String sql = "INSERT INTO products (product_name, description, price, discount_price, stock_quantity, image_url, image_gallery, category_id, brand_id, active, created_at, updated_at) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setDouble(4, product.getDiscountPrice());
            ps.setInt(5, product.getStockQuantity());
            ps.setString(6, product.getImageUrl());
            ps.setString(7, product.getImageGallery());
            ps.setObject(8, product.getCategoryId(), Types.INTEGER);
            ps.setObject(9, product.getBrandId(), Types.INTEGER);
            ps.setBoolean(10, product.isActive());
            ps.setTimestamp(11, product.getCreatedAt());
            ps.setTimestamp(12, product.getUpdatedAt());
            ps.executeUpdate();
        }
    }

    // Cập nhật sản phẩm
    public void updateProduct(Product product) throws SQLException {
        String sql = "UPDATE products SET product_name = ?, description = ?, price = ?, discount_price = ?, stock_quantity = ?, "
                   + "image_url = ?, image_gallery = ?, category_id = ?, brand_id = ?, active = ?, updated_at = ? "
                   + "WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setDouble(3, product.getPrice());
            ps.setDouble(4, product.getDiscountPrice());
            ps.setInt(5, product.getStockQuantity());
            ps.setString(6, product.getImageUrl());
            ps.setString(7, product.getImageGallery());
            ps.setObject(8, product.getCategoryId(), Types.INTEGER);
            ps.setObject(9, product.getBrandId(), Types.INTEGER);
            ps.setBoolean(10, product.isActive());
            ps.setTimestamp(11, product.getUpdatedAt());
            ps.setInt(12, product.getProductId());
            ps.executeUpdate();
        }
    }

    // Xóa sản phẩm
    public void deleteProduct(int productId) throws SQLException {
        String sql = "DELETE FROM products WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ps.executeUpdate();
        }
    }

    // Lấy tất cả sản phẩm
    public List<Product> getAllProducts() throws SQLException {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Product p = new Product();
                p.setProductId(rs.getInt("product_id"));
                p.setProductName(rs.getString("product_name"));
                p.setDescription(rs.getString("description"));
                p.setPrice(rs.getDouble("price"));
                p.setDiscountPrice(rs.getDouble("discount_price"));
                p.setStockQuantity(rs.getInt("stock_quantity"));
                p.setImageUrl(rs.getString("image_url"));
                p.setImageGallery(rs.getString("image_gallery"));
                p.setCategoryId((Integer) rs.getObject("category_id"));
                p.setBrandId((Integer) rs.getObject("brand_id"));
                p.setActive(rs.getBoolean("active"));
                p.setRatingAverage(rs.getFloat("rating_average"));
                p.setReviewCount(rs.getInt("review_count"));
                p.setCreatedAt(rs.getTimestamp("created_at"));
                p.setUpdatedAt(rs.getTimestamp("updated_at"));
                list.add(p);
            }
        }
        return list;
    }

    // Lấy sản phẩm theo ID
    public Product getProductById(int id) throws SQLException {
        String sql = "SELECT * FROM products WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Product p = new Product();
                    p.setProductId(rs.getInt("product_id"));
                    p.setProductName(rs.getString("product_name"));
                    p.setDescription(rs.getString("description"));
                    p.setPrice(rs.getDouble("price"));
                    p.setDiscountPrice(rs.getDouble("discount_price"));
                    p.setStockQuantity(rs.getInt("stock_quantity"));
                    p.setImageUrl(rs.getString("image_url"));
                    p.setImageGallery(rs.getString("image_gallery"));
                    p.setCategoryId((Integer) rs.getObject("category_id"));
                    p.setBrandId((Integer) rs.getObject("brand_id"));
                    p.setActive(rs.getBoolean("active"));
                    p.setRatingAverage(rs.getFloat("rating_average"));
                    p.setReviewCount(rs.getInt("review_count"));
                    p.setCreatedAt(rs.getTimestamp("created_at"));
                    p.setUpdatedAt(rs.getTimestamp("updated_at"));
                    return p;
                }
            }
        }
        return null;
    }
}
