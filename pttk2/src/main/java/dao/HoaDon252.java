package dao;

import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class HoaDon252 {
    private int id;
    private Date ngay;
    private Time thoigian;
    private double tonghoadon;
    private int idkhachhang;
    private List<MonAnDuocGoi252> monAnList; // Danh sách món ăn
    private List<ComboDuocGoi252> comboList; // Danh sách combo

    public HoaDon252(int id, Date ngay, Time thoigian, double tonghoadon, int idkhachhang) {
        this.id = id;
        this.ngay = ngay;
        this.thoigian = thoigian;
        this.tonghoadon = tonghoadon;
        this.idkhachhang = idkhachhang;
        this.monAnList = new ArrayList<>(); // Khởi tạo danh sách món ăn
        this.comboList = new ArrayList<>();  // Khởi tạo danh sách combo
    }

    // Getters và Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getNgay() {
        return ngay;
    }

    public void setNgay(Date ngay) {
        this.ngay = ngay;
    }

    public Time getThoigian() {
        return thoigian;
    }

    public void setThoigian(Time thoigian) {
        this.thoigian = thoigian;
    }

    public double getTonghoadon() {
        return tonghoadon;
    }

    public void setTonghoadon(double tonghoadon) {
        this.tonghoadon = tonghoadon;
    }

    public int getIdkhachhang() {
        return idkhachhang;
    }

    public void setIdkhachhang(int idkhachhang) {
        this.idkhachhang = idkhachhang;
    }

    public List<MonAnDuocGoi252> getMonAnList() {
        return monAnList;
    }

    // Phương thức setMonAn để thiết lập danh sách món ăn
    public void setMonAn(List<MonAnDuocGoi252> monAnList) {
        this.monAnList = monAnList;
    }

    public List<ComboDuocGoi252> getComboList() {
        return comboList;
    }

    // Phương thức setCombo để thiết lập danh sách combo
    public void setCombo(List<ComboDuocGoi252> comboList) {
        this.comboList = comboList;
    }
}
