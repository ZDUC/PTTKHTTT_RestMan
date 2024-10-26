package dao;

public class ComboDuocGoi252 {
    private String tenCombo; // Tên combo
    private double donGia;   // Đơn giá của combo
    private int soLuong;     // Số lượng combo
    private double tamTinh;  // Tạm tính (lấy từ CSDL)

    public ComboDuocGoi252(String tenCombo, double donGia, int soLuong, double tamTinh) {
        this.tenCombo = tenCombo;
        this.donGia = donGia;
        this.soLuong = soLuong;
        this.tamTinh = tamTinh; // Lấy tạm tính từ CSDL
    }

    // Getters và Setters
    public String getTenCombo() {
        return tenCombo;
    }

    public void setTenCombo(String tenCombo) {
        this.tenCombo = tenCombo;
    }

    public double getDonGia() {
        return donGia;
    }

    public void setDonGia(double donGia) {
        this.donGia = donGia;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public double getTamTinh() {
        return tamTinh;
    }
}
