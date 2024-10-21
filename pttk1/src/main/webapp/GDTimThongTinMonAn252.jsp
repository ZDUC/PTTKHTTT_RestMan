<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="dao.MonAn252DAO" %>
<%@ page import="dao.MonAn252" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tìm Thông Tin Món Ăn của nhà hàng Zeros</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f4f7fc;
      margin: 0;
      padding: 0;
      color: #333;
    }

    h1 {
      text-align: center;
      color: #007BFF;
      font-size: 3em;
      margin-top: 30px;
    }

    .header {
      text-align: center;
      margin-bottom: 30px;
    }

    .header a {
      margin: 0 20px;
      text-decoration: none;
      color: #007BFF;
      font-size: 1.2em;
      padding: 10px 15px;
      border-radius: 5px;
      transition: background-color 0.3s, color 0.3s;
    }
    .header a:hover {
      background-color: #007BFF;
      color: white;
    }
    form {
      text-align: center;
      margin-bottom: 40px;
    }

    input[type="text"] {
      padding: 15px;
      width: 300px;
      border-radius: 10px;
      border: 1px solid #ccc;
      font-size: 1.2em;
      transition: border-color 0.3s;
    }

    input[type="text"]:focus {
      border-color: #007BFF; /* Thay đổi màu viền khi input được chọn */
      outline: none; /* Xóa outline */
    }

    input[type="submit"] {
      padding: 15px 30px;
      border-radius: 10px;
      border: none;
      background-color: #007BFF;
      color: white;
      font-size: 1.2em;
      cursor: pointer;
      transition: background-color 0.3s, transform 0.2s;
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
      transform: translateY(-2px); /* Hiệu ứng nâng nút khi hover */
    }

    table {
      width: 100%;
      max-width: 1200px;
      margin: 0 auto;
      border-collapse: collapse;
      background-color: white;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
      margin-top: 20px; /* Khoảng cách giữa bảng và các phần tử khác */
    }

    th, td {
      padding: 20px;
      text-align: left;
      border: 1px solid #ccc;
      font-size: 1.1em;
    }

    th {
      background-color: #007BFF;
      color: white;
      font-size: 1.2em;
    }

    td a {
      color: #007BFF;
      text-decoration: none;
      transition: color 0.3s;
    }
    td a:hover {
      color: #0056b3;
    }
    p {
      text-align: center;
      font-size: 1.3em;
      margin-top: 30px;
    }
  </style>
</head>
<body>
<div class="header">
  <h1>Tìm kiếm món ăn của nhà hàng Zeros</h1>
  <a href="GDTrangChinhKhachHang252.jsp">Trang Chủ</a>
  <a href="#">Đặt Bàn</a>
  <a href="#">Đặt Món Trực Tuyến</a>
  <a href="#">Đăng Xuất</a>
</div>
<!-- Form tìm kiếm -->
<form method="post" action="GDTimThongTinMonAn252.jsp">
  <input type="text" name="tukhoa" required/><br><br>
  <input type="submit" name="btnTimKiem" value="Tìm Kiếm"/>
</form>
<!-- Hiển thị kết quả tìm kiếm -->
<%
  String tukhoa = request.getParameter("tukhoa");
  if (tukhoa != null && !tukhoa.isEmpty()) {
    MonAn252DAO dao = new MonAn252DAO();
    List<MonAn252> danhSachMonAn = dao.getDanhSachMonAnTheoTuKhoa(tukhoa);

    if (danhSachMonAn != null && !danhSachMonAn.isEmpty()) {
%>
<table>
  <tr>
    <th>Tên Món Ăn</th>
  </tr>
  <%
    for (MonAn252 monAn : danhSachMonAn) {
  %>
  <tr>
    <td><a href="GDThongTinChiTietMonAn252.jsp?id=<%= monAn.getId() %>"><%= monAn.getTenMonAn() %></a></td>
  </tr>
  <%
    }
  %>
</table>
<%
    } else {
      out.println("<p>Nhà hàng Zeros hiện không có món ăn này, quý khách vui lòng tìm kiếm một món ăn khác nhen!</p>");
    }
  } else {
    out.println("<p>Vui lòng nhập từ khóa món ăn quý khách cần tìm kiếm.</p>");
  }
%>
</body>
</html>
