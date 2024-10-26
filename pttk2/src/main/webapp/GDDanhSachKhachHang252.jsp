<%@page import="java.util.List"%>
<%@page import="dao.TKKhachHangTheoDoanhThu252"%>
<%@page import="dao.TKKhachHangTheoDoanhThu252DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Danh Sách Khách Hàng</title>
    <style>
        /* CSS cho trang danh sách khách hàng */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            max-width: 800px; /* Giới hạn chiều rộng tối đa của trang */
            margin-left: auto; /* Căn giữa trang */
            margin-right: auto; /* Căn giữa trang */
        }
        .container {
            background: white; /* Màu nền cho thẻ chứa */
            padding: 40px; /* Khoảng cách bên trong thẻ chứa */
            border-radius: 8px; /* Bo góc cho thẻ chứa */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Đổ bóng cho thẻ chứa */
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%; /* Giữ cho bảng rộng 100% trong vùng nội dung */
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .no-data {
            text-align: center;
            padding: 20px;
            color: #999;
        }
        a {
            text-decoration: none; /* Bỏ gạch chân */
            color: #007bff; /* Màu chữ cho liên kết */
        }
        a:hover {
            text-decoration: underline; /* Gạch chân khi hover */
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Danh Sách Khách Hàng</h2>
    <table>
        <tr>
            <th>Tên Khách Hàng</th>
            <th>Tổng Hóa Đơn</th>
        </tr>
        <%
            // Nhận tham số từ yêu cầu
            String thoiGianBatDau = request.getParameter("dteThoiGianBatDau");
            String thoiGianKetThuc = request.getParameter("dteThoiGianKetThuc");

            // Kiểm tra xem tham số có hợp lệ không
            if (thoiGianBatDau != null && thoiGianKetThuc != null) {
                TKKhachHangTheoDoanhThu252DAO khDAO = new TKKhachHangTheoDoanhThu252DAO();
                List<TKKhachHangTheoDoanhThu252> list = khDAO.getTKKhachHangTheoDoanhThu(thoiGianBatDau, thoiGianKetThuc);

                if (list != null && !list.isEmpty()) {
                    for (TKKhachHangTheoDoanhThu252 kh : list) {
        %>
        <tr>
            <td>
                <a href="GDDanhSachDonHang252.jsp?id=<%= kh.getIdKhachHang() %>&ten=<%= kh.getTenKhachHang() %>&dteThoiGianBatDau=<%= thoiGianBatDau %>&dteThoiGianKetThuc=<%= thoiGianKetThuc %>">
                    <%= kh.getTenKhachHang() %>
                </a>
            </td>
            <td><%= kh.getFormattedTongHoaDonKhachHang() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="2" class="no-data">Không có dữ liệu để hiển thị.</td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="2" class="no-data">Vui lòng nhập thời gian bắt đầu và kết thúc hợp lệ.</td>
        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>
