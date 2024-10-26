<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Thống Kê</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f9fc;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Thay đổi từ center sang flex-start để căn trên cùng */
            height: 100vh;
        }

        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 600px; /* Tăng chiều rộng */
            text-align: center;
            margin-top: 20px; /* Thêm khoảng cách từ trên xuống */
        }

        h2 {
            color: #007bff;
            margin-bottom: 20px;
            font-size: 24px; /* Tăng kích thước font của tiêu đề */
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin-bottom: 15px;
        }

        a {
            display: block;
            background-color: #007bff;
            color: white;
            padding: 15px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 18px; /* Tăng kích thước font cho liên kết */
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
    <h2>Thống Kê</h2>
    <ul>
        <li><a href="TKMonAnTheoDoanhThu.jsp">Thống Kê Món Ăn Theo Doanh Thu</a></li>
        <li><a href="GDChonThoiGianThongKe252.jsp">Thống Kê Khách Hàng Theo Doanh Thu</a></li>
        <li><a href="TKNhaCungCapTheoSoLuong.jsp">Thống Kê Nhà Cung Cấp Theo Số Lượng Hàng Nhập</a></li>
        <li><a href="TKNguyenLieu.jsp">Thống Kê Nguyên Liệu</a></li>
    </ul>
</div>
</body>
</html>
