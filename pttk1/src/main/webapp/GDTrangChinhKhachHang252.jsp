<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giao Diện Chính Khách Hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 20px;
            color: #333;
        }
        h1 {
            text-align: center;
            color: #007BFF;
        }
        a {
            display: block;
            margin: 15px auto;
            text-align: center;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: #007BFF;
            color: white;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #0056b3;
        }
        .container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Chào mừng đến với nhà hàng</h1>

    <!-- Liên kết đến các chức năng -->
    <a href="GDTimThongTinMonAn252.jsp">Tìm Thông Tin Món Ăn</a>
    <a href="#">Đặt Bàn</a>
    <a href="#">Đặt Món Ăn</a>
    <a href="#">Đăng Xuất</a>
</div>
</body>
</html>
