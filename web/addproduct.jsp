<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .sidebar {
            height: 100vh;
            background-color: #FFB2CD;
            color: #fff;
            padding: 20px;
        }
        .sidebar a {
            display: block;
            color: #23272b;
            margin: 10px 0;
            text-decoration: none;
            transition: all 0.2s ease-in-out;
        }
        .sidebar a:hover {
            text-decoration: underline;
            margin-left: 5px;
        }
        .sidebar .collapse a {
            font-size: 14px;
            margin-left: 15px;
        }
        .main-content {
            background-color: #fbe8ef;
            padding: 30px;
            height: 100vh;
            overflow-y: auto;
        }
        .sidebar .email-info {
            font-size: 14px;
            margin-bottom: 20px;
            font-style: italic;
        }
          .btn-primary {
    background-color: #FFB2CD;
    border-color: #FFB2CD;
    color: white;
}

.btn-primary:hover {
    background-color: #fda3c3;
    border-color: #fda3c3;
}
    </style>
</head>
<body>
   <div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <div class="email-info" style="color: #23272b;"><i class="fa-regular fa-user"></i> Email: ${sessionScope.userEmail}</div>
            <ul class="list-unstyled">
                <li><a href="home.jsp"><i class="fa-solid fa-cash-register"></i> Bán hàng</a></li>
                <li><a href="#"><i class="fa-solid fa-sliders"></i> Điều khiển</a></li>

                <!-- Quản lý nhân viên -->
                <li>
                    <a data-bs-toggle="collapse" href="#staffMenu" role="button" aria-expanded="false" aria-controls="staffMenu">
                        <i class="fa-solid fa-users"></i> Quản lý nhân viên <i class="fa-solid fa-chevron-down float-end"></i>
                    </a>
                    <div class="collapse" id="staffMenu">
                        <a href="addstaff.jsp">Thêm nhân viên</a>
                        <a href="showstaff.jsp">Xem thông tin nhân viên</a>
                    </div>
                </li>

                <!-- Quản lý khách hàng -->
                <li><a href="informationuser.jsp"><i class="fa-solid fa-user-group"></i> Quản lý khách hàng</a></li>

                <!-- Quản lý sản phẩm -->
                <li>
                    <a data-bs-toggle="collapse" href="#productMenu" role="button" aria-expanded="false" aria-controls="productMenu">
                        <i class="fa-solid fa-boxes-stacked"></i> Quản lý sản phẩm <i class="fa-solid fa-chevron-down float-end"></i>
                    </a>
                    <div class="collapse" id="productMenu">
                        <a href="addproduct.jsp">Tạo mới sản phẩm</a>
                        <a href="addcategory.jsp">Thêm danh mục</a>
                        <a href="addsupplier.jsp">Thêm nhà cung cấp</a>
                        <a href="showProduct.jsp">Danh sách sản phẩm</a>
                    </div>
                </li>

                <!-- Quản lý đơn hàng -->
                <li>
                    <a data-bs-toggle="collapse" href="#orderMenu" role="button" aria-expanded="false" aria-controls="orderMenu">
                        <i class="fa-solid fa-file-invoice"></i> Quản lý đơn hàng (<%= request.getAttribute("totalOrders") != null ? request.getAttribute("totalOrders") : 0 %>) <i class="fa-solid fa-chevron-down float-end"></i>
                    </a>
                    <div class="collapse" id="orderMenu">
                        <a href="orderList.jsp">📋 Danh sách đơn hàng</a>
                        <a href="orders-delivered.jsp">✅ Đơn hàng đã giao</a>
                        <a href="orders-return.jsp">↩️ Trả hàng</a>
                    </div>
                </li>

                <!-- Báo cáo -->
                <li><a href="report.jsp"><i class="fa-solid fa-chart-pie"></i> Báo cáo doanh thu</a></li>
                <li><a href="logout"><i class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a></li>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function toggleDropdown(id) {
            const dropdown = document.getElementById(id);
            dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
        }
    </script>
</body>
</html>
