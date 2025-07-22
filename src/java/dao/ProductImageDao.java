package dao;

import java.sql.*;
import model.ProductImage;

public class ProductImageDao {
    private Connection conn;
    public ProductImageDao() throws Exception {
        conn = connect.kn();
        if (conn == null) throw new SQLException("Không thể kết nối tới CSDL!");
    }
    public void addProductImage(ProductImage img) throws SQLException {
        String sql = "INSERT INTO product_images (product_id, image_url, alt_text, sort_order, is_primary) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, img.getProductId());
            ps.setString(2, img.getImageUrl());
            ps.setString(3, img.getAltText());
            ps.setInt(4, img.getSortOrder());
            ps.setBoolean(5, img.isPrimary());
            ps.executeUpdate();
        }
    }
    // Lấy ảnh đại diện (is_primary=1) theo product_id
    public ProductImage getPrimaryImageByProductId(int productId) throws SQLException {
        String sql = "SELECT * FROM product_images WHERE product_id = ? AND is_primary = 1 LIMIT 1";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    ProductImage img = new ProductImage();
                    img.setImageId(rs.getInt("image_id"));
                    img.setProductId(rs.getInt("product_id"));
                    img.setImageUrl(rs.getString("image_url"));
                    img.setAltText(rs.getString("alt_text"));
                    img.setSortOrder(rs.getInt("sort_order"));
                    img.setPrimary(rs.getBoolean("is_primary"));
                    return img;
                }
            }
        }
        return null;
    }
} 