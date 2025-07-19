<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thông tin khách hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* ✅ Căn ngang bằng Flex */
        .layout-wrapper {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
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
            flex-grow: 1;
            background-color:#fbe8ef;
            padding: 30px;
            overflow-y: auto;
        }

        h1 {
            color: #e84393;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #fcd1df;
        }

        form button {
            margin: 2px;
            padding: 5px 10px;
            background-color: #ffc6d0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        form button:hover {
            background-color: #f79eb5;
        }
    </style>
</head>
<body>

<!-- ✅ Chỉ dùng wrapper Flex -->
<div class="layout-wrapper">
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="email-info" style="color: #23272b;"><i class="fa-regular fa-user"></i> Email: ${sessionScope.userEmail}</div>
        <ul class="list-unstyled">
            <li><a href="home.jsp"><i class="fa-solid fa-cash-register"></i> Bán hàng</a></li>
            <li><a href="#"><i class="fa-solid fa-sliders"></i> Điều khiển</a></li>
            <li>
                <a data-bs-toggle="collapse" href="#staffMenu"><i class="fa-solid fa-users"></i> Quản lý nhân viên <i class="fa-solid fa-chevron-down float-end"></i></a>
                <div class="collapse" id="staffMenu">
                    <a href="addstaff.jsp">Thêm nhân viên</a>
                    <a href="showstaff.jsp">Xem thông tin nhân viên</a>
                </div>
            </li>
            <li><a href="informationuser.jsp"><i class="fa-solid fa-user-group"></i> Quản lý khách hàng</a></li>
            <li>
                <a data-bs-toggle="collapse" href="#productMenu"><i class="fa-solid fa-boxes-stacked"></i> Quản lý sản phẩm <i class="fa-solid fa-chevron-down float-end"></i></a>
                <div class="collapse" id="productMenu">
                    <a href="addproduct.jsp">Tạo mới sản phẩm</a>
                    <a href="addcategory.jsp">Thêm danh mục</a>
                    <a href="addsupplier.jsp">Thêm nhà cung cấp</a>
                    <a href="showProduct.jsp">Danh sách sản phẩm</a>
                </div>
            </li>
            <li>
                <a data-bs-toggle="collapse" href="#orderMenu"><i class="fa-solid fa-file-invoice"></i> Quản lý đơn hàng (<%= request.getAttribute("totalOrders") != null ? request.getAttribute("totalOrders") : 0 %>) <i class="fa-solid fa-chevron-down float-end"></i></a>
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

    <!-- Main Content -->
    <div class="main-content">
        <h1>Quản lý khách hàng</h1>
        <table>
            <thead>
                <tr>
                    <th>Mã KH</th>
                    <th>Họ tên</th>
                    <th>Email</th>
                    <th>SĐT</th>
                    <th>Đã mua</th>
                    <th>Đã hủy</th>
                    <th>Xác thực</th>
                    <th>Chặn</th>
                    <th>Trạng thái</th>
                    <th>Hành động</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        UserDAO userDAO = new UserDAO();
                        List<User> customers = userDAO.getAllCustomers();

                        for (User u : customers) {
                %>
                <tr>
                    <td><%= u.getUser_id() %></td>
                    <td><%= u.getFull_name() %></td>
                    <td><%= u.getEmail() %></td>
                    <td><%= u.getPhone() %></td>
                    <td><%= userDAO.countSuccessfulOrdersByCustomer(u.getUser_id()) %></td>
                    <td><%= userDAO.countCanceledOrdersByCustomer(u.getUser_id()) %></td>
                    <td><%= u.isVerified() ? "Đã xác thực" : "Chưa xác thực" %></td>
                    <td><%= u.isBlocked() ? "Có" : "Không" %></td>
                    <td><%= u.isActive() ? "Hoạt động" : "Vô hiệu hóa" %></td>
                    <td>
                        <form method="post" action="userstatus">
                            <input type="hidden" name="userId" value="<%= u.getUser_id() %>"/>
                            <button name="action" value="verify"><%= u.isVerified() ? "Hủy xác thực" : "Xác thực" %></button>
                            <button name="action" value="block"><%= u.isBlocked() ? "Bỏ chặn" : "Chặn" %></button>
                            <button name="action" value="active"><%= u.isActive() ? "Vô hiệu hóa" : "Kích hoạt" %></button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        out.println("<tr><td colspan='10'>Lỗi: " + e.getMessage() + "</td></tr>");
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

<!-- Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
