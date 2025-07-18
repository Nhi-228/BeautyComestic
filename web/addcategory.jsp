<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.CategoryDao,model.Category" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm danh mục sản phẩm</title>
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
        .dropdown-menu {
            display: none;
            margin-top: 8px;
        }
        .dropdown-menu.show {
            display: block;
        }
        .dropdown-item {
            color: #fff;
            padding-left: 20px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2 sidebar">
                <p>${sessionScope.userEmail}</p>
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
                            <a href="showProduct.jsp">+Danh sách sản phẩm</a>
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
                    <li><a href="logout">Đăng xuất</a></li>
                </ul>
            </div>

            <!-- Nội dung chính bên phải -->
            <div class="col-md-10 main-content">
                <h2 class="text-center mb-4">Thêm danh mục sản phẩm</h2>

                <div class="form-container">
                    <form action="add-category" method="post">
                        <label for="categoryName">Tên danh mục:</label>
                        <input type="text" name="categoryName" class="form-control" required>

                        <label for="description">Mô tả:</label>
                        <textarea name="description" class="form-control"></textarea>

                        <label for="imageUrl">Link ảnh:</label>
                        <input type="text" name="imageUrl" class="form-control">

                        <label for="parentCategoryId">Danh mục cha (ID):</label>
                        <input type="text" name="parentCategoryId" class="form-control" placeholder="Có thể để trống nếu là danh mục gốc">

                        <label for="isActive">Trạng thái:</label>
                        <select name="isActive" class="form-select">
                            <option value="1">Kích hoạt</option>
                            <option value="0">Không kích hoạt</option>
                        </select>

                        <div class="text-center mt-3">
                            <input type="submit" value="Thêm danh mục" class="btn btn-success">
                        </div>
                    </form>

                    <% if (request.getParameter("msg") != null) { %>
                        <p class="text-center mt-3" style="color: <%= "success".equals(request.getParameter("msg")) ? "green" : "red" %>;">
                            <%= "success".equals(request.getParameter("msg")) ? "Thêm danh mục thành công!" : "Có lỗi xảy ra!" %>
                        </p>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
                <script>
    function toggleDropdown(id) {
        const dropdown = document.getElementById(id);
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    }

    function toggleStaffDropdown() {
        toggleDropdown("staffDropdown");
    }

    function toggleProductDropdown() {
        toggleDropdown("productDropdown");
    }

    function toggleOrderDropdown() {
        toggleDropdown("orderDropdown");
    }
</script>
</body>
</html>
