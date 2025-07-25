<%-- 
    Document   : register
    Created on : Jul 15, 2025, 8:16:15 PM
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" \
        crossorigin="anonymous">
  <style>
    .error {
      color: red;
      font-size: 14px;
      display: none;
    }
  </style>
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
                    <a href="cart.jsp" id="myBagBtn" class="btn-bag">
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


  <section class="py-5" style="background-color: #f0f0ff;">
    <div class="container">
        <form action="register" method="post" id="formregister" style="max-width: 500px; margin: auto;">
        <h3 class="text-center mb-4">Đăng ký tài khoản</h3>

        <div class="mb-3">
          <label class="form-label">Họ và tên</label>
          <input type="text" class="form-control" id="username">
          <div class="error" id="nameerror">Tên không được để trống</div>
        </div>

        <div class="mb-3">
          <label class="form-label">Email</label>
          <input type="text" class="form-control" id="email">
          <div class="error" id="emailerror">Email sai định dạng hoặc đã tồn tại</div>
        </div>

        <div class="mb-3">
          <label class="form-label">Số điện thoại</label>
          <input type="text" class="form-control" id="phone">
          <div class="error" id="phoneerror">Số điện thoại sai định dạng hoặc đã tồn tại</div>
        </div>

        <div class="mb-3">
          <label class="form-label">Mật khẩu</label>
          <input type="password" class="form-control" id="password">
          <div class="error" id="passworderror">Mật khẩu cần chữ hoa, ký tự đặc biệt, tối đa 6 ký tự</div>
        </div>

        <div class="mb-3">
          <label class="form-label">Nhập lại mật khẩu</label>
          <input type="password" class="form-control" id="repassword">
          <div class="error" id="repassworderror">Mật khẩu nhập lại không khớp</div>
        </div>

        <div class="mb-3">
          <label class="form-label">Địa chỉ</label>
          <textarea class="form-control" id="address"></textarea>
        </div>

        <div class="error text-center mb-3" id="duplicateerror">Thông tin đăng ký đã tồn tại!</div>

        <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
      </form>
    </div>
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
    <script>
    const form = document.getElementById('formregister');
    const username = document.getElementById('username');
    const email = document.getElementById('email');
    const phone = document.getElementById('phone');
    const password = document.getElementById('password');
    const repassword = document.getElementById('repassword');
    const address = document.getElementById('address');

    const nameerror = document.getElementById('nameerror');
    const emailerror = document.getElementById('emailerror');
    const phoneerror = document.getElementById('phoneerror');
    const passworderror = document.getElementById('passworderror');
    const repassworderror = document.getElementById('repassworderror');
    const duplicateerror = document.getElementById('duplicateerror');

    function validateEmail(email) {
      const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return re.test(email);
    }

    function validatePhone(phone) {
      const re = /^[0-9]{10}$/;
      return re.test(phone);
    }

    function validatePassword(password) {
      const hasUppercase = /[A-Z]/.test(password);
      const hasSpecial = /[^A-Za-z0-9]/.test(password);
      return hasUppercase && hasSpecial && password.length <= 6;
    }

    form.addEventListener('submit', function(e) {
      e.preventDefault();
      let isValid = true;

      // Reset lỗi
      nameerror.style.display = emailerror.style.display = phoneerror.style.display =
      passworderror.style.display = repassworderror.style.display = duplicateerror.style.display = 'none';

      const users = JSON.parse(localStorage.getItem("users")) || [];

      // Kiểm tra lỗi
      if (!username.value.trim()) {
        nameerror.style.display = 'block';
        isValid = false;
      }

      if (!validateEmail(email.value)) {
        emailerror.style.display = 'block';
        isValid = false;
      }

      if (!validatePhone(phone.value)) {
        phoneerror.style.display = 'block';
        isValid = false;
      }

      if (!validatePassword(password.value)) {
        passworderror.style.display = 'block';
        isValid = false;
      }

      if (repassword.value !== password.value || repassword.value === "") {
        repassworderror.style.display = 'block';
        isValid = false;
      }

      // Kiểm tra trùng
      const isDuplicate = users.some(u =>
        u.username === username.value.trim() ||
        u.email === email.value.trim() ||
        u.phone === phone.value.trim() ||
        u.password === password.value.trim()
      );

      if (isDuplicate) {
        duplicateerror.style.display = 'block';
        isValid = false;
      }

      // Nếu hợp lệ và không trùng, lưu vào localStorage
      if (isValid) {
        const newUser = {
          username: username.value.trim(),
          email: email.value.trim(),
          phone: phone.value.trim(),
          password: password.value.trim(),
          address: address.value.trim()
        };

        users.push(newUser);
        localStorage.setItem("users", JSON.stringify(users));
        alert("Đăng ký thành công!");
        window.location.href = "login.html";
      }
    });
    </script>
  </body>
</html>

