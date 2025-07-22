<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>But Cushion - Chi tiết sản phẩm</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body>
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
                </ul>
            </div>
            <a href="cart.jsp" id="myBagBtn" class="btn-bag">
                <i class="fa-solid fa-cart-shopping" style="color: #f22b07;"></i> MY BAG (<span id="cart-count">0</span>)
            </a>
        </div>
    </div>
    <nav>
        <ul class="nav-bar">
            <li><a href="home.jsp">Home</a></li>
            <li class="dropdown"><a href="#">Makeup</a></li>
            <li class="dropdown"><a href="#">Skincare</a></li>
            <li class="dropdown"><a href="#">Hair Care</a></li>
            <li class="dropdown"><a href="personalcare.jsp">Personal Care</a></li>
        </ul>
    </nav>
    <div class="alert-bar">Collect more hot vouchers at Voucher Zone</div>
</header>
<section class="products">
    <div class="container">
        <div class="products-top row">
            <p>Home</p><span>&#8594;</span><p>Makeup</p><span>&#8594;</span><p>Cushion</p><span>&#8594;</span><p>But Cushion</p>
        </div>
        <div class="products-content row">
            <div class="products-content-left row">
                <div class="products-content-left-big-img">
                    <img src="image/butcushion.jpg" alt="But Cushion">
                </div>
                <div class="products-content-left-small-img">
                    <img src="image/cushion.jpg" alt="">
                    <img src="image/cushion2.jpg" alt="">
                </div>
            </div>
            <div class="products-content-right">
                <div class="products-name">
                    <h1>But Cushion Maybelline Instant Age Rewind</h1>
                    <p class="status">Tình trạng: <span class="stock">Còn hàng</span> | Mã SKU: BC110</p>
                </div>
                <div class="products-price">
                    <span class="old-price">150,000₫</span>
                    <span class="discount">-20%</span>
                    <p class="save">Tiết kiệm 30,000₫</p>
                </div>
                <div class="products-options">
                    <p>Màu sắc:</p>
                    <div class="options">
                        <button class="option">110 - Light</button>
                        <button class="option">120 - Medium</button>
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
                    <button class="buy-now" id="buyNowBtn">buy now</button>
                    <button class="add-to-cart"><i class="fa-solid fa-cart-shopping" style="color: #f22b07;"></i>add to cart</button>
                </div>
                <div class="products-content-right-button">
                    <div class="products-content-right-button-top">
                        &#8744;
                    </div>
                    <div class="products-content-right-button-content-big">
                        <div class="products-content-right-button-content-title row">
                            <div class="products-content-right-button-content-item" data-tab="product">Mô tả sản phẩm</div>
                            <div class="products-content-right-button-content-item" data-tab="use">Cách dùng</div>
                            <div class="products-content-right-button-content-item" data-tab="suggest">Gợi ý</div>
                            <div class="products-content-right-button-content-item" data-tab="evaluate">Đánh giá</div>
                        </div>
                        <div class="products-content-right-button-content">
                            <div class="tab-content" data-tab="product">
                                Bút Cushion Maybelline Instant Age Rewind là sản phẩm che khuyết điểm nổi bật với đầu cushion mềm mại, dễ tán đều trên da, giúp che phủ quầng thâm, vết thâm mụn và các khuyết điểm khác một cách tự nhiên.<br>
                                Thành phần dưỡng ẩm giúp vùng da mắt luôn mềm mại, không bị khô mốc.<br>
                                Thiết kế nhỏ gọn, tiện lợi mang theo bên mình.
                            </div>
                            <div class="tab-content" data-tab="use">
                                Vặn nhẹ để lấy sản phẩm ra đầu cushion.<br>
                                Chấm nhẹ lên vùng da cần che phủ, sau đó tán đều bằng đầu cushion hoặc ngón tay.<br>
                                Sử dụng sau bước kem nền hoặc trước phấn phủ.
                            </div>
                            <div class="tab-content" data-tab="suggest">
                                Kết hợp với kem nền Maybelline để có lớp nền hoàn hảo.<br>
                                Phù hợp cho mọi loại da, đặc biệt là da khô vùng mắt.
                            </div>
                            <div class="tab-content" data-tab="evaluate">
                                Sản phẩm được đánh giá cao bởi khả năng che phủ tốt, không gây khô da và dễ sử dụng hàng ngày.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</section>
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
            <a href="#">Find a Store</a><br>
            <a href="#">Chat & Shop</a><br>
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
            <img src="https://upload.wikimedia.org/wikipedia/commons/7/78/QR_code_example.svg" alt="QR Code" width="80" />
            <div>
                <img src="https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg" alt="Play Store" width="120" />
                <img src="https://upload.wikimedia.org/wikipedia/commons/9/96/Download_on_the_App_Store_Badge.svg" alt="App Store" width="120" />
            </div>
            <img src="https://online.gov.vn/Content/EndUser/LogoCCDVSaleNoti/logoSaleNoti.png" alt="Thông báo BCT" width="150" />
        </div>
    </div>
    <div class="footer-bottom">
        <img src="image/BD.png" alt="Beauty Daily Logo" width="120" />
    </div>
</footer>
<script src="JS.js"></script>
</body>
</html> 