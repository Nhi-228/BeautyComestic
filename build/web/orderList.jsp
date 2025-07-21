<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Order"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    int totalOrders = (orders != null) ? orders.size() : 0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý đơn hàng</title>
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
            background-color: #f9f9f9; padding: 30px; height: 100vh; overflow-y: auto;
        }
        /* Bảng đơn hàng */
table.table-bordered {
    background-color: #fffdfd;
    border: 1px solid #FFC7D5;
}

table.table-bordered th {
    background-color: #FFDAE6;
    color: #23272b;
    border-color: #FFC7D5;
}

table.table-bordered td {
    border-color: #FFE3EC;
    background-color: #FFF5F8;
}

/* Hover trên dòng đơn hàng */
#orderTable tbody tr:hover {
    background-color: #FFEEF3;
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

        <!-- Nội dung -->
        <div class="col-md-10 main-content">
            <h3 class="mt-4">Quản Lý Đơn Hàng</h3>
            <p>Tổng số đơn hàng: <strong><%= totalOrders %></strong></p>

            <!-- Bộ lọc -->
            <div class="d-flex mb-3 gap-3">
                <select id="statusFilter" class="form-select w-25">
                    <option value="">-- Trạng thái đơn hàng --</option>
                    <option value="Chờ xử lý">Chờ xử lý</option>
                    <option value="Đang giao">Đang giao</option>
                    <option value="Đã giao">Đã giao</option>
                    <option value="Đã hủy">Đã hủy</option>
                </select>
                <select id="paymentFilter" class="form-select w-25">
                    <option value="">-- Trạng thái thanh toán --</option>
                    <option value="Đã thanh toán">Đã thanh toán</option>
                    <option value="Chưa thanh toán">Chưa thanh toán</option>
                </select>
            </div>

            <!-- Bảng đơn hàng -->
            <table class="table table-bordered" id="orderTable">
                <thead class="table-dark">
                    <tr>
                        <th>Mã đơn</th>
                        <th>Ngày đặt</th>
                        <th>Khách hàng</th>
                        <th>Tổng tiền</th>
                        <th>Phương thức TT</th>
                        <th>Trạng thái thanh toán</th>
                        <th>Trạng thái xử lý</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="o" items="${orders}">
                        <tr>
                            <td>${o.orderNumber}</td>
                            <td>${o.orderDate}</td>
                            <td>${o.customerId}</td>
                            <td>${o.totalAmount}</td>
                            <td>${o.paymentMethod}</td>
                            <td class="payment">${o.paymentStatus}</td>
                            <td class="status">${o.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Toggle sidebar dropdown
    function toggleDropdown(id) {
        const menu = document.getElementById(id);
        menu.style.display = menu.style.display === "block" ? "none" : "block";
    }

    // Bộ lọc
    const statusFilter = document.getElementById("statusFilter");
    const paymentFilter = document.getElementById("paymentFilter");

    function filterOrders() {
        const status = statusFilter.value.toLowerCase();
        const payment = paymentFilter.value.toLowerCase();
        const rows = document.querySelectorAll("#orderTable tbody tr");

        rows.forEach(row => {
            const rowStatus = row.querySelector(".status").textContent.toLowerCase();
            const rowPayment = row.querySelector(".payment").textContent.toLowerCase();
            const matchStatus = !status || rowStatus.includes(status);
            const matchPayment = !payment || rowPayment.includes(payment);
            row.style.display = (matchStatus && matchPayment) ? "" : "none";
        });
    }

    statusFilter.addEventListener("change", filterOrders);
    paymentFilter.addEventListener("change", filterOrders);
</script>
</body>
</html>
