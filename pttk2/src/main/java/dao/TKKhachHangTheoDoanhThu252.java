package dao;

import java.text.NumberFormat;
import java.util.Locale;

public class TKKhachHangTheoDoanhThu252 {
    private int idKhachHang; // ID khách hàng
    private String tenKhachHang; // Tên khách hàng
    private float tongHoaDonKhachHang; // Tổng hóa đơn

    // Constructor
    public TKKhachHangTheoDoanhThu252(int idKhachHang, String tenKhachHang, float tongHoaDon) {
        this.idKhachHang = idKhachHang;
        this.tenKhachHang = tenKhachHang;
        this.tongHoaDonKhachHang = tongHoaDon;
    }

    // Getter và Setter
    public int getIdKhachHang() {
        return idKhachHang;
    }

    public void setIdKhachHang(int idKhachHang) {
        this.idKhachHang = idKhachHang;
    }

    public String getTenKhachHang() {
        return tenKhachHang;
    }

    public void setTenKhachHang(String tenKhachHang) {
        this.tenKhachHang = tenKhachHang;
    }

    public float getTongHoaDonKhachHang() {
        return tongHoaDonKhachHang;
    }

    public void setTongHoaDonKhachHang(float tongHoaDon) {
        this.tongHoaDonKhachHang = tongHoaDon;
    }

    // Phương thức định dạng tổng hóa đơn thành dạng tiền Việt Nam
    public String getFormattedTongHoaDonKhachHang() {
        NumberFormat numberFormat = NumberFormat.getInstance(new Locale("vi", "VN"));
        return numberFormat.format(tongHoaDonKhachHang) + " VNĐ"; // Thêm ký hiệu tiền tệ
    }
}
