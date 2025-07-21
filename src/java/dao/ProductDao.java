package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import model.ProductImage;
import model.ProductVariant;

public class ProductDao {

    private Connection conn;

    // Constructor có tham số cho servlet truyền connection vào
    public ProductDao(Connection connection) throws SQLException {
        this.conn = connection;
        if (this.conn == null) {
            throw new SQLException("Không thể kết nối tới cơ sở dữ liệu!");
        }
    }

    // Constructor mặc định vẫn gọi Connect nếu cần
    public ProductDao() throws Exception {
        this(Connect.getConnection());
    }



   public int addProduct(Product product) throws SQLException {
    String sql = "INSERT INTO products (product_name, description, price, discount_price, stock_quantity, sku, ingredients, image_url, image_gallery, category_id, brand_id, status, rating_average, review_count, created_at, updated_at) " +
                 "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
        stmt.setString(1, product.getProductName());
        stmt.setString(2, product.getDescription());
        stmt.setDouble(3, product.getPrice());
        stmt.setDouble(4, product.getDiscountPrice());
        stmt.setInt(5, product.getStockQuantity());
        stmt.setString(6, product.getSku());
        stmt.setString(7, product.getIngredients());
        stmt.setString(8, product.getImageUrl());
        stmt.setString(9, product.getImageGallery());
        stmt.setInt(10, product.getCategoryId());
        stmt.setInt(11, product.getBrandId());
        stmt.setString(12, product.getStatus());
        stmt.setDouble(13, product.getRatingAverage());
        stmt.setInt(14, product.getReviewCount());
        stmt.setTimestamp(15, product.getCreatedAt());
        stmt.setTimestamp(16, product.getUpdatedAt());

        int affectedRows = stmt.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Không thể thêm sản phẩm, không có dòng nào bị ảnh hưởng.");
        }

        try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
            if (generatedKeys.next()) {
                return generatedKeys.getInt(1);
            } else {
                throw new SQLException("Không lấy được ID của sản phẩm vừa thêm.");
            }
        }
    }
}

    public boolean addProductImage(ProductImage image) throws SQLException {
    String sql = "INSERT INTO product_images (product_id, image_url, alt_text, sort_order, is_primary) VALUES (?, ?, ?, ?, ?)";
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, image.getProductId());
        stmt.setString(2, image.getImageUrl());
        stmt.setString(3, image.getAltText());
        stmt.setInt(4, image.getSortOrder());
        stmt.setBoolean(5, image.isPrimary());
        return stmt.executeUpdate() > 0;
    }
}
    public boolean addProductVariant(ProductVariant variant) throws SQLException {
    String sql = "INSERT INTO product_variants (product_id, variant_name, variant_value, price_adjustment, stock_quantity, sku, is_active) " +
                 "VALUES (?, ?, ?, ?, ?, ?, ?)";
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, variant.getProductId());
        stmt.setString(2, variant.getVariantName());
        stmt.setString(3, variant.getVariantValue());
        stmt.setBigDecimal(4, variant.getPriceAdjustment());
        stmt.setInt(5, variant.getStockQuantity());
        stmt.setString(6, variant.getSku());
        stmt.setBoolean(7, variant.isActive());
        return stmt.executeUpdate() > 0;
    }
}
    public Product getProductById(int productId) throws SQLException {
    String sql = "SELECT * FROM products WHERE product_id = ?";
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, productId);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            return new Product(
                rs.getInt("product_id"),
                rs.getString("product_name"),
                rs.getString("description"),
                rs.getDouble("price"),
                rs.getDouble("discount_price"),
                rs.getInt("stock_quantity"),
                rs.getString("sku"),
                rs.getString("ingredients"),
                rs.getString("image_url"),
                rs.getString("image_gallery"),
                rs.getInt("category_id"),
                rs.getInt("brand_id"),
                rs.getString("status"),
                rs.getDouble("rating_average"),
                rs.getInt("review_count"),
                rs.getTimestamp("created_at"),
                rs.getTimestamp("updated_at")
            );
        }
    }
    return null; // không tìm thấy sản phẩm
}
    public List<Product> getAllProducts() throws SQLException {
    List<Product> products = new ArrayList<>();
    String sql = "SELECT * FROM products";
    try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            Product p = new Product(
                rs.getInt("product_id"),
                rs.getString("product_name"),
                rs.getString("description"),
                rs.getDouble("price"),
                rs.getDouble("discount_price"),
                rs.getInt("stock_quantity"),
                rs.getString("sku"),
                rs.getString("ingredients"),
                rs.getString("image_url"),
                rs.getString("image_gallery"),
                rs.getInt("category_id"),
                rs.getInt("brand_id"),
                rs.getString("status"),
                rs.getDouble("rating_average"),
                rs.getInt("review_count"),
                rs.getTimestamp("created_at"),
                rs.getTimestamp("updated_at")
            );
            products.add(p);
        }
    }
    return products;
}
    public List<ProductImage> getImagesByProductId(int productId) throws SQLException {
    List<ProductImage> images = new ArrayList<>();
    String sql = "SELECT * FROM product_images WHERE product_id = ?";
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, productId);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            ProductImage img = new ProductImage(
                rs.getInt("image_id"),
                rs.getInt("product_id"),
                rs.getString("image_url"),
                rs.getString("alt_text"),
                rs.getInt("sort_order"),
                rs.getBoolean("is_primary")
            );
            images.add(img);
        }
    }
    return images;
}
    public List<ProductVariant> getVariantsByProductId(int productId) throws SQLException {
    List<ProductVariant> variants = new ArrayList<>();
    String sql = "SELECT * FROM product_variants WHERE product_id = ?";
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, productId);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            ProductVariant variant = new ProductVariant(
                rs.getInt("variant_id"),
                rs.getInt("product_id"),
                rs.getString("variant_name"),
                rs.getString("variant_value"),
                rs.getBigDecimal("price_adjustment"),
                rs.getInt("stock_quantity"),
                rs.getString("sku"),
                rs.getBoolean("is_active")
            );
            variants.add(variant);
        }
    }
    return variants;
}
    
    public void updateImageGallery(int productId, String imageGallery) throws SQLException {
    String sql = "UPDATE products SET image_gallery = ? WHERE product_id = ?";
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, imageGallery);
        stmt.setInt(2, productId);
        stmt.executeUpdate();
    }
}

    public boolean addFullProduct(Product product, List<ProductImage> images, List<ProductVariant> variants) throws SQLException {
    try {
        conn.setAutoCommit(false); // bắt đầu transaction

        // 1. Thêm product và lấy id
        int productId = addProduct(product);

        // 2. Gộp image_gallery từ danh sách image (dùng dấu phẩy)
        List<String> galleryUrls = new ArrayList<>();
        for (ProductImage image : images) {
            image.setProductId(productId);
            addProductImage(image);
            galleryUrls.add(image.getImageUrl());
        }

        // Gán chuỗi image_gallery vào product và cập nhật
        String imageGalleryString = String.join(",", galleryUrls);
        product.setImageGallery(imageGalleryString);
        updateImageGallery(productId, imageGalleryString); // thêm hàm này

        // 3. Thêm variants
        for (ProductVariant variant : variants) {
            variant.setProductId(productId);
            addProductVariant(variant);
        }

        conn.commit(); // thành công
        return true;
    } catch (SQLException e) {
        conn.rollback(); // lỗi thì rollback
        e.printStackTrace();
        return false;
    } finally {
        conn.setAutoCommit(true);
    }
}

}
