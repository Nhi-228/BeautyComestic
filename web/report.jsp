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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            height: 100vh;
        }
        .sidebar {
            width: 250px;
            background-color: #e0aade;
            color: white;
            padding: 20px;
            overflow-y: auto;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar li {
            margin-bottom: 10px;
        }
        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
        }
        .sidebar a:hover {
            text-decoration: underline;
        }
        .dropdown-menu-custom {
            display: none;
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
            background-color: white;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <p><strong>Email:</strong> ${sessionScope.userEmail}</p>
    <ul>
        <li><a href="home.jsp">🏠 Bán hàng</a></li>
        <li><a href="#">🛠 Điều khiển</a></li>

        <li>
            <a onclick="toggleDropdown('staffDropdown')">👨‍💼 Quản lý nhân viên ▼</a>
            <div class="dropdown-menu-custom" id="staffDropdown">
                <a href="addstaff.jsp">➕ Thêm nhân viên</a>
                <a href="showstaff.jsp">📄 Xem thông tin nhân viên</a>
            </div>
        </li>

        <li><a href="#">👥 Quản lý khách hàng</a></li>

        <li>
            <a onclick="toggleDropdown('productDropdown')">📦 Quản lý sản phẩm ▼</a>
            <div class="dropdown-menu-custom" id="productDropdown">
                <a href="addproduct.jsp">➕ Tạo mới sản phẩm</a>
                <a href="addcategory.jsp">📂 Thêm danh mục</a>
                <a href="addsupplier.jsp">🏭 Thêm nhà cung cấp</a>
                <a href="showProduct.jsp">📋 Danh sách sản phẩm</a>
            </div>
        </li>

        <li>
            <a onclick="toggleDropdown('orderDropdown')">🧾 Quản lý đơn hàng ▼</a>
            <div class="dropdown-menu-custom" id="orderDropdown">
                <a href="orderList.jsp">📋 Danh sách đơn hàng</a>
                <a href="orders-delivered.jsp">✅ Đơn hàng đã giao</a>
                <a href="orders-return.jsp">↩️ Trả hàng</a>
            </div>
        </li>

        <li><a href="report.jsp">📈 Báo cáo doanh thu</a></li>
        <li><a href="logout">🚪 Đăng xuất</a></li>
    </ul>
</div>

<!-- Main Content -->
<div class="main-content">
    <h1>📊 Báo cáo thống kê doanh thu</h1>

    <h3>📅 Doanh thu theo ngày</h3>
    <canvas id="barChart" width="800" height="400"></canvas>

    <h3>📊 Tỷ lệ đơn hàng thành công / thất bại</h3>
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

<!-- JavaScript: Chart.js & Dropdown -->
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
            plugins: {
                legend: {
                    position: 'top'
                }
            },
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

    // Dropdown toggle function
    function toggleDropdown(id) {
        const dropdown = document.getElementById(id);
        dropdown.style.display = dropdown.style.display === "block" ? "none" : "block";
    }
</script>
</body>
</html>
