<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>home</title>
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

            .sidebar h5 {
                margin-bottom: 10px;
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

            .btn-add {
                margin-right: 10px;
            }

            .btn-area {
                margin-bottom: 20px;
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
                    <button class="login-btn" id="loginBtn"> ${sessionScope.userEmail}</button>
                    <ul class="dropdown-list" id="loginDropdown">
                        <li><i class="fa-regular fa-user"></i>Email : ${sessionScope.userEmail} </li>
                        <li><i class="fa-regular fa-user"></i><a href="logout">Đăng xuất</a></li>
                    </ul>
                    <li> <a href="#">Bán hàng</a></li>
                    <li> <a href="#">Điều khiển</a></li>
                    <li> <a href="#">Quản lý nhân viên</a></li>
                    <li><a href="#">Quản lý khách hàng</a></li>
                    <li> <a href="managerProduct.jsp">Quản lý sản phẩm</a></li>  
                    <li><a href="#">Quản lý đơn hàng</a></li> 
                    <li><a href="#">Báo cáo doanh thu</a></li>

                    
                </div>

               
        </div>

    </body>
</html>
