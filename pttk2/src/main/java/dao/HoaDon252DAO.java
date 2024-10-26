package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class HoaDon252DAO extends DAO252 {

    public HoaDon252DAO() {
        super();
    }

    public List<HoaDon252> getDanhSachDonHang(int idKhachHang, Date thoiGianBatDau, Date thoiGianKetThuc) {
        List<HoaDon252> danhSach = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM hoadon252 WHERE idkhachhang252 = ? AND ngay BETWEEN ? AND ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, idKhachHang);

            // Kiểm tra null trước khi thiết lập giá trị
            if (thoiGianBatDau != null && thoiGianKetThuc != null) {
                ps.setDate(2, new java.sql.Date(thoiGianBatDau.getTime()));
                ps.setDate(3, new java.sql.Date(thoiGianKetThuc.getTime()));

                rs = ps.executeQuery();

                while (rs.next()) {
                    HoaDon252 hoaDon = new HoaDon252(
                            rs.getInt("id"),
                            rs.getDate("ngay"),
                            rs.getTime("thoigian"),
                            rs.getDouble("tonghoadon"),
                            rs.getInt("idkhachhang252") // Chú ý đến trường idkhachhang252
                    );
                    danhSach.add(hoaDon);
                }
            } else {
                System.err.println("Thời gian bắt đầu hoặc thời gian kết thúc không hợp lệ.");
            }
        } catch (Exception e) {
            System.err.println("Lỗi khi lấy danh sách đơn hàng: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Đóng ResultSet và PreparedStatement
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (Exception e) {
                System.err.println("Lỗi khi đóng tài nguyên: " + e.getMessage());
            }
        }
        return danhSach;
    }
    public HoaDon252 getHoaDonChiTietDonHang(int id) {
        HoaDon252 hoaDon = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<MonAnDuocGoi252> monAnList = new ArrayList<>();
        List<ComboDuocGoi252> comboList = new ArrayList<>();

        try {
            // Lấy thông tin hóa đơn
            String query = "SELECT * FROM hoadon252 WHERE id = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                hoaDon = new HoaDon252(
                        rs.getInt("id"),
                        rs.getDate("ngay"),
                        rs.getTime("thoigian"),
                        rs.getDouble("tonghoadon"),
                        rs.getInt("idkhachhang252")
                );

                // Lấy danh sách món ăn từ hóa đơn
                String queryMonAn = "SELECT * FROM monanduocgoi WHERE id_hoadon = ?";
                try (PreparedStatement psMonAn = con.prepareStatement(queryMonAn)) {
                    psMonAn.setInt(1, id);
                    try (ResultSet rsMonAn = psMonAn.executeQuery()) {
                        while (rsMonAn.next()) {
                            MonAnDuocGoi252 monAn = new MonAnDuocGoi252(
                                    rsMonAn.getString("ten_mon_an"), // Sử dụng tên cột đúng
                                    rsMonAn.getDouble("don_gia"),
                                    rsMonAn.getInt("so_luong"),
                                    rsMonAn.getDouble("tam_tinh")
                            );
                            monAnList.add(monAn);
                        }
                    }
                }
                hoaDon.setMonAn(monAnList);

                // Lấy danh sách combo từ hóa đơn
                String queryCombo = "SELECT * FROM comboduocgoi WHERE id_hoadon = ?";
                try (PreparedStatement psCombo = con.prepareStatement(queryCombo)) {
                    psCombo.setInt(1, id);
                    try (ResultSet rsCombo = psCombo.executeQuery()) {
                        while (rsCombo.next()) {
                            ComboDuocGoi252 combo = new ComboDuocGoi252(
                                    rsCombo.getString("ten_mon_an"), // Sử dụng tên cột đúng
                                    rsCombo.getDouble("don_gia"),
                                    rsCombo.getInt("so_luong"),
                                    rsCombo.getDouble("tam_tinh")
                            );
                            comboList.add(combo);
                        }
                    }
                }
                hoaDon.setCombo(comboList);
            }
        } catch (Exception e) {
            System.err.println("Lỗi khi lấy chi tiết hóa đơn: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Đóng ResultSet và PreparedStatement
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (Exception e) {
                System.err.println("Lỗi khi đóng tài nguyên: " + e.getMessage());
            }
        }
        return hoaDon;
    }

}
