package dao;

public class MonAnDuocGoi252 {
    private String tenMonAn; // Tên món ăn
    private double donGia;   // Đơn giá món ăn
    private int soLuong;     // Số lượng món ăn
    private double tamTinh;  // Tạm tính (lấy từ CSDL)

    public MonAnDuocGoi252(String tenMonAn, double donGia, int soLuong, double tamTinh) {
        this.tenMonAn = tenMonAn;
        this.donGia = donGia;
        this.soLuong = soLuong;
        this.tamTinh = tamTinh; // Lấy tạm tính từ CSDL
    }

    // Getters và Setters
    public String getTenMonAn() {
        return tenMonAn;
    }

    public void setTenMonAn(String tenMonAn) {
        this.tenMonAn = tenMonAn;
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

