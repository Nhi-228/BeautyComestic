package model;

public class ProductImage {
    private int imageId;
    private int productId;
    private String imageUrl;
    private String altText;
    private int sortOrder;
    private boolean isPrimary;

    public int getImageId() { return imageId; }
    public void setImageId(int imageId) { this.imageId = imageId; }
    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public String getAltText() { return altText; }
    public void setAltText(String altText) { this.altText = altText; }
    public int getSortOrder() { return sortOrder; }
    public void setSortOrder(int sortOrder) { this.sortOrder = sortOrder; }
    public boolean isPrimary() { return isPrimary; }
    public void setPrimary(boolean isPrimary) { this.isPrimary = isPrimary; }
} 