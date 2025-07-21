<%-- 
    Document   : products
    Created on : Jul 15, 2025, 8:17:56 PM
    Author     : nathv
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Product, model.ProductImage, model.ProductVariant" %>
<%@ page import="dao.ProductDao" %>

<%@page import="java.util.*" %>
<%
   
    int productId = Integer.parseInt(request.getParameter("id"));
    ProductDao dao = new ProductDao();

    Product product = dao.getProductById(productId);
    List<ProductImage> images = dao.getImagesByProductId(productId);
    List<ProductVariant> variants = dao.getVariantsByProductId(productId);


%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Beauty Daily - Product Page</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
     <style>
        .container { max-width: 1000px; margin: auto; font-family: sans-serif; }
        .main-img { width: 400px; }
        .sub-img { width: 100px; margin: 5px; }
        .variant-block { background: #f5f5f5; padding: 10px; margin-top: 15px; }
        .price { font-weight: bold; font-size: 18px; color: #d34c00; }
        .old-price { text-decoration: line-through; color: gray; margin-right: 10px; }
    </style>

    </head>
    <body>
        <!-- HEADER -->
        <header>
            <div class="top-bar">
                <span>Quick Access</span>
            </div>

            <div class="main-header">
                <div class="search-box">
                    <input type="text" placeholder="Gift with purchase" />
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>
                <div class="logo">Beauty Daily</div>
                <div class="actions">
                    <div class="login-dropdown">
                        <button class="login-btn" id="loginBtn">LOGIN</button>
                        <ul class="dropdown-list" id="loginDropdown">
                            <li><i class="fa-regular fa-user"></i><a href="login.html">Đăng nhập</a></li>
                            <li><i class="fa-regular fa-user"></i><a href="register.html">Đăng ký</a></li>
                            <li><i class="fa-regular fa-heart"></i><a href="#">Wish List</a></li>
                            <li><i class="fa-solid fa-box"></i><a href="#">My Order</a></li>
                            <li><i class="fa-solid fa-star"></i><a href="#">VIP Privileges</a></li>
                        </ul>
                    </div>
                    <a href="mybag.html" id="myBagBtn" class="btn-bag">
                        <i class="fa-solid fa-cart-shopping" style="color: #f22b07;"></i> MY BAG (<span id="cart-count">0</span>)
                    </a>
                </div>
            </div>

            <nav>
                <ul class="nav-bar">
                    <li class="dropdown">
                        <a href="#">Summer Sale</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Sale 15%</a></li>
                            <li><a href="#">Sale 50%</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#">Makeup</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Face</a></li>
                            <li><a href="#">Lips</a></li>
                            <li><a href="#">Eyes</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#">Skincare</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Acne treatment</a></li>
                            <li><a href="#">Mask</a></li>
                            <li><a href="#">Cleaning</a></li>
                            <li><a href="#">Toner</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#">Hair Care</a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Shampoo</a></li>
                            <li><a href="#">Conditioner</a></li>
                            <li><a href="#">Hair mask</a></li>
                            <li><a href="#">Hair oil</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="personalcare.html">Personal Care</a>
                    </li>
                </ul>
            </nav>

            <div class="alert-bar">Collect more hot vouchers at Voucher Zone</div>
        </header>

<section class="products">
    <div class="container">
        <div class="products-top row">
            <p>Home</p><span>&#8594;</span><p>Makeup</p><span>&#8594;</span><p><%= product.getProductName() %></p>
        </div>

        <div class="products-content row">
            <div class="products-content-left row">
                <div class="products-content-left-big-img">
                    <img src="<%= product.getImageUrl() %>" alt="Ảnh đại diện sản phẩm">
                </div>
                <div class="products-content-left-small-img">
                    <% for (ProductImage img : images) { %>
                        <img src="<%= img.getImageUrl() %>" alt="<%= img.getAltText() %>">
                    <% } %>
                </div>
            </div>

            <div class="products-content-right">
                <div class="products-name">
                    <h1><%= product.getProductName() %></h1>
                    <p class="status">Tình trạng: 
                        <span class="stock"><%= product.getStockQuantity() > 0 ? "Còn hàng" : "Hết hàng" %></span> | 
                        Mã SKU: <%= product.getSku() %>
                    </p>
                </div>

                <div class="products-price">
                    <span class="old-price"><%= product.getPrice() %>₫</span>
                    <span class="discount">Giá KM</span>
                    <p class="save">Tiết kiệm <%= product.getPrice() - product.getDiscountPrice() %>₫</p>
                </div>

                <div class="products-options">
                    <p>Phân loại:</p>
                    <div class="options">
                        <% for (ProductVariant v : variants) { %>
                            <button class="option"><%= v.getVariantName() %> - <%= v.getVariantValue() %></button>
                        <% } %>
                    </div>
                </div>

                <div class="products-quantity">
                    <p>Số lượng:</p>
                    <div class="quantity-box">
                        <button>-</button>
                        <input type="text" value="1" readonly>
                        <button>+</button>
                    </div>
                </div>

                <div class="buy-buttons">
                    <button class="buy-now" id="buyNowBtn">Mua ngay</button>
                    <button class="add-to-cart">
                        <i class="fa-solid fa-cart-shopping" style="color: #f22b07;"></i>Thêm vào giỏ
                    </button>
                </div>

                <div class="products-content-right-button">
                    <div class="products-content-right-button-top">&#8744;</div>
                    <div class="products-content-right-button-content-big">
                        <div class="products-content-right-button-content-title row">
                            <div class="products-content-right-button-content-item" data-tab="product">Mô tả</div>
                            <div class="products-content-right-button-content-item" data-tab="ingredients">Thành phần</div>
                            <div class="products-content-right-button-content-item" data-tab="evaluate">Đánh giá</div>
                        </div>
                        <div class="products-content-right-button-content">
                            <div class="tab-content" data-tab="product">
                                <p><%= product.getDescription() %></p>
                            </div>
                            <div class="tab-content" data-tab="ingredients">
                                <p><%= product.getIngredients() %></p>
                            </div>
                            <div class="tab-content" data-tab="evaluate">
                                <p>Đang cập nhật đánh giá...</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>


        <!-- FOOTER -->
        <footer>
            <div class="footer-top">
                <div class="footer-section">
                    <h4>ABOUT US</h4>
                    <a href="#">Who We Are</a>
                    <a href="#">Sustainability</a>
                </div>
                <div class="footer-section">
                    <h4>BEAUTY DAILY MEMBER</h4>
                    <a href="#">Beauty Daily Club</a>
                </div>
                <div class="footer-section">
                    <h4>SHOPPING AT BEAUTY DAILY</h4>
                    <a href="#">Find a Store</a>
                    <a href="#">Chat & Shop</a>
                    <a href="#">Contact Us</a>
                </div>
                <div class="footer-section">
                    <h4>FIND US ON</h4>
                    <i class="fa-brands fa-facebook" style="color: #1374be;"></i>
                    <i class="fa-brands fa-youtube" style="color: #e11305;"></i>
                    <i class="fa-brands fa-instagram" style="color: #ae3287;"></i>
                    <i class="fa-brands fa-tiktok fa-beat"></i>
                    <i class="fa-solid fa-house" style="color: #74C0FC;"></i>
                </div>
                <div class="footer-app">
                    <h3>Get Our App</h3>
                    <p>to enjoy your best online shopping experience.</p>
                    <img src="https://upload.wikimedia.org/wikipedia/commons/7/78/QR_code_example.svg" alt="QR Code" width="80">
                    <div>
                        <img src="https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg" alt="Play Store" width="120">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/9/96/Download_on_the_App_Store_Badge.svg" alt="App Store" width="120">
                    </div>
                    <img src="https://online.gov.vn/Content/EndUser/LogoCCDVSaleNoti/logoSaleNoti.png" alt="Thông báo BCT" width="150">
                </div>
            </div>
            <div class="footer-bottom">
                <img src="image/BD.png" alt="Beauty Daily Logo" width="120">
            </div>
        </footer>
        <script src="JS.js"></script>
    </body>
</html>

