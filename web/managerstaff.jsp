<%-- 
    Document   : managerstaff
    Created on : Jul 18, 2025, 2:25:33 PM
    Author     : BINH NHI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        </style>
    </head>
    <body>
       <div class="container-fluid">
            <div class="row">
                <!-- Sidebar bên trái -->
                <div class="col-md-2 sidebar">
                    <h5>Xin chào</h5>
                    <p>${sessionScope.userEmail}</p>
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

                <!-- Main content -->
               <div class="col-md-10 main-content">
                    <div class="btn-area">
                        <button class="btn btn-success btn-add" ><a href="addstaff.jsp">+ Thêm nhân viên</a></button>

                        <button class="btn btn-success btn-add"><a href="showstaff.jsp">+ Xem thông tin nhân viên</a></button>
                        
                        
                        
                    </div>

                   
                </div>
            </div>
        </div>
    </body>
</html>
