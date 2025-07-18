<%-- 
    Document   : addstaff
    Created on : Jul 18, 2025, 2:23:52 PM
    Author     : BINH NHI
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Nhân Viên</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
 <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addStaffModal">
        Thêm nhân viên
    </button>
<!-- Modal thêm nhân viên -->
<div class="modal fade" id="addStaffModal" tabindex="-1" aria-labelledby="addStaffModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form action="addstaff" method="post" class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addStaffModalLabel">Thêm Nhân Viên</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
      </div>
      <div class="modal-body">
        
        <div class="mb-3">
          <label for="username" class="form-label">Username</label>
          <input type="text" class="form-control" name="username" required>
        </div>

        <div class="mb-3">
          <label for="email" class="form-label">Email</label>
          <input type="email" class="form-control" name="email" required>
        </div>

        <div class="mb-3">
          <label for="full_name" class="form-label">Họ tên</label>
          <input type="text" class="form-control" name="full_name" required>
        </div>

        <div class="mb-3">
          <label for="phone" class="form-label">Số điện thoại</label>
          <input type="text" class="form-control" name="phone" required>
        </div>

        <div class="mb-3">
          <label for="address" class="form-label">Địa chỉ</label>
          <input type="text" class="form-control" name="address" required>
        </div>

        <div class="mb-3">
          <label for="role" class="form-label">Vai trò</label>
          <select class="form-select" name="role" required>
            <option value="staff">Nhân viên</option>
            <option value="admin">Quản trị</option>
          </select>
        </div>

        <div class="mb-3">
          <label for="password" class="form-label">Mật khẩu</label>
          <input type="password" class="form-control" name="password" required>
        </div>

        <div class="mb-3">
          <label for="updated_at" class="form-label">Ngày cập nhật</label>
          <input type="date" class="form-control" name="updated_at" value="<%= LocalDate.now() %>" required>
        </div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
        <button type="submit" class="btn btn-primary">Lưu nhân viên</button>
      </div>
    </form>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
