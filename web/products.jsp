<%-- 
    Document   : products
    Created on : Jul 15, 2025, 8:17:56 PM
    Author     : nathv
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Product" %>
<%@page import="model.ProductImage" %>
<%@page import="model.ProductVariant" %>
<%@page import="java.util.List" %>
<%@page import="dao.ProductDao" %>
<%@page import="jakarta.servlet.*" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="model.Product" %>
<%
    Product product = (Product) request.getAttribute("product");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Beauty Daily - Product Page</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
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

<% if (product != null) { %>
        <!-- PRODUCT DETAIL -->
        <section class="products">
            <div class="container">
                <div class="products-top row">
                    <p>Home</p><span>&#8594;</span><p>Makeup</p><span>&#8594;</span><p>Cushion</p>
                </div>
                <div class="products-content row">
                    <div class="products-content-left row">
                        <div class="products-content-left-big-img">
                            <img src="image/cushion.jpg" alt="">
                        </div>
                        <div class="products-content-left-small-img">
                            <img src="image/cushion2.jpg" alt="">
                            <img src="image/cushion3.jpg" alt="">
                            <img src="image/cushion4.jpg" alt="">
                        </div>
                    </div>
                    <div class="products-content-right">
                        <div class="products-name">
                            <h1>3CE BARE COVER CUSHION</h1>
                            <p class="status">Tình trạng: <span class="stock"><%= product.getStatus() %> </span> | Mã SKU: <%= product.getSku() %></p>
                        </div>
                        <div class="products-price">
                            <span class="old-price"><%= product.getPrice() %> ₫</span>
                            <span class="discount">-15%</span>
                            <p class="save">Tiết kiệm 67,500₫</p>
                        </div>
                        <div class="products-options">
                            <p>Species:</p>
                            <div class="options">
                                <button class="option">P01 - Bright Pink: da sáng hồng</button>
                                <button class="option">N01 - Neutral Beige: da tự nhiên</button>
                                <button class="option">N02 - Neutral Medium: da trung bình</button>
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
                                    <div class="products-content-right-button-content-item" data-tab="product">Product description</div>
                                    <div class="products-content-right-button-content-item" data-tab="use">Use</div>
                                    <div class="products-content-right-button-content-item" data-tab="suggest">Suggest</div>
                                    <div class="products-content-right-button-content-item" data-tab="evaluate">Evaluate</div>

                                </div>
                                <div class="products-content-right-button-content">
                                    <div class="tab-content" data-tab="product">
                                        Phấn Nước 3CE Bare Cover Cushion SPF40 PA++ là dòng sản phẩm vừa ra mắt của thương hiệu Hàn đình đám 3CE.<br>
                                        Sản phẩm nổi bật với kết cấu kem lỏng mềm mịn, dễ tán đều trên da, không vón cục, không gây bết dính trên da. Khi apply cushion lên da, kem nhẹ nhàng ôm sát làn da, để lại lớp phủ mỏng nhẹ, tạo nên lớp nền sáng bóng tự nhiên như chính làn da của bạn.<br>
                                        Phấn nước 3CE Bare Cover Cushion đi kèm với bông phấn hình kim cương, cầm vừa tay, thuận tiện khi trang điểm. Bông phấn có thể chạm đến mọi vùng da trên khuôn mặt, kể cả hai bên mũi và vùng da quanh mắt.<br>

                                        Thêm vào đó, thành phần dưỡng da có trong sản phẩm sẽ tạo lớp màng dưỡng ẩm, giúp cho da có được lớp nền mướt mịn, không quá bóng.<br>

                                        Hiện tại, Cocolux đang có sẵn 2 phân loại của sản phẩm. Cụ thể:<br>

                                        P01 - Bright Pink: màu hồng tươi sáng, phù hợp với những người có tông da trắng.<br>
                                        N01 - Neutral Beige: màu ngà trung tính, phù hợp với những ai có tông da tự nhiên<br>
                                        Thành phần
                                        - Titanium Dioxide (CI 77891): là thành phần chống nắng, có khả năng bảo vệ da khỏi tia UVA và UVB.<br>

                                        - Dimethicone: Bổ sung độ ẩm, duy trì độ ẩm cần thiết trên da, giữ cho da mịn màng, mềm mại. <br>

                                        - Butylene Glycol Dicaprylate/Dicaprate: cải thiện cảm giác lướt nhẹ khi thoa phấn và giữ cho da được cung cấp độ ẩm, giúp tránh tình trạng da khô và căng trước ánh nắng mặt trời.
                                    </div>
                                    <div class="tab-content" data-tab="use">
                                        Tạo lớp nền mỏng nhẹ: Cushion tạo lớp nền mỏng nhẹ, tạo cảm giác nhẹ nhàng, thoải mái trên da. <br>
                                        Dưỡng sáng da: Sản phẩm tạo lớp nền sáng bóng tự nhiên như chính làn da của bạn. <br>
                                        Giữ ẩm: Sản phẩm sử dụng công thức giữ ẩm từ bên trong, tạo lớp nền ẩm mượt, hạn chế xảy ra tình trạng cakey, mốc nền.  <br>
                                        Che phủ khuyết điểm: Sản phẩm có khả năng che phủ nhiều khuyết điểm trên da, đặc biệt là lỗ chân lông, mang lại vẻ rạng rỡ tự nhiên. <br>
                                        Hỗ trợ chống nắng: Chỉ số SPF40 PA++ cùng thành phần Titanium Dioxide giúp chống nắng, bảo vệ da khỏi tia UVA và UVB.v <br><br>
                                        Cách dùng :
                                        Dùng bông phấn lấy một lượng vừa đủ cushion.<br>
                                        Tán cushion đều trên da cho đến khi có lớp nền đều màu. <br>
                                        * Lưu ý:<br>

                                        - Tránh để sản phẩm tiếp xúc trực tiếp với mắt vì sẽ có thể khiến mắt bị tổn thương.<br>

                                        - Khi xảy ra tình trạng mẩn đỏ, dị ứng, kích ứng, ngứa,... bạn nên tạm ngưng sử dụng sản phẩm và tham khảo ý kiến của bác sĩ, chuyên gia da liễu nếu cần thiết. <br>

                                        - Sử dụng ngay sau khi mở nắp và đóng nắp ngay sau khi sử dụng để đảm bảo chất lượng sản phẩm.<br>

                                        - Bảo quản sản phẩm xa tầm tay trẻ em. <br>

                                        - Tránh để sản phẩm tiếp xúc trực tiếp với ánh nắng mặt trời. <br>

                                        - Hạn sử dụng của sản phẩm: 36 tháng kể từ ngày sản xuất, 12 tháng sau khi mở nắp

                                    </div>
                                    <div class="tab-content" data-tab="suggest">

                                    </div>
                                    <div class="tab-content" data-tab="evaluate"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
    <% } else { %>
    <p>Không tìm thấy sản phẩm.</p>
    <% } %>
        <section class="product-related container">
            <div class="product-related-tittle">
                <p> Sản phẩm liên quan </p>

            </div>
            <div class="products-content row">
                <div class="product-related-item">
                    <img src="image/cushion1.1.jpg" alt="">
                    <h1>3CE BARE COVER CUSHION</h1>
                    <p>450000<sup>đ</sup></p>
                </div>
                <div class="product-related-item">
                    <img src="image/cushion1.2.jpg" alt="">
                    <h1>3CE BARE COVER CUSHION</h1>
                    <p>450000<sup>đ</sup></p>
                </div>
                <div class="product-related-item">
                    <img src="image/cushion1.3.jpg" alt="">
                    <h1>3CE BARE COVER CUSHION</h1>
                    <p>450000<sup>đ</sup></p>
                </div>
                <div class="product-related-item">
                    <img src="image/cushion1.4.jpg" alt="">
                    <h1>3CE BARE COVER CUSHION</h1>
                    <p>450000<sup>đ</sup></p>
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

