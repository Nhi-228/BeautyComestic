<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin nhân viên</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .sidebar {
            height: 100vh;
            background-color: #e0aade;
            color: #fff;
            padding: 20px;
        }
        .sidebar a {
            display: block;
            color: #fff;
            margin: 8px 0;
            text-decoration: none;
            cursor: pointer;
        }
        .sidebar a:hover {
            text-decoration: underline;
        }
        .dropdown-menu-custom {
            display: none;
            margin-left: 15px;
            margin-top: 5px;
        }
        .dropdown-menu-custom a {
            color: #fff;
            font-size: 14px;
        }
        .main-content {
            background-color: #f9f9f9;
            padding: 30px;
            height: 100vh;
            overflow-y: auto;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <button class="login-btn" id="loginBtn">${sessionScope.userEmail}</button>
            <ul class="dropdown-list" id="loginDropdown">
                <li>Email: ${sessionScope.userEmail}</li>
                <li><a href="logout">Đăng xuất</a></li>
            </ul>
            <ul class="list-unstyled">
                <li><a href="#">Bán hàng</a></li>
                <li><a href="#">Điều khiển</a></li>

                <!-- Quản lý nhân viên -->
                <li>
                    <a onclick="toggleStaffDropdown()">Quản lý nhân viên ▼</a>
                    <div class="dropdown-menu-custom" id="staffDropdown">
                        <a href="addstaff.jsp">+ Thêm nhân viên</a>
                        <a href="showstaff.jsp">+ Xem thông tin nhân viên</a>
                    </div>
                </li>

                <li><a href="#">Quản lý khách hàng</a></li>

                <!-- Quản lý sản phẩm -->
                <li>
                    <a onclick="toggleProductDropdown()">Quản lý sản phẩm ▼</a>
                    <div class="dropdown-menu-custom" id="productDropdown">
                        <a href="addproduct.jsp">+ Tạo mới sản phẩm</a>
                        <a href="addcategory.jsp">+ Thêm danh mục</a>
                        <a href="addsupplier.jsp">+ Thêm nhà cung cấp</a>
                        <a href="showProduct.jsp">Danh sách sản phẩm</a>
                    </div>
                </li>

                <!-- Quản lý đơn hàng -->
                <li>
                    <a onclick="toggleOrderDropdown()">Quản lý đơn hàng (<%= request.getAttribute("totalOrders") != null ? request.getAttribute("totalOrders") : 0 %>) ▼</a>
                    <div class="dropdown-menu-custom" id="orderDropdown">
                        <a href="orderList.jsp">📋 Danh sách đơn hàng</a>
                        <a href="orders-delivered.jsp">✅ Đơn hàng đã giao</a>
                        <a href="orders-return.jsp">↩️ Trả hàng</a>
                    </div>
                </li>

                <li><a href="#">Báo cáo doanh thu</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="col-md-10 main-content">
            <h2 class="mb-4 text-center">Thông tin chi tiết nhân viên</h2>
            <%
                User staff = (User) request.getAttribute("staff");
                if (staff != null) {
            %>
                <table class="table table-bordered">
                    <tr><th>ID</th><td><%= staff.getUser_id() %></td></tr>
                    <tr><th>Tên đăng nhập</th><td><%= staff.getUsername() %></td></tr>
                    <tr><th>Email</th><td><%= staff.getEmail() %></td></tr>
                    <tr><th>Họ tên</th><td><%= staff.getFull_name() %></td></tr>
                    <tr><th>Số điện thoại</th><td><%= staff.getPhone() %></td></tr>
                    <tr><th>Địa chỉ</th><td><%= staff.getAddress() %></td></tr>
                    <tr><th>Vai trò</th><td><%= staff.getRole() %></td></tr>
                    <tr><th>Cập nhật lần cuối</th><td><%= staff.getUpdate_at() %></td></tr>
                </table>

                <div class="text-center mt-4">
                    <a href="user.jsp" class="btn btn-primary">Quay lại danh sách</a>
                </div>
            <% } else { %>
                <div class="alert alert-danger text-center">
                    Không tìm thấy thông tin nhân viên.
                </div>
            <% } %>
        </div>
    </div>
</div>

<!-- Script dropdown toggle -->
<script>
    function toggleProductDropdown() {
        var dropdown = document.getElementById("productDropdown");
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    }

    function toggleOrderDropdown() {
        var dropdown = document.getElementById("orderDropdown");
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    }

    function toggleStaffDropdown() {
        var dropdown = document.getElementById("staffDropdown");
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    }
</script>
</body>
</html>
