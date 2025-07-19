<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAO"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            display: flex;
            height: 100vh;
        }
        .sidebar {
            width: 220px;
            background-color: #f8a5c2;
            padding-top: 20px;
            flex-shrink: 0;
        }
        .sidebar h2 {
            text-align: center;
            color: white;
        }
        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        .sidebar a:hover {
            background-color: #f78fb3;
        }
        .main-content {
            flex-grow: 1;
            padding: 20px;
            background-color: #fff;
            overflow-y: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #fcd1df;
        }
        .hidden {
            display: none;
        }
    </style>
    <script>
        function showSection(sectionId) {
            document.getElementById("customerManagement").classList.add("hidden");
            if (sectionId === 'customerManagement') {
                document.getElementById("customerManagement").classList.remove("hidden");
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="sidebar">
            <h2>Admin</h2>
            <a href="#" onclick="showSection('customerManagement')">Quản lý khách hàng</a>
        </div>
        <div class="main-content">
            <h1>Welcome, Admin</h1>

            <!-- Quản lý khách hàng -->
            <div id="customerManagement" class="hidden">
                <h2>Thông tin khách hàng</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Mã KH</th>
                            <th>Tên</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Đơn đã mua</th>
                            <th>Đơn đã hủy</th>
                            <th>Xác thực</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                UserDAO userDAO = new UserDAO();
                                List<User> list = userDAO.getAllUsers(); // bạn cần có hàm này trong DAO
                                for (User u : list) {
                        %>
                        <tr>
                            <td><%= u.getUser_id() %></td>
                            <td><%= u.getFull_name() %></td>
                            <td><%= u.getEmail() %></td>
                            <td><%= u.getPhone() %></td>
                            <td><%= userDAO.countSuccessOrders(u.getUser_id()) %></td>
                            <td><%= userDAO.countCancelledOrders(u.getUser_id()) %></td>
                            <td><%= u.isVerified() ? "Đã xác thực" : "Chưa xác thực" %></td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                out.println("Lỗi: " + e.getMessage());
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
