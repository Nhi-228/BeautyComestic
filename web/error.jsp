<%@ page isErrorPage="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<h1>Lỗi khi thêm sản phẩm!</h1>
<pre>
<%= exception != null ? exception.getMessage() : "Không có thông tin lỗi!" %>
</pre>