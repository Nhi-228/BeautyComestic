/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author BINH NHI
 */
public class connect {
    public static final String URL="jdbc:mysql://localhost:3306/comestics_store";
    public static final String USER="root";
    public static final String PASSWORD="";
     public static Connection kn(){
         try {
             Class.forName("com.mysql.cj.jdbc.Driver");
             return DriverManager.getConnection(URL,USER,PASSWORD);
         } catch (Exception e) {
             e.printStackTrace();
             return null;
         }
    }
}
