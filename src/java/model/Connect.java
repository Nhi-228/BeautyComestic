/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;


import java.sql.*;
/**
 *
 * @author nathv
 */
public class Connect {
     public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Tải driver
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/cosmetics_store", "root", "");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Không tìm thấy driver JDBC", e);
        }
    }
}
