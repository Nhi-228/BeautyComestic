/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;

/**
 *
 * @author nathv
 */
public class ProductVariant {
    private int variantId;
    private int productId;          // FK đến Product
    private String name;            // Ví dụ: “Màu đỏ - Size M”
    private String sku;
    private BigDecimal price;
    private BigDecimal discountPrice;
    private int stockQuantity;

    public ProductVariant() {
    }

    public ProductVariant(int variantId, int productId, String name, String sku, BigDecimal price, BigDecimal discountPrice, int stockQuantity) {
        this.variantId = variantId;
        this.productId = productId;
        this.name = name;
        this.sku = sku;
        this.price = price;
        this.discountPrice = discountPrice;
        this.stockQuantity = stockQuantity;
    }

    public int getVariantId() {
        return variantId;
    }

    public void setVariantId(int variantId) {
        this.variantId = variantId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
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

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(BigDecimal discountPrice) {
        this.discountPrice = discountPrice;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    
}
