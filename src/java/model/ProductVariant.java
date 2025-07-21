package model;
import java.math.BigDecimal;


public class ProductVariant {
    private int variantId;
    private int productId;
    private String variantName;
    private String variantValue;
    private BigDecimal priceAdjustment;
    private int stockQuantity;
    private String sku;
    private boolean active;

    public ProductVariant() {
    }

    
    public ProductVariant(int variantId, int productId, String variantName, String variantValue,
                          BigDecimal priceAdjustment, int stockQuantity, String sku, boolean isActive) {
        this.variantId = variantId;
        this.productId = productId;
        this.variantName = variantName;
        this.variantValue = variantValue;
        this.priceAdjustment = priceAdjustment;
        this.stockQuantity = stockQuantity;
        this.sku = sku;
        this.active = isActive;
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

    public String getVariantName() {
        return variantName;
    }

    public void setVariantName(String variantName) {
        this.variantName = variantName;
    }

    public String getVariantValue() {
        return variantValue;
    }

    public void setVariantValue(String variantValue) {
        this.variantValue = variantValue;
    }

    public BigDecimal getPriceAdjustment() {
        return priceAdjustment;
    }

    public void setPriceAdjustment(BigDecimal priceAdjustment) {
        this.priceAdjustment = priceAdjustment;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}