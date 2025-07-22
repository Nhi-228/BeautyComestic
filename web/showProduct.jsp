<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản lý sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .sidebar {
            height: 100vh;
            background-color: #FFB2CD;
            padding: 20px;
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
        .main-content {
            background-color: #fbe8ef;
            padding: 30px;
            height: 100vh;
            overflow-y: auto;
        }
        .table th {
            background-color: #FFDAE6;
            color: #23272b;
            text-align: center;
        }
        .table td {
            background-color: #FFF5F8;
            vertical-align: middle;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar">
            <div class="email-info"><i class="fa-regular fa-user"></i> Email: ${sessionScope.userEmail}</div>
            <ul class="list-unstyled">
                <li><a href="home.jsp"><i class="fa-solid fa-cash-register"></i> Bán hàng</a></li>
                <li><a href="#"><i class="fa-solid fa-sliders"></i> Điều khiển</a></li>
                <li>
                    <a data-bs-toggle="collapse" href="#staffMenu"><i class="fa-solid fa-users"></i> Quản lý nhân viên <i class="fa-solid fa-chevron-down float-end"></i></a>
                    <div class="collapse" id="staffMenu">
                        <a href="addstaff.jsp">Thêm nhân viên</a>
                        <a href="showstaff.jsp">Xem thông tin nhân viên</a>
                    </div>
                </li>
                <li><a href="informationuser.jsp"><i class="fa-solid fa-user-group"></i> Quản lý khách hàng</a></li>
                <li>
                    <a data-bs-toggle="collapse" href="#productMenu"><i class="fa-solid fa-boxes-stacked"></i> Quản lý sản phẩm <i class="fa-solid fa-chevron-down float-end"></i></a>
                    <div class="collapse" id="productMenu">
                        <a href="addproduct.jsp">Tạo mới sản phẩm</a>
                        <a href="addcategory.jsp">Thêm danh mục</a>
                        <a href="addsupplier.jsp">Thêm nhà cung cấp</a>
                        <a href="viewProduct">Danh sách sản phẩm</a>
                    </div>
                </li>
                <li>
                    <a data-bs-toggle="collapse" href="#orderMenu"><i class="fa-solid fa-file-invoice"></i> Quản lý đơn hàng (<c:out value="${totalOrders}" />) <i class="fa-solid fa-chevron-down float-end"></i></a>
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

        <!-- Main Content -->
        <div class="col-md-10 main-content">
           

            <div class="d-flex gap-3 mb-4">
                <input type="text" id="searchInput" class="form-control w-50" placeholder="🔍 Tìm theo tên sản phẩm..." />
                <%
                    java.util.Set<Integer> categorySet = new java.util.HashSet<>();
                    for (Object obj : (java.util.List)request.getAttribute("products")) {
                        model.Product p = (model.Product)obj;
                        if (p.getCategoryId() != 0) categorySet.add(p.getCategoryId());
                    }
                %>
                <select id="categoryFilter" class="form-select w-25">
                    <option value="">-- Tất cả danh mục --</option>
                    <% for (Integer catId : categorySet) { %>
                        <option value="<%=catId%>"><%=catId%></option>
                    <% } %>
                </select>
            </div>

            <h4 class="mt-2">Danh sách sản phẩm</h4>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Mã SP</th>
                        <th>Tên sản phẩm</th>
                        <th>Ảnh</th>
                        <th>Số lượng</th>
                        <th>Tình trạng</th>
                        <th>Giá</th>
                        <th>Danh mục</th>
                        <th>Chức năng</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${products}">
                        <tr class="product-row" data-name="${p.productName}" data-category="${p.categoryId}">
                            <td>${p.productId}</td>
                            <td>${p.productName}</td>
                            <td><img src="${p.imageUrl}" alt="" width="50" /></td>
                            <td>${p.stockQuantity}</td>
                            <td><c:out value="${p.active && p.stockQuantity > 0 ? 'Còn hàng' : 'Hết hàng'}"/></td>
                            <td>${p.price} đ</td>
                            <td>${p.categoryId}</td>
                            <td>
                                <a href="editproduct.jsp?id=${p.productId}" class="btn btn-warning btn-sm">Sửa</a>
                                <a href="deleteproduct?id=${p.productId}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa?');">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const searchInput = document.getElementById("searchInput");
    const categoryFilter = document.getElementById("categoryFilter");

    function filterProducts() {
        const keyword = searchInput.value.toLowerCase();
        const selectedCategory = categoryFilter.value;
        const rows = document.querySelectorAll(".product-row");

        rows.forEach(row => {
            const name = row.dataset.name.toLowerCase();
            const category = row.dataset.category;
            const matchesName = !keyword || name.includes(keyword);
            const matchesCategory = !selectedCategory || category === selectedCategory;
            row.style.display = (matchesName && matchesCategory) ? "" : "none";
        });
    }

    searchInput.addEventListener("input", filterProducts);
    categoryFilter.addEventListener("change", filterProducts);
</script>

</body>
</html>