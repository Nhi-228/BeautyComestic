package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Connect;
import model.Product;
import model.ProductImage;
import model.ProductVariant;

public class ProductDao {

    private Connection conn;

    public ProductDao() throws Exception {
        conn = Connect.getConnection();
        if (conn == null) {
            throw new SQLException("Không thể kết nối tới cơ sở dữ liệu. Hãy kiểm tra lại kết nối!");
        }
    }

    public void addProduct(Product product) throws SQLException {
        try {
            conn.setAutoCommit(false);
            int productId = insertProduct(product);
            insertProductImages(productId, product.getImageGallery());
            insertProductVariants(productId, product.getVariants());
            conn.commit();
        } catch (SQLException e) {
            conn.rollback();
            throw e;
        } finally {
            conn.setAutoCommit(true);
        }
    }

    private int insertProduct(Product product) throws SQLException {
        String sql = "INSERT INTO products (product_name, sku, price, discount_price, description, usage, suggestion) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, product.getName());
            ps.setString(2, product.getSku());
            ps.setDouble(3, product.getPrice());
            ps.setDouble(4, product.getDiscountPrice());
            ps.setString(5, product.getDescription());
            ps.setString(6, product.getUsage());
            ps.setString(7, product.getSuggestion());

            if (ps.executeUpdate() == 0) {
                throw new SQLException("Thêm sản phẩm thất bại.");
            }

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
                throw new SQLException("Không lấy được ID sản phẩm.");
            }
        }
    }

    private void insertProductImages(int productId, List<ProductImage> images) throws SQLException {
        String sql = "INSERT INTO product_images (product_id, image_url, sort_order, is_primary) VALUES (?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (ProductImage img : images) {
                ps.setInt(1, productId);
                ps.setString(2, img.getImageUrl());
                ps.setInt(3, img.getSortOrder());
                ps.setBoolean(4, img.isIsPrimary());
                ps.addBatch();
            }
            ps.executeBatch();
        }
    }

    private void insertProductVariants(int productId, List<ProductVariant> variants) throws SQLException {
        if (variants == null || variants.isEmpty()) {
            return;
        }
        String sql = "INSERT INTO product_variants (product_id, name, sku, price, stock_quantity) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            for (ProductVariant v : variants) {
                ps.setInt(1, productId);
                ps.setString(2, v.getName());
                ps.setString(3, v.getSku());
                ps.setBigDecimal(4, v.getPrice());
                ps.setInt(5, v.getStockQuantity());
                ps.addBatch();
            }
            ps.executeBatch();
        }
    }

    public Product getFullProductById(int productId) throws SQLException {
        Product product = null;

        // 1. Lấy thông tin chính của sản phẩm
        String productSql = "SELECT * FROM products WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(productSql)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product = new Product();
                    product.setId(rs.getInt("product_id"));
                    product.setName(rs.getString("product_name"));
                    product.setSku(rs.getString("sku"));
                    product.setPrice(rs.getDouble("price"));
                    product.setDiscountPrice(rs.getDouble("discount_price"));
                    product.setDescription(rs.getString("description"));
                    product.setUsage(rs.getString("usage"));
                    product.setSuggestion(rs.getString("suggestion"));
                }
            }
        }

        if (product == null) {
            return null;
        }

        // 2. Lấy danh sách hình ảnh
        List<ProductImage> images = new ArrayList<>();
        String imageSql = "SELECT * FROM product_images WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(imageSql)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductImage img = new ProductImage();
                    img.setImageId(rs.getInt("image_id"));
                    img.setProductId(productId);
                    img.setImageUrl(rs.getString("image_url"));
                    img.setSortOrder(rs.getInt("sort_order"));
                    img.setIsPrimary(rs.getBoolean("is_primary"));
                    images.add(img);
                }
            }
        }
        product.setImageGallery(images);

        // 3. Lấy danh sách biến thể
        List<ProductVariant> variants = new ArrayList<>();
        String variantSql = "SELECT * FROM product_variants WHERE product_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(variantSql)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductVariant variant = new ProductVariant();
                    variant.setVariantId(rs.getInt("variant_id"));
                    variant.setProductId(productId);
                    variant.setName(rs.getString("name"));
                    variant.setSku(rs.getString("sku"));
                    variant.setPrice(rs.getBigDecimal("price"));
                    variant.setStockQuantity(rs.getInt("stock_quantity"));
                    variants.add(variant);
                }
            }
        }
        product.setVariants(variants);

        return product;
    }

}
