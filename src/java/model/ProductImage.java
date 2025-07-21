package model;



public class ProductImage {
    private int imageId;
    private int productId;
    private String imageUrl;
    private String altText;
    private int sortOrder;
    private boolean Primary;

    public ProductImage(int imageId, int productId, String imageUrl, String altText, int sortOrder, boolean isPrimary) {
        this.imageId = imageId;
        this.productId = productId;
        this.imageUrl = imageUrl;
        this.altText = altText;
        this.sortOrder = sortOrder;
        this.Primary = isPrimary;
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

    public boolean isPrimary() {
        return Primary;
    }

    public void setPrimary(boolean Primary) {
        this.Primary = Primary;
    }
}