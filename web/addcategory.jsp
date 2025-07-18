<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dao.CategoryDao,model.Category" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm danh mục sản phẩm</title>
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
        .form-container {
            width: 100%;
            max-width: 500px;
            margin: auto;
            background: #ffffff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        textarea {
            height: 100px;
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

            <!-- Nội dung chính bên phải -->
            <div class="col-md-10 main-content">
                <h2 class="text-center mb-4">Thêm danh mục sản phẩm</h2>

                <div class="form-container">
                    <form action="add-category" method="post">
                        <label for="categoryName">Tên danh mục:</label>
                        <input type="text" name="categoryName" class="form-control" required>

                        <label for="description">Mô tả:</label>
                        <textarea name="description" class="form-control"></textarea>

                        <label for="imageUrl">Link ảnh:</label>
                        <input type="text" name="imageUrl" class="form-control">

                        <label for="parentCategoryId">Danh mục cha (ID):</label>
                        <input type="text" name="parentCategoryId" class="form-control" placeholder="Có thể để trống nếu là danh mục gốc">

                        <label for="isActive">Trạng thái:</label>
                        <select name="isActive" class="form-select">
                            <option value="1">Kích hoạt</option>
                            <option value="0">Không kích hoạt</option>
                        </select>

                        <div class="text-center mt-3">
                            <input type="submit" value="Thêm danh mục" class="btn btn-success">
                        </div>
                    </form>

                    <% if (request.getParameter("msg") != null) { %>
                        <p class="text-center mt-3" style="color: <%= "success".equals(request.getParameter("msg")) ? "green" : "red" %>;">
                            <%= "success".equals(request.getParameter("msg")) ? "Thêm danh mục thành công!" : "Có lỗi xảy ra!" %>
                        </p>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
