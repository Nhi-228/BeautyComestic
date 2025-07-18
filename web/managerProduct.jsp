<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang quản lý</title>
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
            <!-- Sidebar bên trái -->
            <div class="col-md-2 sidebar">
                <p>${sessionScope.userEmail}</p>
                <ul class="list-unstyled">
                    <li><a href="#">Bán hàng</a></li>
                    <li><a href="#">Điều khiển</a></li>
                    <li><a href="#">Quản lý nhân viên</a></li>
                    <li><a href="#">Quản lý khách hàng</a></li>
                    
                    <!-- Dropdown quản lý sản phẩm -->
                    <li>
                        <a onclick="toggleDropdown()">Quản lý sản phẩm ▾</a>
                        <div class="dropdown-menu-custom" id="productDropdown">
                            <a href="addproduct.jsp">+ Tạo mới sản phẩm</a>
                            <a href="addcategory.jsp">+ Thêm danh mục</a>
                            <a href="addsupplier.jsp">+ Thêm nhà cung cấp</a>
                            <a href="showProduct.jsp">Danh sách sản phẩm</a>
                        </div>
                    </li>
                    
                    <li><a href="#">Quản lý đơn hàng</a></li>
                    <li><a href="#">Báo cáo doanh thu</a></li>
                    <li><a href="logout">Đăng xuất</a></li>
                </ul>
            </div>

            <!-- Main content -->
            <div class="col-md-10 main-content">
                <h3>Chào mừng đến trang quản lý!</h3>
                <p>Chọn mục từ thanh bên trái để thực hiện hành động.</p>
            </div>
        </div>
    </div>

    <script>
        function toggleDropdown() {
            var dropdown = document.getElementById("productDropdown");
            dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
        }
    </script>
</body>
</html>
