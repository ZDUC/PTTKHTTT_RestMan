package dao;
import java.util.List;
import java.util.ArrayList;
import java.util.stream.Collectors;
public class MonAn252DAO {
    // Phương thức để tìm danh sách món ăn theo từ khóa
    public List<MonAn252> getDanhSachMonAnTheoTuKhoa(String tuKhoa) {
        // Lấy danh sách tất cả món ăn từ file JSON thông qua lớp DAO252
        List<MonAn252> danhSachMonAn = DAO252.con();
        if (danhSachMonAn != null && !danhSachMonAn.isEmpty()) {
            // Lọc danh sách món ăn dựa trên từ khóa
            return danhSachMonAn.stream()
                    .filter(monAn -> monAn.getTenMonAn().toLowerCase().contains(tuKhoa.toLowerCase()))
                    .collect(Collectors.toList());
        }
        return new ArrayList<>(); // Trả về danh sách rỗng nếu không có món ăn nào phù hợp
    }
    public MonAn252 getThongTinChiTietMonAn(int id) {
        // Lấy danh sách món ăn từ file JSON thông qua lớp DAO252
        List<MonAn252> danhSachMonAn = DAO252.con();
        if (danhSachMonAn != null) {
            // Tìm món ăn theo ID
            for (MonAn252 monAn : danhSachMonAn) {
                if (Integer.parseInt(monAn.getId()) == id) {
                    return monAn; // Trả về món ăn có ID phù hợp
                }
            }
        }
        return null; // Trả về null nếu không tìm thấy món ăn
    }
}