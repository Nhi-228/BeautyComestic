<%-- 
    Document   : showstaff
    Created on : Jul 18, 2025, 3:25:48 PM
    Author     : BINH NHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.User"%>

<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
   <body>
     <div class="container mt-5">
        <h2 class="mb-4 text-center">Thông tin chi tiết nhân viên</h2>

        <%
            User staff = (User) request.getAttribute("staff");
            if (staff != null) {
        %>
            <table class="table table-bordered">
                <tr>
                    <th>ID</th>
                    <td><%= staff.getUser_id() %></td>
                </tr>
                <tr>
                    <th>Tên đăng nhập</th>
                    <td><%= staff.getUsername() %></td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td><%= staff.getEmail() %></td>
                </tr>
                <tr>
                    <th>Họ tên</th>
                    <td><%= staff.getFull_name() %></td>
                </tr>
                <tr>
                    <th>Số điện thoại</th>
                    <td><%= staff.getPhone() %></td>
                </tr>
                <tr>
                    <th>Địa chỉ</th>
                    <td><%= staff.getAddress() %></td>
                </tr>
                <tr>
                    <th>Vai trò</th>
                    <td><%= staff.getRole() %></td>
                </tr>
                <tr>
                    <th>Cập nhật lần cuối</th>
                    <td><%= staff.getUpdate_at() %></td>
                </tr>
            </table>

            <div class="text-center mt-4">
                <a href="user.jsp" class="btn btn-primary">Quay lại danh sách</a>
            </div>
        <% 
            } else { 
        %>
            <div class="alert alert-danger text-center">
                Không tìm thấy thông tin nhân viên.
            </div>
        <% 
            } 
        %>
    </div>
</body>
</html>
