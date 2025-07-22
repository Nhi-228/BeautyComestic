package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.ProductImage;

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
        String sql = "INSERT INTO products (product_name, description, price, discount_price, stock_quantity, sku, ingredients, imageUrl, category_id, brand_id, status, rating_average, review_count, created_at, updated_at) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setBigDecimal(3, product.getPrice());
            ps.setBigDecimal(4, product.getDiscountPrice());
            ps.setInt(5, product.getStockQuantity());
            ps.setString(6, product.getSku());
            ps.setString(7, product.getIngredients());
            ps.setString(8, product.getImageUrl());
            ps.setInt(9, product.getCategoryId());
            ps.setInt(10, product.getBrandId());
            ps.setString(11, product.getStatus());
            ps.setFloat(12, product.getRatingAverage());
            ps.setInt(13, product.getReviewCount());
            ps.setTimestamp(14, product.getCreatedAt());
            ps.setTimestamp(15, product.getUpdatedAt());
            ps.executeUpdate();
        }
    }

    // Thêm sản phẩm mới và trả về product_id vừa tạo
    public int addProductReturnId(Product product) throws SQLException {
        String sql = "INSERT INTO products (product_name, description, price, discount_price, stock_quantity, sku, ingredients, category_id, brand_id, status, rating_average, review_count, created_at, updated_at) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setBigDecimal(3, product.getPrice());
            ps.setBigDecimal(4, product.getDiscountPrice());
            ps.setInt(5, product.getStockQuantity());
            ps.setString(6, product.getSku());
            ps.setString(7, product.getIngredients());
            ps.setInt(8, product.getCategoryId());
            ps.setInt(9, product.getBrandId());
            ps.setString(10, product.getStatus());
            ps.setFloat(11, product.getRatingAverage());
            ps.setInt(12, product.getReviewCount());
            ps.setTimestamp(13, product.getCreatedAt());
            ps.setTimestamp(14, product.getUpdatedAt());
            int affectedRows = ps.executeUpdate();
            if (affectedRows == 0) throw new SQLException("Creating product failed, no rows affected.");
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating product failed, no ID obtained.");
                }
            }
        }
    }

    // Cập nhật sản phẩm
    public void updateProduct(Product product) throws SQLException {
        String sql = "UPDATE products SET product_name = ?, description = ?, price = ?, discount_price = ?, stock_quantity = ?, sku = ?, ingredients = ?, "
                   + "imageUrl = ?, category_id = ?, brand_id = ?, status = ?, rating_average = ?, review_count = ?, updated_at = ? "
                   + "WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, product.getProductName());
            ps.setString(2, product.getDescription());
            ps.setBigDecimal(3, product.getPrice());
            ps.setBigDecimal(4, product.getDiscountPrice());
            ps.setInt(5, product.getStockQuantity());
            ps.setString(6, product.getSku());
            ps.setString(7, product.getIngredients());
            ps.setString(8, product.getImageUrl());
            ps.setInt(9, product.getCategoryId());
            ps.setInt(10, product.getBrandId());
            ps.setString(11, product.getStatus());
            ps.setFloat(12, product.getRatingAverage());
            ps.setInt(13, product.getReviewCount());
            ps.setTimestamp(14, product.getUpdatedAt());
            ps.setInt(15, product.getProductId());
            ps.executeUpdate();
        }
    }

    // Xóa sản phẩm
    public void deleteProduct(int productId) throws SQLException {
        // Xóa ảnh liên quan trước
        String sqlImg = "DELETE FROM product_images WHERE product_id = ?";
        try (PreparedStatement psImg = conn.prepareStatement(sqlImg)) {
            psImg.setInt(1, productId);
            psImg.executeUpdate();
        }
        // Sau đó xóa sản phẩm
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
                p.setPrice(rs.getBigDecimal("price"));
                p.setDiscountPrice(rs.getBigDecimal("discount_price"));
                p.setStockQuantity(rs.getInt("stock_quantity"));
                p.setSku(rs.getString("sku"));
                p.setIngredients(rs.getString("ingredients"));
                p.setCategoryId(rs.getInt("category_id"));
                p.setBrandId(rs.getInt("brand_id"));
                p.setStatus(rs.getString("status"));
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
                    p.setPrice(rs.getBigDecimal("price"));
                    p.setDiscountPrice(rs.getBigDecimal("discount_price"));
                    p.setStockQuantity(rs.getInt("stock_quantity"));
                    p.setSku(rs.getString("sku"));
                    p.setIngredients(rs.getString("ingredients"));
                    p.setCategoryId(rs.getInt("category_id"));
                    p.setBrandId(rs.getInt("brand_id"));
                    p.setStatus(rs.getString("status"));
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