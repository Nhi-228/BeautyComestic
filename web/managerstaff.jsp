<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Quản lý nhân viên</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
            }
            .sidebar {
                height: 100vh;
                background-color: #e0aade;
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
                background-color: #e4edf1;
                padding: 30px;
                height: 100vh;
                overflow-y: auto;
            }
            .collapse a {
                margin-left: 15px;
                font-size: 14px;
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

                        <!-- Dropdown: Quản lý nhân viên -->
                        <li>
                            <a href="#staffDropdown" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="staffDropdown">
                                Quản lý nhân viên ▼
                            </a>
                            <div class="collapse" id="staffDropdown">
                                <a href="addstaff.jsp">+ Thêm nhân viên</a>
                                <a href="showstaff.jsp">+ Xem thông tin nhân viên</a>
                            </div>
                        </li>

                        <!-- Dropdown: Quản lý đơn hàng -->
                        <li>
                            <a href="#orderDropdown" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="orderDropdown">
                                Quản lý đơn hàng ▼
                            </a>
                            <div class="collapse" id="orderDropdown">
                                <a href="orderList.jsp">Danh sách đơn hàng</a>
                                <a href="orderSuccess.jsp">Đơn hàng đã giao thành công</a>
                                <a href="returnOrder.jsp">Trả hàng</a>
                            </div>
                        </li>

                        <li><a href="#">Quản lý khách hàng</a></li>
                        <li><a href="managerProduct.jsp">Quản lý sản phẩm</a></li>
                        <li><a href="#">Báo cáo doanh thu</a></li>
                        <li><a href="logout">Đăng xuất</a></li>
                    </ul>
                </div>

                <!-- Main content bên phải -->
                <div class="col-md-10 main-content">
                    <h3>Trang quản lý nhân viên</h3>
                    <p>Vui lòng chọn một hành động từ menu bên trái.</p>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS để xử lý dropdown -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>