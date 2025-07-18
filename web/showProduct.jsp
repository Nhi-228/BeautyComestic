<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, model.Product, dao.ProductDao"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý sản phẩm</title>
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
                <li>
                    <a onclick="toggleDropdown('staffDropdown')">Quản lý nhân viên ▼</a>
                    <div class="dropdown-menu-custom" id="staffDropdown">
                        <a href="addstaff.jsp">+ Thêm nhân viên</a>
                        <a href="showstaff.jsp">+ Xem thông tin nhân viên</a>
                    </div>
                </li>
                <li><a href="#">Quản lý khách hàng</a></li>
                <li>
                    <a onclick="toggleDropdown('productDropdown')">Quản lý sản phẩm ▼</a>
                    <div class="dropdown-menu-custom" id="productDropdown">
                        <a href="addproduct.jsp">+ Tạo mới sản phẩm</a>
                        <a href="addcategory.jsp">+ Thêm danh mục</a>
                        <a href="addsupplier.jsp">+ Thêm nhà cung cấp</a>
                        <a href="showProduct.jsp">+Danh sách sản phẩm</a>
                    </div>
                </li>
                <li>
                    <a onclick="toggleDropdown('orderDropdown')">Quản lý đơn hàng ▼</a>
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

        <!-- Main Content -->
        <div class="col-md-10 main-content">
            <div class="btn-area mb-3">
                <a href="addproduct.jsp" class="btn btn-success">+ Tạo mới sản phẩm</a>
                <a href="addcategory.jsp" class="btn btn-success">+ Thêm danh mục</a>
                <a href="addsupplier.jsp" class="btn btn-success">+ Thêm nhà cung cấp</a>
            </div>

            <h4 class="mt-4">Danh sách sản phẩm</h4>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Mã SP</th>
                        <th>Tên sản phẩm</th>
                        <th>Ảnh</th>
                        <th>Số lượng</th>
                        <th>Tình trạng</th>
                        <th>Giá tiền</th>
                        <th>Danh mục</th>
                        <th>Chức năng</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ProductDao dao = new ProductDao();
                        List<Product> list = dao.getAllProducts();
                        for (Product p : list) {
                    %>
                    <tr>
                        <td><%=p.getProductId()%></td>
                        <td><%=p.getProductName()%></td>
                        <td><img src="<%=p.getImageUrl()%>" alt="" width="50"/></td>
                        <td><%=p.getStockQuantity()%></td>
                        <td><%=p.isActive() ? "Còn hàng" : "Hết hàng"%></td>
                        <td><%=p.getPrice()%> đ</td>
                        <td><%=p.getCategoryId()%></td>
                        <td>
                            <a href="editproduct.jsp?id=<%=p.getProductId()%>" class="btn btn-warning btn-sm">Sửa</a>
                            <a href="deleteproduct?id=<%=p.getProductId()%>" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</a>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function toggleDropdown(id) {
        var dropdown = document.getElementById(id);
        dropdown.style.display = (dropdown.style.display === "block") ? "none" : "block";
    }
</script>
</body>
</html>
