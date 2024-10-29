<%@page import="dao.HoaDon252" %>
    <%@page import="dao.HoaDon252DAO" %>
        <%@page import="dao.MonAnDuocGoi252" %>
            <%@page import="dao.ComboDuocGoi252" %>
                <%@page import="java.text.SimpleDateFormat" %>
                    <%@page contentType="text/html" pageEncoding="UTF-8" %>
                        <html>

                        <head>
                            <title>Chi Tiết Đơn Hàng</title>
                            <style>
                                body {
                                    font-family: Arial, sans-serif;
                                    background-color: #f9f9f9;
                                    margin: 0;
                                    padding: 20px;
                                    max-width: 800px;
                                    margin-left: auto;
                                    margin-right: auto;
                                }

                                h2 {
                                    color: #007bff;
                                    text-align: center;
                                    font-weight: bold;
                                }

                                p {
                                    text-align: center;
                                    font-size: 18px;
                                    color: #333;
                                    font-weight: bold;
                                    margin: 10px 0;
                                }

                                .order-details {
                                    background-color: #fff;
                                    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                                    padding: 20px;
                                    border-radius: 5px;
                                }

                                table {
                                    width: 100%;
                                    border-collapse: collapse;
                                    margin-top: 20px;
                                    text-align: center;
                                    font-weight: bold;
                                    font-size: 18px;
                                }

                                table,
                                th,
                                td {
                                    border: 1px solid #ccc;
                                }

                                th,
                                td {
                                    padding: 15px;
                                }

                                th {
                                    background-color: #007bff;
                                    color: white;
                                }

                                td {
                                    color: #555;
                                }

                                .total {
                                    font-size: 20px;
                                    font-weight: bold;
                                    color: #d9534f;
                                    margin-top: 20px;
                                    background-color: #f2f2f2;
                                }

                                .back-link-container {
                                    text-align: center;
                                    margin-top: 20px;
                                }

                                .back-link {
                                    display: inline-block;
                                    padding: 10px 15px;
                                    background-color: #007bff;
                                    color: white;
                                    text-decoration: none;
                                    border-radius: 5px;
                                    font-weight: bold;
                                }

                                .back-link:hover {
                                    background-color: #0056b3;
                                }
                            </style>
                        </head>

                        <body>
                            <div class="order-details">
                                <h2>Chi Tiết Đơn Hàng</h2>
                                <% int id=Integer.parseInt(request.getParameter("id")); String
                                    tenKhachHang=request.getParameter("ten"); HoaDon252DAO hoaDonDAO=new HoaDon252DAO();
                                    HoaDon252 hoaDon=hoaDonDAO.getHoaDonChiTietDonHang(id); if (hoaDon !=null) { %>
                                    <p>Tên khách hàng: <%= tenKhachHang %>
                                    </p>
                                    <p>Ngày: <%= new SimpleDateFormat("dd/MM/yyyy").format(hoaDon.getNgay()) %>
                                    </p>
                                    <p>Thời gian: <%= hoaDon.getThoigian() %>
                                    </p>

                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Tên Món Ăn/Combo</th>
                                                <th>Đơn Giá</th>
                                                <th>Số Lượng</th>
                                                <th>Tạm Tính</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (MonAnDuocGoi252 monAn : hoaDon.getMonAnList()) { %>
                                                <tr>
                                                    <td>
                                                        <%= monAn.getTenMonAn() %>
                                                    </td>
                                                    <td>
                                                        <%= String.format("%,.0f VNĐ", monAn.getDonGia()) %>
                                                    </td>
                                                    <td>
                                                        <%= monAn.getSoLuong() %>
                                                    </td>
                                                    <td>
                                                        <%= String.format("%,.0f VNĐ", monAn.getTamTinh()) %>
                                                    </td>
                                                </tr>
                                                <% } for (ComboDuocGoi252 combo : hoaDon.getComboList()) { %>
                                                    <tr>
                                                        <td>
                                                            <%= combo.getTenCombo() %>
                                                        </td>
                                                        <td>
                                                            <%= String.format("%,.0f VNĐ", combo.getDonGia()) %>
                                                        </td>
                                                        <td>
                                                            <%= combo.getSoLuong() %>
                                                        </td>
                                                        <td>
                                                            <%= String.format("%,.0f VNĐ", combo.getTamTinh()) %>
                                                        </td>
                                                    </tr>
                                                    <% } %>
                                                        <tr class="total">
                                                            <td colspan="3"><strong>Tổng Hóa Đơn:</strong></td>
                                                            <td>
                                                                <%= String.format("%,.0f VNĐ", hoaDon.getTonghoadon())
                                                                    %>
                                                            </td>
                                                        </tr>
                                        </tbody>
                                    </table>

                                    <div class="back-link-container">
                                        <a href="GDTrangChinhNhanVienQuanLi252.jsp" class="back-link">Quay lại trang
                                            chủ</a>
                                    </div>
                                    <% } else { %>
                                        <p>Không tìm thấy thông tin hóa đơn.</p>
                                        <div class="back-link-container">
                                            <a href="GDTrangChinhNhanVienQuanLiQuanLi252.jsp" class="back-link">Quay lại
                                                trang chủ</a>
                                        </div>
                                        <% } %>
                            </div>
                        </body>

                        </html>