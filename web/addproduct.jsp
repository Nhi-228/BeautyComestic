<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm sản phẩm</title>
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
                    <h2>Thêm sản phẩm mới</h2>
                    <form action="product" method="post" enctype="multipart/form-data">
                        <input type="text" name="product_id" class="form-control" placeholder="Mã sản phẩm" required>
                        <input type="text" name="name" class="form-control" placeholder="Tên sản phẩm" required>
                        <input type="number" name="quantity" class="form-control" placeholder="Số lượng" required>

                        <select name="category" class="form-select" required>
                            <option value="">-- Chọn danh mục --</option>
                            <option value="1">Makeup</option>
                            <option value="2">Skincare</option>
                            <option value="2">Haircare</option>
                        </select>

                        <select name="supplier" class="form-select" required>
                            <option value="">-- Chọn nhà cung cấp --</option>
                            <option value="1">ABC</option>
                            <option value="2">XYZ</option>
                        </select>

                        <input type="number" name="price" class="form-control" placeholder="Giá bán" step="0.01" required>
                        <input type="number" name="cost" class="form-control" placeholder="Giá vốn" step="0.01" required>

                        <label>Ảnh sản phẩm:</label>
                        <input type="file" name="image" class="form-control" required>

                        <textarea name="description" class="form-control" placeholder="Mô tả sản phẩm" required></textarea>

                        <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>


