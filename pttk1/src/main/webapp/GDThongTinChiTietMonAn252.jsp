<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MonAn252DAO" %>
<%@ page import="dao.MonAn252" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông Tin Chi Tiết Món Ăn</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #007BFF;
            font-size: 3em;
            margin-top: 30px;
        }

        .details {
            max-width: 800px;
            margin: 40px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .details:hover {
            transform: scale(1.02); /* Hiệu ứng phóng to khi hover */
        }

        p {
            font-size: 1.3em;
            margin-bottom: 20px;
            line-height: 1.6; /* Tăng khoảng cách giữa các dòng */
        }

        .back-button {
            display: block;
            text-align: center;
            margin-top: 20px;
        }

        .back-button input[type="submit"] {
            padding: 10px 30px;
            border-radius: 5px;
            border: none;
            background-color: #007BFF;
            color: white;
            font-size: 1.2em;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        .back-button input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05); /* Hiệu ứng phóng to khi hover */
        }
        
        .details h2 {
            text-align: center;
            font-size: 2em;
            color: #333;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<h1>Thông Tin Chi Tiết Món Ăn</h1>

<div class="details">
    <%
        String idMonAnStr = request.getParameter("id"); // Lấy ID món ăn từ request
        if (idMonAnStr != null) {
            try {
                int idMonAn = Integer.parseInt(idMonAnStr);
                MonAn252DAO dao = new MonAn252DAO();
                MonAn252 monAn = dao.getThongTinChiTietMonAn(idMonAn);

                if (monAn != null) {
    %>
    <h2><%= monAn.getTenMonAn() %></h2>
    <p><strong>Giá:</strong> <%= monAn.getGiaMonAn() %> VNĐ</p>
    <p><strong>Mô Tả:</strong> <%= monAn.getMoTa() %></p>
    <%
                } else {
                    out.println("<p>Không tìm thấy thông tin món ăn.</p>");
                }
            } catch (NumberFormatException e) {
                out.println("<p>ID món ăn không hợp lệ.</p>");
            }
        } else {
            out.println("<p>ID món ăn không hợp lệ.</p>");
        }
    %>

    <!-- Nút trở về -->
    <div class="back-button">
        <form action="GDTrangChinhKhachHang252.jsp">
            <input type="submit" value="Trở về"/>
        </form>
    </div>
</div>
</body>
</html>
