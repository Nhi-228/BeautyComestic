<%-- 
    Document   : category
    Created on : Jul 15, 2025, 8:20:51 PM
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
        <link rel="stylesheet" href="css/style.css" />
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




        <section class="cartelogy">
            <div class="container">
                <div class="cartelogy-top row">
                    <p>Home</p><span>&#8594;</span><p>All</p>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="cartelogy-left">
                        <ul>

                            <li class="cartelogy-left-li"><a href="">Makeup</a>
                                <ul>
                                    <li><a href="cushion.jsp">Cushion</a></li>
                                    <li><a href="cream.jsp">Cream</a></li>
                                    <li><a href="mascara.jsp">Mascara</a></li>
                                    <li><a href="lipteen.jsp">Lip teen</a></li>
                                </ul>
                            </li>
                            <li class="cartelogy-left-li"><a href="">Skincare</a>
                                <ul>
                                    <li><a href="serum.jsp">Serum</a></li>
                                    <li><a href="cleaning.jsp">Cleaning</a></li>
                                    <li><a href="mask.jsp">Mask</a></li>
                                    <li><a href="acnetreatment.jsp">Acne treatment</a></li>
                                    <li><a href="tonner.jsp">Tonner</a></li>

                                </ul>
                            </li>
                            <li class="cartelogy-left-li"><a href="">Hair Care</a>
                                <ul>
                                    <li><a href="shampoo.jsp">Shampoo</a></li>
                                    <li><a href="conditioner.jsp">Conditioner</a></li>
                                    <li><a href="hairmask.jsp">Hair mask</a></li>
                                    <li><a href="hairoil.jsp">Hair oil</a></li>
                                </ul>
                            </li>


                        </ul>
                    </div>
                    <div class="cartelogy-right row">
                        <div class="cartelogy-right-top">
                            <div class="cartelogy-right-top-item">
                                <p>ALL</p>
                            </div>
                            <div class="cartelogy-right-top-item">
                                <button><span>filter</span><i class="fa-solid fa-filter" style="color: #4e82c6;"></i></button>
                            </div>
                            <div class="cartelogy-right-top-item">
                                <select name="" id="">
                                    <option value="all"> Tat ca san pham</option>
                                    <option value="makeup"> Trang diem</option>
                                    <option value="skincare"> Cham soc da </option>
                                    <option value="haircare"> Cham soc toc </option>

                                </select>
                            </div>
                        </div>
                        <div class="cartegory-right-content">
                            <div class="cartegory-right-content-item"
                                 data-category="makeup"
                                 data-brand="3ce"
                                 data-type="cushion"
                                 data-tone="light"
                                 data-price="280000">
                                <img src="image/cushion.jpg" alt="" >
                                <h1>3CE BARE COVER CUSHION </h1>
                                <p>580.000<sup>đ</sup></p>
                            </div>
                            <div class="cartegory-right-content-item"
                                 <div class="cartegory-right-content-item"
                                 data-category="makeup"
                                 data-brand="3ce"
                                 data-type="eye shadow"
                                 data-tone="light"
                                 data-price="380000">
                                    <img src="image/takeface.jpg" alt="" >
                                    <h1>3CE NEW TAKE FACE BLUSHER</h1>
                                    <p>380.000<sup>đ</sup></p>
                                </div>
                                <div class="cartegory-right-content-item"
                                     <div class="cartegory-right-content-item"
                                     data-category="makeup"
                                     data-brand="canmake"
                                     data-type="mascara"
                                     data-tone="dark"
                                     data-price="190000">
                                        <img src="image/mascara.jpg" alt="">
                                        <h1>Mascara</h1>
                                        <p>190.000<sup>đ</sup></p>
                                    </div>
                                    <div class="cartegory-right-content-item"
                                         data-category="makeup"
                                         data-brand="canmake"
                                         data-type="eye shadow"
                                         data-tone="light"
                                         data-price="2000000">
                                        <img src="image/phanmat.png" alt="">
                                        <h1>Palette Eyes</h1>
                                        <p>2.000.000<sup>đ</sup></p>
                                    </div>
                                    <div class="cartegory-right-content-item"
                                         data-category="makeup"
                                         data-brand="maybellin"
                                         data-type="but cushion"
                                         data-tone="light"
                                         data-price="120000">
                                        <img src="image/butcushion.jpg"  alt="" >
                                        <h1>But Cushion</h1>
                                        <p>120.000<sup>đ</sup></p>
                                    </div>
                                    <div class="cartegory-right-content-item"
                                         data-category="makeup"
                                         data-brand="maybellin"
                                         data-type="eyeliner"
                                         data-tone="dark"
                                         data-price="175000">
                                        <img src="image/kematnuoc.jpg" alt="">
                                        <h1>But ke mat nuoc</h1>
                                        <p>175.000<sup>đ</sup></p>
                                    </div>
                                    <div class="cartegory-right-content-item"
                                         data-category="makeup"
                                         data-brand="3ce"
                                         data-type="lip tin"
                                         data-tone="light"
                                         data-price="350000">
                                        <img src="image/liptin.png" alt="" >
                                        <h1>3CE LIP TIN</h1>
                                        <p>350.000<sup>đ</sup></p>
                                    </div>
                                    <div class="cartegory-right-content-item"
                                         data-category="makeup"
                                         data-brand="maybellin"
                                         data-type="foundation cream"
                                         data-tone="light"
                                         data-price="200000">
                                        <img src="image/kemnen.jpg" alt="">
                                        <h1>Kem nen Maybeline</h1>
                                        <p>200.000<sup>đ</sup></p>
                                    </div>
                                </div>
                                <div class="cartegory-right-bottom">
                                    <div class="cartegory-right-bottem-items">
                                        <p> Hien thi 2 <span>|</span> 4 san pham </p>
                                    </div>
                                    <div>
                                        <p><span>&#187;</span>1 2 3 4 5 <span>&#187;</span></p>
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
