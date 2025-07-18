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
    <style>
        body { margin: 0; font-family: Arial, sans-serif; }
        .sidebar {
            height: 100vh; background-color: #e0aade; color: #fff; padding: 20px;
        }
        .sidebar a {
            display: block; color: #fff; margin: 8px 0; text-decoration: none; cursor: pointer;
        }
        .sidebar a:hover { text-decoration: underline; }
        .dropdown-menu-custom {
            display: none; margin-left: 15px; margin-top: 5px;
        }
        .dropdown-menu-custom a {
            color: #fff; font-size: 14px;
        }
        .main-content {
            background-color: #f9f9f9; padding: 30px; height: 100vh; overflow-y: auto;
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
                    <a onclick="toggleDropdown('orderDropdown')">Quản lý đơn hàng (<%= totalOrders %>) ▼</a>
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
