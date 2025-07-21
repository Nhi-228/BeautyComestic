package model;
import java.util.List;

public class Product {
    private int id;
    private String name;
    private String sku;
    private double price;
    private double discountPrice;
    private String description;
    private String usage;
    private String suggestion;

    private List<ProductImage> imageGallery;     // Danh sách ảnh của sản phẩm
    private List<ProductVariant> variants;       // Danh sách biến thể của sản phẩm

 
    // Getters & Setters

    public Product() {
    }

    public Product(String name, String sku, String status, double price, double discountPrice, String description, String usage, String suggestion) {
        this.name = name;
        this.sku = sku;
        this.price = price;
        this.discountPrice = discountPrice;
        this.description = description;
        this.usage = usage;
        this.suggestion = suggestion;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }
    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(double discountPrice) {
        this.discountPrice = discountPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getUsage() {
        return usage;
    }

    public void setUsage(String usage) {
        this.usage = usage;
    }

    public String getSuggestion() {
        return suggestion;
    }

    public void setSuggestion(String suggestion) {
        this.suggestion = suggestion;
    }

    public List<ProductImage> getImageGallery() {
        return imageGallery;
    }

    public void setImageGallery(List<ProductImage> imageGallery) {
        this.imageGallery = imageGallery;
    }

    public List<ProductVariant> getVariants() {
        return variants;
    }

    public void setVariants(List<ProductVariant> variants) {
        this.variants = variants;
    }
    
}