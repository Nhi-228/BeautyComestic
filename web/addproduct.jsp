<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
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
                <p>${sessionScope.userEmail}</p>
                <ul class="list-unstyled">
                    <li><a href="#">Bán hàng</a></li>
                    <li><a href="#">Điều khiển</a></li>
                    
                    <!-- Quản lý nhân viên -->
                    <li>
                        <a onclick="toggleDropdown('staffDropdown')">Quản lý nhân viên ▼</a>
                        <div class="dropdown-menu-custom" id="staffDropdown">
                            <a href="addstaff.jsp">+ Thêm nhân viên</a>
                            <a href="showstaff.jsp">+ Xem thông tin nhân viên</a>
                        </div>
                    </li>

                    <li><a href="#">Quản lý khách hàng</a></li>

                    <!-- Quản lý sản phẩm -->
                    <li>
                        <a onclick="toggleDropdown('productDropdown')">Quản lý sản phẩm ▼</a>
                        <div class="dropdown-menu-custom" id="productDropdown">
                            <a href="addproduct.jsp">+ Tạo mới sản phẩm</a>
                            <a href="addcategory.jsp">+ Thêm danh mục</a>
                            <a href="addsupplier.jsp">+ Thêm nhà cung cấp</a>
                            <a href="showProduct.jsp">+ Danh sách sản phẩm</a>
                        </div>
                    </li>

                    <!-- Quản lý đơn hàng -->
                    <li>
                        <a onclick="toggleDropdown('orderDropdown')">Quản lý đơn hàng (<%= request.getAttribute("totalOrders") != null ? request.getAttribute("totalOrders") : 0 %>) ▼</a>
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

            <!-- Main content -->
            <div class="col-md-10 main-content">
                <h2>Thêm sản phẩm mới</h2>
                <form action="product" method="post" enctype="multipart/form-data">
                    <input type="text" name="product_id" class="form-control mb-3" placeholder="Mã sản phẩm" required>
                    <input type="text" name="name" class="form-control mb-3" placeholder="Tên sản phẩm" required>
                    <input type="number" name="quantity" class="form-control mb-3" placeholder="Số lượng" required>

                    <select name="category" class="form-select mb-3" required>
                        <option value="">-- Chọn danh mục --</option>
                        <option value="1">Makeup</option>
                        <option value="2">Skincare</option>
                        <option value="3">Haircare</option>
                    </select>

                    <select name="supplier" class="form-select mb-3" required>
                        <option value="">-- Chọn nhà cung cấp --</option>
                        <option value="1">ABC</option>
                        <option value="2">XYZ</option>
                    </select>

                    <input type="number" name="price" class="form-control mb-3" placeholder="Giá bán" step="0.01" required>
                    <input type="number" name="cost" class="form-control mb-3" placeholder="Giá vốn" step="0.01" required>

                    <label class="form-label">Ảnh sản phẩm:</label>
                    <input type="file" name="image" class="form-control mb-3" required>

                    <textarea name="description" class="form-control mb-3" placeholder="Mô tả sản phẩm" rows="4" required></textarea>

                    <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
                </form>
            </div>
        </div>
    </div>

    <!-- JavaScript dropdown -->
    <script>
        function toggleDropdown(id) {
            const dropdown = document.getElementById(id);
            dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
        }
    </script>
</body>
</html>
