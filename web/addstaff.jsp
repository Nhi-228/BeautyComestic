<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm mới</title>
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

                <li>
                    <a onclick="toggleStaffDropdown()">Quản lý nhân viên ▼</a>
                    <div class="dropdown-menu-custom" id="staffDropdown">
                        <a href="addstaff.jsp">+ Thêm nhân viên</a>
                        <a href="showstaff.jsp">+ Xem thông tin nhân viên</a>
                    </div>
                </li>

                <li><a href="#">Quản lý khách hàng</a></li>

                <li>
                    <a onclick="toggleProductDropdown()">Quản lý sản phẩm ▼</a>
                    <div class="dropdown-menu-custom" id="productDropdown">
                        <a href="addproduct.jsp">+ Tạo mới sản phẩm</a>
                        <a href="addcategory.jsp">+ Thêm danh mục</a>
                        <a href="addsupplier.jsp">+ Thêm nhà cung cấp</a>
                        <a href="showProduct.jsp">Danh sách sản phẩm</a>
                    </div>
                </li>

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

        <!-- Main content -->
        <div class="col-md-10 main-content">
            <h3>Thêm sản phẩm mới</h3>
            <form action="AddProductServlet" method="post">
                <div class="mb-3">
                    <label for="productName" class="form-label">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="productName" name="product_name" required>
                </div>
                <div class="mb-3">
                    <label for="price" class="form-label">Giá</label>
                    <input type="number" class="form-control" id="price" name="price" required>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Mô tả</label>
                    <textarea class="form-control" id="description" name="description"></textarea>
                </div>
                <div class="mb-3">
                    <label for="category" class="form-label">Danh mục</label>
                    <input type="text" class="form-control" id="category" name="category_id">
                </div>
                <div class="mb-3">
                    <label for="supplier" class="form-label">Nhà cung cấp</label>
                    <input type="text" class="form-control" id="supplier" name="supplier_id">
                </div>
                <div class="mb-3">
                    <label for="quantity" class="form-label">Số lượng</label>
                    <input type="number" class="form-control" id="quantity" name="quantity">
                </div>
                <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
            </form>
        </div>
    </div>
</div>

<script>
    function toggleProductDropdown() {
        var dropdown = document.getElementById("productDropdown");
        dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
    }

    function toggleOrderDropdown() {
        var dropdown = document.getElementById("orderDropdown");
        dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
    }

    function toggleStaffDropdown() {
        var dropdown = document.getElementById("staffDropdown");
        dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
    }
</script>
</body>
</html>
