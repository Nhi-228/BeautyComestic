<%-- 
    Document   : cart
    Created on : Jul 15, 2025, 8:21:07 PM
    Author     : nathv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <link rel="stylesheet" href="style.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                        <a href="personalcare.jsp">Personal Care</a>
                    </li>
                </ul>
            </nav>

            <div class="alert-bar">Collect more hot vouchers at Voucher Zone</div>
        </header>

        
        <!-- CART -->
        <section class="cart">
            <div class="container">
                <div class="cart-top-wrap">
                    <div class="cart-top">
                        <div class="cart-top-cart cart-top-item">
                            <i class="fa-solid fa-cart-shopping " style="color: #f22b07;"></i>
                        </div>
                        <div class="cart-top-map cart-top-item">
                            <i class="fa-solid fa-location-dot " style="color: #ee1742;"></i>
                        </div>
                        <div class="cart-top-monney cart-top-item">
                            <i class="fa-solid fa-money-check-dollar " style="color: #1e3c71;"></i>
                        </div>
                    </div>
                </div>

            </div>
            <div class="container">
                <div class="cart-content row">
                    <div class="cart-content-left">
                        <table>
                            <tr>
                                <th> Product</th>
                                <th> Name</th>
                                <th>Species</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Delete</th>
                            </tr>
                            <tr>
                                <td> <img src="image/cushion.jpg" alt=""></td>
                                <td> 3CE BARE COVER CUSHION</td>
                                <td> <img src="image/cushion1.1.jpg" alt=""></td>
                                <td> <input type="number" value="1" min="1"></td>
                                <td> <p>450000<sup>đ</sup></p></td>
                                <td> <span>x</span></td>
                            </tr>
                        </table>
                    </div>
                    <div class="cart-content-right">
                        <table>
                            <tr>
                                <th colspan="2">Total product</th>
                            </tr>
                            <tr>
                                <td>Quantity</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td>Total</td>
                                <td><p>450000<sup>đ</sup></p></td>
                            </tr>
                            <tr>
                                <td>Provisional</td>
                                <td><p style=" color: black; font-weight: bold;">450000<sup>đ</sup></p></td>
                            </tr>

                        </table>
                        <div class="cart-content-right-text">
                            <p>Miễn phí với đơn hàng từ 500000đ trở lên </p>
                            <p style=" color: red; font-weight: bold;">Mua thêm <span style="font-size:18px; ">50000 đ</span>để được nhận thêm ưu đãi  </p>
                        </div>
                        <div class="cart-content-right-button">
                            <button>Tiếp tục mua sắm </button>
                            <button>Thanh toán </button>
                        </div>
                        <div class="cart-content-right-insign">
                            <p> Tài khoản Daily Beauty </p>
                            <p>Hãy <a href=""> Dang nhap </a> tai khoan tich diem thanh vien</p>
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

