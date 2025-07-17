/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Admib
 */

import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    public static List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        list.add(new Product("SP670942631", "3CE BARE COVER CUSHION", 450000, "image/cushion.jpg"));
        list.add(new Product("SP670942632", "3CE BARE COVER CUSHION 1.1", 450000, "image/cushion1.1.jpg"));
        list.add(new Product("SP670942633", "3CE BARE COVER CUSHION 1.2", 450000, "image/cushion1.2.jpg"));
        // Thêm các sản phẩm khác nếu muốn
        return list;
    }
}