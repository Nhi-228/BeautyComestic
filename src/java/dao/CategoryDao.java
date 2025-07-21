/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Category;
import model.Category;
/**
 *
 * @author BINH NHI
 */
public class CategoryDao {
     private Connection conn;

    public CategoryDao() throws Exception {
        conn = Connect.getConnection(); // Hàm kết nối CSDL từ lớp Connect bạn đã có
    }

    // Thêm danh mục mới
      public boolean insertCategory(Category category) {
        String sql = "INSERT INTO category (category_name, description, image_url, parent_category_id, is_active) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, category.getCategoryName());
            ps.setString(2, category.getDescription());
            ps.setString(3, category.getImageUrl());
            if (category.getParentCategoryId() != null) {
                ps.setInt(4, category.getParentCategoryId());
            } else {
                ps.setNull(4, Types.INTEGER);
            }
            ps.setBoolean(5, category.isActive());

            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (SQLException e) {
            System.err.println("Insert category failed: " + e.getMessage());
            return false;
        }
    }

    // Lấy danh sách tất cả danh mục
    public List<Category> getAllCategories() {
        List<Category> list = new ArrayList<>();
        String sql = "SELECT * FROM category ORDER BY category_id DESC";
        try (Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Category cat = new Category();
                cat.setCategoryId(rs.getInt("category_id"));
                cat.setCategoryName(rs.getString("category_name"));
                cat.setDescription(rs.getString("description"));
                cat.setImageUrl(rs.getString("image_url"));
                int parentId = rs.getInt("parent_category_id");
                if (!rs.wasNull()) {
                    cat.setParentCategoryId(parentId);
                }
                cat.setActive(rs.getBoolean("is_active"));
                cat.setCreatedAt(rs.getTimestamp("created_at"));
                list.add(cat);
            }
        } catch (SQLException e) {
            System.err.println("Get all categories failed: " + e.getMessage());
        }
        return list;
    }

    // Lấy danh mục theo ID
    public Category getCategoryById(int id) {
        String sql = "SELECT * FROM category WHERE category_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Category cat = new Category();
                cat.setCategoryId(rs.getInt("category_id"));
                cat.setCategoryName(rs.getString("category_name"));
                cat.setDescription(rs.getString("description"));
                cat.setImageUrl(rs.getString("image_url"));
                int parentId = rs.getInt("parent_category_id");
                if (!rs.wasNull()) {
                    cat.setParentCategoryId(parentId);
                }
                cat.setActive(rs.getBoolean("is_active"));
                cat.setCreatedAt(rs.getTimestamp("created_at"));
                return cat;
            }
        } catch (SQLException e) {
            System.err.println("Get category by ID failed: " + e.getMessage());
        }
        return null;
    }

    // Xóa danh mục theo ID
    public boolean deleteCategory(int id) {
        String sql = "DELETE FROM category WHERE category_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Delete category failed: " + e.getMessage());
            return false;
        }
    }

    // Cập nhật danh mục
    public boolean updateCategory(Category category) {
        String sql = "UPDATE category SET category_name = ?, description = ?, image_url = ?, parent_category_id = ?, is_active = ? WHERE category_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, category.getCategoryName());
            ps.setString(2, category.getDescription());
            ps.setString(3, category.getImageUrl());
            if (category.getParentCategoryId() != null) {
                ps.setInt(4, category.getParentCategoryId());
            } else {
                ps.setNull(4, java.sql.Types.INTEGER);
            }
            ps.setBoolean(5, category.isActive());
            ps.setInt(6, category.getCategoryId());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Update category failed: " + e.getMessage());
            return false;
        }
    }
}
