<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        .form-group { margin-bottom: 10px; }
        label { display: block; font-weight: bold; }
        input, textarea { width: 100%; padding: 8px; }
    </style>

    </head>
    <body>
           <h1>Thêm sản phẩm mới</h1>

    <form action="addproduct" method="post">
        <!-- Thông tin cơ bản -->
        <div class="form-group">
            <label>Tên sản phẩm:</label>
            <input type="text" name="productName">
        </div>

        <div class="form-group">
            <label>Mô tả:</label>
            <textarea name="description" rows="4"></textarea>
        </div>
        <div class="form-group">
    <label>Cách sử dụng:</label>
    <textarea name="usage" rows="4"></textarea>
</div>


        <div class="form-group">
            <label>Giá gốc:</label>
            <input type="text" name="price">
        </div>

        <div class="form-group">
            <label>Giá khuyến mãi:</label>
            <input type="text" name="discountPrice">
        </div>

        <div class="form-group">
            <label>Số lượng kho:</label>
            <input type="number" name="stockQuantity">
        </div>

        <div class="form-group">
            <label>SKU:</label>
            <input type="text" name="sku">
        </div>

        <div class="form-group">
            <label>Thành phần:</label>
            <textarea name="ingredients" rows="2"></textarea>
        </div>

        <div class="form-group">
            <label>Ảnh đại diện (imageUrl):</label>
            <input type="file" name="imageUrl">
        </div>

        <div class="form-group">
            <label>Danh mục:</label>
            <input type="number" name="categoryId">
        </div>

        <div class="form-group">
            <label>Thương hiệu:</label>
            <input type="number" name="brandId">
        </div>

        

        <div class="form-group">
            <label>Điểm đánh giá trung bình:</label>
            <input type="text" name="ratingAverage">
        </div>

        <div class="form-group">
            <label>Số lượng đánh giá:</label>
            <input type="number" name="reviewCount">
        </div>

        <!-- Ảnh phụ -->
        <div class="form-group">
            <label>Ảnh phụ (nhiều imageUrls):</label>
            <input type="file" name="imageUrls" multiple >
            
        </div>

        <!-- Biến thể -->
        <div class="form-group">
            <label>Biến thể:</label>
            <input type="text" name="variantNames" value="Màu sắc">
            <input type="text" name="variantValues" value="Hồng">
            <input type="text" name="priceAdjustments" value="0">
            <input type="text" name="variantSKUs" value="SKU001">
        </div>
        <div class="form-group">
            <input type="text" name="variantNames" value="Kích cỡ">
            <input type="text" name="variantValues" value="L">
            <input type="text" name="priceAdjustments" value="20000">
            <input type="text" name="variantSKUs" value="SKU002">
        </div>

        <button type="submit">Thêm sản phẩm</button>
    </form>

    </body>
</html>
