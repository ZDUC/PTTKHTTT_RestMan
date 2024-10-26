<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Trang Chính Nhân Viên Quản Lý</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 800px; /* Tăng kích thước chiều rộng */
            margin: 20px auto; /* Căn giữa trang và có khoảng cách phía trên */
        }

        h2 {
            color: #007bff;
            margin-bottom: 30px; /* Tăng khoảng cách dưới tiêu đề */
            font-size: 28px; /* Tăng kích thước chữ tiêu đề */
        }
        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin-bottom: 20px; /* Tăng khoảng cách giữa các mục */
        }

        a {
            display: block;
            background-color: #007bff;
            color: #fff;
            padding: 15px;
            border-radius: 10px;
            text-decoration: none;
            font-size: 18px; /* Tăng kích thước chữ */
            font-weight: bold;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #007bff;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Quản Lý Hệ Thống</h2>
    <ul>
        <li><a href="QuanLiMonAn252.jsp">Quản lý món ăn</a></li>
        <li><a href="LenCombo252.jsp">Lên Combo</a></li>
        <li><a href="GDThongKe252.jsp">Thống kê</a></li>
        <li><a href="DangXuat.jsp">Đăng xuất</a></li>
    </ul>
</div>
</body>
</html>
