<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Chọn Thời Gian Thống Kê</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; /* Chọn font chữ hiện đại và dễ đọc */
            margin: 0; /* Xóa margin mặc định */
            padding: 0; /* Xóa padding mặc định */
            background-color: #f0f0f0; /* Màu nền nhẹ nhàng */
        }
        .container {
            display: flex; /* Sử dụng flexbox để căn giữa nội dung */
            flex-direction: column; /* Đặt chiều dọc cho flexbox */
            align-items: center; /* Căn giữa theo chiều ngang */
            margin-top: 50px; /* Khoảng cách từ đầu trang */
        }
        form {
            background-color: white; /* Màu nền cho form */
            padding: 50px; /* Khoảng cách bên trong form */
            border-radius: 10px; /* Bo góc cho form */
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1); /* Đổ bóng cho form */
            width: 450px; /* Chiều rộng của form */
            text-align: center; /* Căn giữa nội dung trong form */
        }
        h2 {
            margin-bottom: 30px; /* Khoảng cách giữa tiêu đề và form */
            font-weight: bold; /* Chữ đậm cho tiêu đề */
            font-size: 28px; /* Kích thước chữ cho tiêu đề */
            color: #333; /* Màu chữ cho tiêu đề */
        }
        label {
            display: block; /* Hiển thị label dưới dạng khối */
            margin-bottom: 8px; /* Khoảng cách giữa label và input */
            color: #555; /* Màu chữ cho label */
        }
        input[type="date"] {
            width: 100%; /* Chiều rộng đầy đủ */
            padding: 12px; /* Khoảng cách bên trong input */
            margin: 10px 0; /* Khoảng cách trên và dưới input */
            border: 1px solid #ccc; /* Đường viền cho input */
            border-radius: 4px; /* Bo góc cho input */
            font-size: 16px; /* Kích thước chữ cho input */
            box-sizing: border-box; /* Bao gồm padding và border trong width */
        }
        input[type="submit"] {
            width: 100%; /* Chiều rộng đầy đủ */
            padding: 12px; /* Khoảng cách bên trong nút submit */
            background-color: #007bff; /* Màu nền cho nút submit */
            color: white; /* Màu chữ cho nút submit */
            font-size: 16px; /* Kích thước chữ cho nút submit */
            font-weight: bold; /* Chữ đậm cho nút submit */
            border: none; /* Xóa đường viền cho nút submit */
            border-radius: 4px; /* Bo góc cho nút submit */
            cursor: pointer; /* Con trỏ chuột khi di chuột qua nút submit */
            transition: background-color 0.3s; /* Hiệu ứng chuyển đổi cho nút */
            margin-top: 40px; /* Thêm khoảng cách trên nút submit */
            /* Đặt chiều rộng theo % nếu muốn dãn ra hơn nữa */
            /* width: calc(100% + 20px);  // Ví dụ dãn ra thêm 20px */
        }
        input[type="submit"]:hover {
            background-color: #007bff; /* Màu nền khi di chuột qua nút submit */
        }
    </style>
</head>
<body>
<div class="container">
    <form action="GDDanhSachKhachHang252.jsp" method="post">
        <h2>Chọn Thời Gian Thống Kê</h2>

        <label for="dteThoiGianBatDau">Chọn thời gian bắt đầu:</label>
        <input type="date" id="dteThoiGianBatDau" name="dteThoiGianBatDau" required
               min="2023-01-01" max="2024-12-31" /> <!-- Thêm min và max nếu cần -->

        <label for="dteThoiGianKetThuc">Chọn thời gian kết thúc:</label>
        <input type="date" id="dteThoiGianKetThuc" name="dteThoiGianKetThuc" required
               min="2023-01-01" max="2024-12-31" /> <!-- Thêm min và max nếu cần -->

        <input type="submit" value="Xem Thống Kê Khách Hàng">
    </form>
</div>
</body>
</html>
