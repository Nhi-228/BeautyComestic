package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/cosmetics_store", "root", "");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Không tìm thấy JDBC Driver", e);
        }
    }
}
