<%-- 
    Document   : dangky
    Created on : Jul 16, 2025, 2:28:51 PM
    Author     : nathv
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng ký tài khoản</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 500px;
            margin: 40px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 16px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error {
            color: red;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <h2>Đăng ký tài khoản</h2>

    <form action="register" method="post">
        <label for="fullname">Họ và tên:</label><br>
        <input type="text" id="fullname" name="fullname" required><br>

        <label for="username">Tên đăng nhập:</label><br>
        <input type="text" id="username" name="username" required><br>

        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" required><br>

        <label for="sdt">Số điện thoại:</label><br>
        <input type="text" id="sdt" name="sdt" required pattern="[0-9]{10}" title="Số điện thoại phải có 10 chữ số"><br>

        <label for="password">Mật khẩu:</label><br>
        <input type="password" id="password" name="password" required><br>

        <label for="repassword">Nhập lại mật khẩu:</label><br>
        <input type="password" id="repassword" name="repassword" required><br>

        <label for="address">Địa chỉ:</label><br>
        <input type="text" id="address" name="address"><br>

        <input type="submit" value="Đăng ký">
    </form>

    <%-- Hiển thị lỗi từ servlet nếu có (tùy bạn mở rộng xử lý hiển thị ở servlet) --%>
    <%
        String error = request.getParameter("error");
        if (error != null) {
    %>
        <p class="error"><%= error %></p>
    <%
        }
    %>
</body>
</html>

