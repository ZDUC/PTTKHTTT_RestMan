<%@page import="java.util.List"%>
<%@page import="dao.HoaDon252"%>
<%@page import="dao.HoaDon252DAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setContentType("text/html; charset=UTF-8");
%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Đơn Hàng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }
        .container {
            background-color: #fff; /* Màu nền cho thẻ div */
            padding: 40px; /* Khoảng cách bên trong */
            border-radius: 8px; /* Bo góc cho thẻ div */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Đổ bóng */
        }
        h2 {
            color: #333;
            text-align: center;
        }
        h3 {
            text-align: center;
            color: #007bff;
            font-size: 1.5em;
            margin: 10px 0;
            font-weight: bold;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #ddd;
        }
        .no-data {
            color: #ff0000;
            font-weight: bold;
        }
        .currency {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Danh Sách Đơn Hàng</h2>
    <%
        String tenKhachHang = request.getParameter("ten");
        if (tenKhachHang != null) {
    %>
    <h3><%= tenKhachHang %></h3>
    <%
        }
    %>
    <table>
        <tr>
            <th>Ngày</th>
            <th>Thời Gian</th>
            <th>Hóa Đơn</th>
        </tr>
        <%
            try {
                String khachHangIdStr = request.getParameter("id");
                String thoiGianBatDauStr = request.getParameter("dteThoiGianBatDau");
                String thoiGianKetThucStr = request.getParameter("dteThoiGianKetThuc");

                int khachHangId = Integer.parseInt(khachHangIdStr);
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

                Date thoiGianBatDau = dateFormat.parse(thoiGianBatDauStr);
                Date thoiGianKetThuc = dateFormat.parse(thoiGianKetThucStr);

                HoaDon252DAO hoaDonDAO = new HoaDon252DAO();
                List<HoaDon252> danhSachDonHang = hoaDonDAO.getDanhSachDonHang(khachHangId, thoiGianBatDau, thoiGianKetThuc);

                DecimalFormatSymbols decimalFormatSymbols = new DecimalFormatSymbols();
                decimalFormatSymbols.setGroupingSeparator('.');

                NumberFormat currencyFormat = NumberFormat.getInstance();
                currencyFormat.setGroupingUsed(true);
                currencyFormat.setMinimumFractionDigits(0);
                ((java.text.DecimalFormat) currencyFormat).setDecimalFormatSymbols(decimalFormatSymbols);

                if (danhSachDonHang != null && !danhSachDonHang.isEmpty()) {
                    for (HoaDon252 hoaDon : danhSachDonHang) {
        %>
        <tr style="cursor: pointer;" onclick="window.location.href='GDChiTietDonHang252.jsp?id=<%= hoaDon.getId() %>&ten=<%=tenKhachHang%>'">
            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(hoaDon.getNgay()) %></td>
            <td><%= new SimpleDateFormat("HH:mm:ss").format(hoaDon.getThoigian()) %></td>
            <td class="currency"><%= currencyFormat.format(hoaDon.getTonghoadon()) + " VNĐ" %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="3" class="no-data">Không có đơn hàng nào trong khoảng thời gian đã chọn.</td>
        </tr>
        <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        %>
        <tr>
            <td colspan="3" class="no-data">Đã xảy ra lỗi khi lấy danh sách đơn hàng.</td>
        </tr>
        <%
            }
        %>
    </table>
</div>
</body>
</html>
