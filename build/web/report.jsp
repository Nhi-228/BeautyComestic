<%@ page import="dao.OrderDao" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    OrderDao dao = new OrderDao();
    Map<String, Double> revenueMap = dao.getRevenueByDate();
    int totalSuccess = dao.countSuccessfulOrders();
    int totalFailed = dao.countFailedOrders();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Báo cáo doanh thu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* 👉 Flex layout for sidebar and main content */
        .layout-wrapper {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #FFB2CD;
            padding: 20px;
            flex-shrink: 0;
            color: #23272b;
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

        .sidebar .email-info {
            font-size: 14px;
            font-style: italic;
            margin-bottom: 20px;
        }

        .sidebar .collapse a {
            font-size: 14px;
            margin-left: 15px;
        }

        .main-content {
            flex: 1;
            padding: 30px;
            background-color: #f9f9f9;
            overflow-y: auto;
        }

        h1, h3 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ccc;
        }

        th {
            background-color: #f1f1f1;
        }

        canvas {
            margin-top: 20px;
            background-color: #fff;
        }
    </style>
</head>
<body>

<div class="layout-wrapper">

    <!-- 🔧 Sidebar -->
    <div class="sidebar">
        <div class="email-info"><i class="fa-regular fa-user"></i> Email: ${sessionScope.userEmail}</div>
        <ul class="list-unstyled">
            <li><a href="home.jsp"><i class="fa-solid fa-cash-register"></i> Bán hàng</a></li>
            <li><a href="#"><i class="fa-solid fa-sliders"></i> Điều khiển</a></li>
            <li>
                <a data-bs-toggle="collapse" href="#staffMenu" role="button" aria-expanded="false" aria-controls="staffMenu">
                    <i class="fa-solid fa-users"></i> Quản lý nhân viên <i class="fa-solid fa-chevron-down float-end"></i>
                </a>
                <div class="collapse" id="staffMenu">
                    <a href="addstaff.jsp"><i class="fa-solid fa-user-plus"></i> Thêm nhân viên</a>
                    <a href="showstaff.jsp"><i class="fa-solid fa-address-book"></i> Xem thông tin nhân viên</a>
                </div>
            </li>
            <li><a href="informationuser.jsp"><i class="fa-solid fa-user-group"></i> Quản lý khách hàng</a></li>
            <li>
                <a data-bs-toggle="collapse" href="#productMenu" role="button" aria-expanded="false" aria-controls="productMenu">
                    <i class="fa-solid fa-boxes-stacked"></i> Quản lý sản phẩm <i class="fa-solid fa-chevron-down float-end"></i>
                </a>
                <div class="collapse" id="productMenu">
                    <a href="addproduct.jsp"><i class="fa-solid fa-plus"></i> Tạo mới sản phẩm</a>
                    <a href="addcategory.jsp"><i class="fa-solid fa-layer-group"></i> Thêm danh mục</a>
                    <a href="addsupplier.jsp"><i class="fa-solid fa-truck-field"></i> Thêm nhà cung cấp</a>
                    <a href="showProduct.jsp"><i class="fa-solid fa-list"></i> Danh sách sản phẩm</a>
                </div>
            </li>
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
            <li><a href="report.jsp"><i class="fa-solid fa-chart-pie"></i> Báo cáo doanh thu</a></li>
            <li><a href="logout"><i class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a></li>
        </ul>
    </div>

    <!-- 📊 Main Content -->
    <div class="main-content">
        <h1>📊 Báo cáo thống kê doanh thu</h1>

        <h3>📅 Doanh thu theo ngày</h3>
        <canvas id="barChart" width="800" height="400"></canvas>

        <h3>📈 Tỷ lệ đơn hàng thành công / thất bại</h3>
        <canvas id="pieChart" width="400" height="400"></canvas>

        <h3>📑 Bảng thống kê doanh thu</h3>
        <table>
            <tr>
                <th>Ngày</th>
                <th>Doanh thu (VND)</th>
            </tr>
            <% for (Map.Entry<String, Double> entry : revenueMap.entrySet()) { %>
            <tr>
                <td><%= entry.getKey() %></td>
                <td><%= String.format("%,.0f", entry.getValue()) %></td>
            </tr>
            <% } %>
        </table>
    </div>
</div>

<!-- 🧠 Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const barLabels = [<% for (String date : revenueMap.keySet()) { %>"<%= date %>", <% } %>];
    const barData = [<% for (Double val : revenueMap.values()) { %><%= val %>, <% } %>];

    new Chart(document.getElementById("barChart"), {
        type: 'bar',
        data: {
            labels: barLabels,
            datasets: [{
                label: 'Doanh thu (VND)',
                data: barData,
                backgroundColor: 'rgba(54, 162, 235, 0.6)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value) {
                            return value.toLocaleString('vi-VN') + ' đ';
                        }
                    }
                }
            }
        }
    });

    new Chart(document.getElementById("pieChart"), {
        type: 'pie',
        data: {
            labels: ['Thành công', 'Thất bại'],
            datasets: [{
                data: [<%= totalSuccess %>, <%= totalFailed %>],
                backgroundColor: ['#28a745', '#dc3545']
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'bottom'
                }
            }
        }
    });
</script>
</body>
</html>