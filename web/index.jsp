<%-- 
    Document   : index
    Created on : Jul 15, 2025, 8:38:32 PM
    Author     : nathv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Beauty Daily</title>
        <link rel="stylesheet" href="css/style.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
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
                            <li><i class="fa-regular fa-user"></i><a href="register.jsp">Đăng ký</a></li>
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

        <section class="banner-slider">
            <div class="slides" id="slideWrapper">
                <img src="image/sale.png"   alt="Banner 1" />
                <img src="image/nen1.png"  alt="Banner 2" />
                <img src="image/nen2.png"  alt="Banner 3" />
            </div>
            <button class="prev" onclick="changeSlide(-1)">❮</button>
            <button class="next" onclick="changeSlide(1)">❯</button>
        </section>

        <section class="voucher-search">
            <div class="search-bar">
                <input type="text" placeholder="Search voucher keywords" />
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

