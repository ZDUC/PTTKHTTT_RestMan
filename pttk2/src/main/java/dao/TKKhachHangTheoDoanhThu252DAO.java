package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TKKhachHangTheoDoanhThu252DAO extends DAO252 {

    public TKKhachHangTheoDoanhThu252DAO() {
        super(); // Gọi constructor của lớp cha để thiết lập kết nối
    }

    /**
     * Phương thức lấy thông tin khách hàng theo doanh thu trong khoảng thời gian cho trước.
     *
     * @param thoiGianBatDau Thời gian bắt đầu
     * @param thoiGianKetThuc Thời gian kết thúc
     * @return danh sách thông tin khách hàng theo doanh thu
     */
    public List<TKKhachHangTheoDoanhThu252> getTKKhachHangTheoDoanhThu(String thoiGianBatDau, String thoiGianKetThuc) {
        List<TKKhachHangTheoDoanhThu252> resultList = new ArrayList<>();

        // Câu truy vấn lấy thông tin khách hàng theo doanh thu
        String query = "SELECT kh.id AS idKhachHang, kh.hovaten, SUM(h.tonghoadon) AS tonghoadonkhachhang " +
                "FROM hoadon252 h " +
                "JOIN khachhang252 kh ON h.idkhachhang252 = kh.id " +
                "WHERE h.ngay >= ? AND h.ngay <= ? " +
                "GROUP BY kh.id, kh.hovaten";

        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, thoiGianBatDau); // Thiết lập thời gian bắt đầu
            ps.setString(2, thoiGianKetThuc); // Thiết lập thời gian kết thúc

            // Thực hiện truy vấn và nhận kết quả
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                // Tạo đối tượng TKKhachHangTheoDoanhThu252 từ kết quả truy vấn
                TKKhachHangTheoDoanhThu252 tk = new TKKhachHangTheoDoanhThu252(
                        rs.getInt("idKhachHang"),       // Lấy ID khách hàng
                        rs.getString("hovaten"),        // Lấy họ tên khách hàng
                        rs.getFloat("tonghoadonkhachhang") // Lấy tổng hóa đơn
                );
                resultList.add(tk); // Thêm vào danh sách kết quả
            }
        } catch (Exception e) {
            e.printStackTrace(); // In ra lỗi nếu có
        }
        return resultList; // Trả về danh sách kết quả
    }
}
