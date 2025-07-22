<%-- 
    Document   : products
    Created on : Jul 15, 2025, 8:17:56 PM
    Author     : nathv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Product" %>
<%@ page import="dao.ProductDao" %>
<%@ page import="dao.ProductImageDao" %>
<%@ page import="model.ProductImage" %>
<%
    String idStr = request.getParameter("id");
    Product product = null;
    if (idStr != null) {
        try {
            int id = Integer.parseInt(idStr);
            product = new ProductDao().getProductById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    ProductImageDao imgDao = null;
    ProductImage img = null;
    try {
        imgDao = new dao.ProductImageDao();
        if (product != null) {
            img = imgDao.getPrimaryImageByProductId(product.getProductId());
        }
    } catch(Exception ex) { ex.printStackTrace(); }
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
                    <li><a href="home.jsp">Home</a></li>
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
                        <a href="personalcare.jsp">Personal Care</a>
                    </li>
                </ul>
            </nav>

            <div class="alert-bar">Collect more hot vouchers at Voucher Zone</div>
        </header>


        <!-- PRODUCT DETAIL -->
        <section class="products">
            <div class="container">
                <div class="products-top row">
                    <p>Home</p><span>&#8594;</span><p>Makeup</p><span>&#8594;</span><p>Cushion</p>
                </div>
                <% if (product != null) { %>
                <div class="products-content row">
                    <div class="products-content-left row">
                        <div class="products-content-left-big-img">
                            <% if (img != null) { %>
                                <img src="<%=img.getImageUrl()%>" alt="">
                            <% } else { %>
                                <img src="image/no-image.png" alt="">
                            <% } %>
                        </div>
                    </div>
                    <div class="products-content-right">
                        <div class="products-name">
                            <h1><%=product.getProductName()%></h1>
                            <p class="status">Mã SKU: <%=product.getSku()%></p>
                        </div>
                        <div class="products-price">
                            <% if (product.getDiscountPrice() != null && product.getDiscountPrice().compareTo(java.math.BigDecimal.ZERO) > 0 && product.getDiscountPrice().compareTo(product.getPrice()) < 0) { %>
                                <span class="old-price"><%=product.getPrice()%>₫</span>
                                <span class="sale-price"><%=product.getDiscountPrice()%>₫</span>
                            <% } else { %>
                                <span class="product-price"><%=product.getPrice()%>₫</span>
                            <% } %>
                        </div>
                        <div class="products-options">
                            <p>Species:</p>
                            <div class="options">
                                <!-- Nếu có dữ liệu species động, lặp qua và hiển thị ở đây. Nếu chưa có, có thể để trống hoặc thêm sau -->
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
                                        <%=product.getDescription()%>
                                    </div>
                                    <div class="tab-content" data-tab="use">
                                        <!-- Nếu có trường hướng dẫn sử dụng động, hiển thị ở đây. Nếu chưa có, có thể để trống hoặc thêm sau -->
                                    </div>
                                    <div class="tab-content" data-tab="suggest">
                                        <!-- Nếu có trường gợi ý động, hiển thị ở đây. Nếu chưa có, có thể để trống hoặc thêm sau -->
                                    </div>
                                    <div class="tab-content" data-tab="evaluate">
                                        <!-- Nếu có trường đánh giá động, hiển thị ở đây. Nếu chưa có, có thể để trống hoặc thêm sau -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% } else { %>
                    <p>Không tìm thấy sản phẩm!</p>
                <% } %>
        </section>
        <section class="product-related container">
            <div class="product-related-tittle">
                <p> Sản phẩm liên quan </p>
            </div>
            <div class="products-content row">
                <%
                    List<Product> products = (List<Product>) request.getAttribute("products");
                    if (products != null) {
                        for (Product p : products) {
                %>
                <div class="product-related-item">
                    <img src="<%= p.getImageUrl()%>" alt="">
                    <h1><%= p.getProductName()%></h1>
                    <p><%= p.getPrice()%><sup>đ</sup></p>
                </div>
                <%      }
                } else { %>
                <div class="product-related-item">
                    <img src="image/cushion.jpg" alt="">
                    <h1>3CE BARE COVER CUSHION</h1>
                    <p>580000<sup>đ</sup></p>
                </div>
                <div class="product-related-item">
                    <img src="image/mascara.jpg" alt="">
                    <h1>Mascara</h1>
                    <p>190000<sup>đ</sup></p>
                </div>
                <div class="product-related-item">
                    <img src="image/phanmat.png" alt="">
                    <h1>Palette Eyes</h1>
                    <p>2000000<sup>đ</sup></p>
                </div>
                <div class="product-related-item">
                    <img src="image/kematnuoc.jpg" alt="">
                    <h1>Bút kẻ mắt nước</h1>
                    <p>175000<sup>đ</sup></p>
                </div>
                <% }%>
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
        <script >
            const addToCartBtn = document.querySelector('.add-to-cart');

// Khi click, thêm sản phẩm vào localStorage
            addToCartBtn.addEventListener('click', function () {
                const product = {
                    id: "SP670942631",
                    name: "3CE BARE COVER CUSHION",
                    price: 450000,
                    quantity: parseInt(document.querySelector('.quantity-box input').value),
                    image: "image/cushion.jpg"
                };

                // Lấy giỏ hàng từ localStorage (nếu chưa có thì tạo mới)
                let cart = JSON.parse(localStorage.getItem("cart")) || [];

                // Kiểm tra nếu sản phẩm đã có trong giỏ → tăng số lượng
                const existing = cart.find(p => p.id === product.id);
                if (existing) {
                    existing.quantity += product.quantity;
                } else {
                    cart.push(product);
                }

                // Lưu lại vào localStorage
                localStorage.setItem("cart", JSON.stringify(cart));

                // Hiển thị thông báo hoặc chuyển trang nếu cần
                alert("Đã thêm vào giỏ hàng!");
                function updateCartCount() {
                    const cart = JSON.parse(localStorage.getItem("cart")) || [];
                    const totalQuantity = cart.reduce((sum, item) => sum + item.quantity, 0);
                    document.getElementById("cart-count").textContent = totalQuantity;
                }

// Gọi hàm khi trang load
                window.addEventListener("load", updateCartCount);
            });
            document.getElementById("buyNowBtn").addEventListener("click", function () {
                // (Tuỳ chọn) bạn có thể lưu thông tin sản phẩm cần thanh toán riêng nếu cần
                const product = {
                    id: "SP670942631",
                    name: "3CE BARE COVER CUSHION",
                    price: 450000,
                    quantity: parseInt(document.querySelector('.quantity-box input').value),
                    image: "image/cushion.jpg"
                };

                // Lưu sản phẩm tạm thời vào localStorage để dùng ở trang payment
                localStorage.setItem("paymentProduct", JSON.stringify(product));

                // Chuyển sang trang thanh toán
                window.location.href = "payment.html";
            });

        </script>
    </body>
</html>

