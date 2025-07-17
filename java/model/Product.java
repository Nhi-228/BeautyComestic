/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admib
 */
public class Product {
    private final String id;
    private final String name;
    private final int price;
    private final String image;

    public Product(String id, String name, int price, String image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
    }
    // Getter và Setter
    public String getId() { return id; }
    public String getName() { return name; }
    public int getPrice() { return price; }
    public String getImage() { return image; }
}