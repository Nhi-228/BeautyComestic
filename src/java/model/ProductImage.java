package model;

public class ProductImage {
    private int imageId;
    private int productId;           // FK đến Product
    private String imageUrl;
    private String altText;
    private int sortOrder;
    private boolean isPrimary;

    public ProductImage(int imageId, int productId, String imageUrl, String altText, int sortOrder, boolean isPrimary) {
        this.imageId = imageId;
        this.productId = productId;
        this.imageUrl = imageUrl;
        this.altText = altText;
        this.sortOrder = sortOrder;
        this.isPrimary = isPrimary;
    }

    public ProductImage() {
    }

    public int getImageId() {
        return imageId;
    }

    public void setImageId(int imageId) {
        this.imageId = imageId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getAltText() {
        return altText;
    }

    public void setAltText(String altText) {
        this.altText = altText;
    }

    public int getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(int sortOrder) {
        this.sortOrder = sortOrder;
    }

    public boolean isIsPrimary() {
        return isPrimary;
    }

    public void setIsPrimary(boolean isPrimary) {
        this.isPrimary = isPrimary;
    }

    
}
