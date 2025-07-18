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
            background-color: #0d6efd;
            color: #fff;
            padding: 20px;
        }
        .sidebar a {
            display: block;
            color: #fff;
            margin: 8px 0;
            text-decoration: none;
        }
        .sidebar a:hover {
            text-decoration: underline;
        }
        .main-content {
            background-color: #f9f9f9;
            padding: 30px;
            height: 100vh;
            overflow-y: auto;
        }
        .form-control, .form-select {
            margin-bottom: 15px;
        }
        textarea {
            height: 150px;
        }
        .btn-area button a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <h5>Xin chào</h5>
            <p><%= session.getAttribute("userEmail") != null ? session.getAttribute("userEmail") : "Khách" %></p>
            <ul class="list-unstyled">
                <li><a href="#">Bán hàng</a></li>
                <li><a href="#">Điều khiển</a></li>
                <li><a href="#">Quản lý nhân viên</a></li>
                <li><a href="#">Quản lý khách hàng</a></li>
                <li><a href="managerProduct.jsp">Quản lý sản phẩm</a></li>
                <li><a href="#">Quản lý đơn hàng</a></li>
                <li><a href="#">Báo cáo doanh thu</a></li>
                <li><a href="logout">Đăng xuất</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="col-md-10 main-content">
            <div class="btn-area mb-3">
                <button class="btn btn-success"><a href="addproduct.jsp">+ Tạo mới sản phẩm</a></button>
                <button class="btn btn-success"><a href="addcategory.jsp">+ Thêm danh mục</a></button>
                <button class="btn btn-success">+ Thêm nhà cung cấp</button>
            </div>

            <!-- Bảng hiển thị sản phẩm -->
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
</body>
</html>
