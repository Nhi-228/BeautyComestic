<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mask Products</title>
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
            <li><a href="category.jsp">ALL</a></li>
            <li><a href="home.jsp">Home</a></li>
            <li class="dropdown"><a href="#">Makeup</a></li>
            <li class="dropdown"><a href="#">Skincare</a></li>
            <li class="dropdown"><a href="#">Hair Care</a></li>
            <li class="dropdown"><a href="personalcare.jsp">Personal Care</a></li>
        </ul>
    </nav>
    <div class="alert-bar">Collect more hot vouchers at Voucher Zone</div>
</header>
<section class="cartelogy">
    <div class="container">
        <div class="cartelogy-top row">
            <p>Home</p><span>&#8594;</span><p>Skincare</p><span>&#8594;</span><p>Mask</p>
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
                        <p>MASK</p>
                    </div>
                    <div class="cartelogy-right-top-item">
                        <button><span>filter</span><i class="fa-solid fa-filter" style="color: #4e82c6;"></i></button>
                    </div>
                    <div class="cartelogy-right-top-item">
                        <select name="" id="">
                            <option value="all"> Tat ca san pham</option>
                        </select>
                    </div>
                </div>
                <div class="cartegory-right-content">
                    <div class="cartegory-right-content-item" data-type="mask">
                        <img src="image/serumgiamthamnam.jpg" alt="">
                        <h1>Mặt nạ giảm thâm nám</h1>
                        <p>120.000<sup>đ</sup></p>
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
</body>
</html> 