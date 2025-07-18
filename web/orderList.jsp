<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Order"%>
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
        .sidebar {
            background-color: #e0aade;
            height: 100vh;
            padding: 1rem;
        }
        .filter-container {
            display: flex;
            gap: 1rem;
            margin-bottom: 20px;
        }
        .dropdown-menu {
            display: none;
            margin-top: 0.5rem;
        }
        .dropdown-menu.show {
            display: block;
        }
        .dropdown-toggle {
            cursor: pointer;
        }
        .dropdown-item:hover {
            background-color: #f0f0f0;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <button class="login-btn" id="loginBtn">${sessionScope.userEmail}</button>
            <ul class="dropdown-list" id="loginDropdown">
                <li>Email: ${sessionScope.userEmail}</li>
                <li><a href="logout">Đăng xuất</a></li>
            </ul>

            <ul class="list-unstyled mt-3">
                <li><a href="#">Bán hàng</a></li>
                <li><a href="#">Điều khiển</a></li>
                <li><a href="managerstaff.jsp">Quản lý nhân viên</a></li>
                <li><a href="#">Quản lý khách hàng</a></li>
                <li><a href="managerProduct.jsp">Quản lý sản phẩm</a></li>

                <!-- 🔽 Dropdown: Quản lý đơn hàng -->
                <li class="dropdown">
                    <a class="dropdown-toggle" id="orderDropdown">Quản lý đơn hàng (<%= totalOrders %>)</a>
                    <ul class="dropdown-menu list-unstyled ps-3" id="orderDropdownMenu">
                        <li><a class="dropdown-item" href="orderList.jsp">📋 Danh sách đơn hàng</a></li>
                        <li><a class="dropdown-item" href="orders-delivered.jsp">✅ Đơn hàng đã giao</a></li>
                        <li><a class="dropdown-item" href="orders-return.jsp">↩️ Trả hàng</a></li>
                    </ul>
                </li>

                <li><a href="#">Quản lí kho</a></li>
                <li><a href="#">Báo cáo doanh thu</a></li>
            </ul>
        </div>

        <!-- Nội dung bên phải -->
        <div class="col-md-10">
            <h3 class="mt-4">Quản Lý Đơn Hàng</h3>
            <p>Tổng số đơn hàng: <strong><%= totalOrders %></strong></p>

            <!-- Bộ lọc dropdown -->
            <div class="filter-container">
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
    // Dropdown toggle
    document.getElementById("orderDropdown").addEventListener("click", function (e) {
        e.preventDefault();
        const menu = document.getElementById("orderDropdownMenu");
        menu.classList.toggle("show");
    });

    document.addEventListener("click", function (e) {
        const dropdown = document.getElementById("orderDropdownMenu");
        const toggle = document.getElementById("orderDropdown");
        if (!toggle.contains(e.target) && !dropdown.contains(e.target)) {
            dropdown.classList.remove("show");
        }
    });

    // Filter function
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
