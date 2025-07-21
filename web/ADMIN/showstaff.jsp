<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%
    User staff = (User) request.getAttribute("staff");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin nhân viên</title>
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
            transition: 0.2s ease;
        }

        .sidebar a:hover {
            text-decoration: underline;
            margin-left: 5px;
        }

        .main-content {
            background-color: #fbe8ef;
            padding: 30px;
            height: 100vh;
            overflow-y: auto;
        }

        .table th {
            background-color: #FFDAE6;
            width: 200px;
            color: #23272b;
        }

        .table td {
            background-color: #FFF5F8;
            color: #23272b;
        }

        .btn-back {
            background-color: #FFB2CD;
            border: none;
            color: white;
            padding: 8px 16px;
            border-radius: 6px;
            text-decoration: none;
        }

        .btn-back:hover {
            background-color: #fda3c3;
        }

        .alert {
            background-color: #ffcbd1;
            color: #23272b;
        }

        .email-info {
            font-size: 14px;
            font-style: italic;
            margin-bottom: 20px;
            color: #23272b;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar giữ nguyên -->
        <div class="col-md-2 sidebar">
            <div class="email-info"><i class="fa-regular fa-user"></i> Email: ${sessionScope.userEmail}</div>
            <ul class="list-unstyled">
                <li><a href="home.jsp"><i class="fa-solid fa-cash-register"></i> Bán hàng</a></li>
                <li><a href="#"><i class="fa-solid fa-sliders"></i> Điều khiển</a></li>
                <li>
                    <a data-bs-toggle="collapse" href="#staffMenu" role="button"><i class="fa-solid fa-users"></i> Quản lý nhân viên <i class="fa-solid fa-chevron-down float-end"></i></a>
                    <div class="collapse" id="staffMenu">
                        <a href="addstaff.jsp">Thêm nhân viên</a>
                        <a href="showstaff.jsp">Xem thông tin nhân viên</a>
                    </div>
                </li>
                <li><a href="informationuser.jsp"><i class="fa-solid fa-user-group"></i> Quản lý khách hàng</a></li>
                <li>
                    <a data-bs-toggle="collapse" href="#productMenu" role="button"><i class="fa-solid fa-boxes-stacked"></i> Quản lý sản phẩm <i class="fa-solid fa-chevron-down float-end"></i></a>
                    <div class="collapse" id="productMenu">
                        <a href="addproduct.jsp">Tạo mới sản phẩm</a>
                        <a href="addcategory.jsp">Thêm danh mục</a>
                        <a href="addsupplier.jsp">Thêm nhà cung cấp</a>
                        <a href="showProduct.jsp">Danh sách sản phẩm</a>
                    </div>
                </li>
                <li>
                    <a data-bs-toggle="collapse" href="#orderMenu" role="button"><i class="fa-solid fa-file-invoice"></i> Quản lý đơn hàng (<%= request.getAttribute("totalOrders") != null ? request.getAttribute("totalOrders") : 0 %>) <i class="fa-solid fa-chevron-down float-end"></i></a>
                    <div class="collapse" id="orderMenu">
                        <a href="orderList.jsp">📋 Danh sách đơn hàng</a>
                        <a href="orders-delivered.jsp">✅ Đơn hàng đã giao</a>
                        <a href="orders-return.jsp">↩️ Trả hàng</a>
                    </div>
                </li>
                <li><a href="report.jsp"><i class="fa-solid fa-chart-pie"></i> Báo cáo doanh thu</a></li>
                <li><a href="logout"><i class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a></li>
            </ul>
        </div>

        <!-- Main content -->
        <div class="col-md-10 main-content">
            <h2 class="text-center mb-4"><i class="fa-solid fa-id-card"></i> Thông tin nhân viên</h2>

            <% if (staff != null) { %>
                <table class="table table-bordered">
                    <tr><th>ID</th><td><%= staff.getUser_id() %></td></tr>
                    <tr><th>Tên đăng nhập</th><td><%= staff.getUsername() %></td></tr>
                    <tr><th>Email</th><td><%= staff.getEmail() %></td></tr>
                    <tr><th>Họ tên</th><td><%= staff.getFull_name() %></td></tr>
                    <tr><th>Số điện thoại</th><td><%= staff.getPhone() %></td></tr>
                    <tr><th>Địa chỉ</th><td><%= staff.getAddress() %></td></tr>
                    <tr><th>Vai trò</th><td><%= staff.getRole() %></td></tr>
                    <tr><th>Ngày tạo</th><td><%= staff.getCreated_at() %></td></tr>
                    <tr><th>Cập nhật lần cuối</th><td><%= staff.getUpdated_at() %></td></tr>
                    <tr><th>Xác thực</th><td><%= staff.isVerified() ? "Đã xác thực" : "Chưa xác thực" %></td></tr>
                    <tr><th>Chặn</th><td><%= staff.isBlocked() ? "Có" : "Không" %></td></tr>
                    <tr><th>Trạng thái</th><td><%= staff.isActive() ? "Hoạt động" : "Vô hiệu hóa" %></td></tr>
                </table>
                <div class="text-center mt-3">
                    <a href="user.jsp" class="btn-back"><i class="fa-solid fa-arrow-left"></i> Quay lại</a>
                </div>
            <% } else { %>
                <div class="alert text-center mt-4 p-3 rounded">
                    <i class="fa-solid fa-triangle-exclamation"></i> Không tìm thấy thông tin nhân viên.
                </div>
            <% } %>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>