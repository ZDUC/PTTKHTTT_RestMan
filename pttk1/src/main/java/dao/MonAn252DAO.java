package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class MonAn252DAO {
    // Phương thức để tìm danh sách món ăn theo từ khóa
    public List<MonAn252> getDanhSachMonAnTheoTuKhoa(String tuKhoa) {
        List<MonAn252> monAnList = new ArrayList<>();
        String query = "SELECT id, tenMonAn, giaMonAn, moTa FROM monan252 WHERE tenMonAn LIKE ?";

        try (Connection connection = DAO252.con();
             PreparedStatement statement = connection.prepareStatement(query)) {

            // Thiết lập giá trị cho tham số tìm kiếm với ký tự đại diện %
            statement.setString(1, "%" + tuKhoa + "%");

            try (ResultSet resultSet = statement.executeQuery()) {
                NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));

                while (resultSet.next()) {
                    MonAn252 monAn = new MonAn252();
                    monAn.setId(String.valueOf(resultSet.getInt("id")));
                    monAn.setTenMonAn(resultSet.getString("tenMonAn"));

                    // Định dạng giá tiền Việt Nam
                    double gia = resultSet.getDouble("giaMonAn");
                    String giaFormatted = formatter.format(Math.round(gia));
                    monAn.setGiaMonAn(giaFormatted);

                    monAn.setMoTa(resultSet.getString("moTa"));
                    monAnList.add(monAn);
                }
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi truy xuất dữ liệu món ăn: " + e.getMessage());
        }

        return monAnList;
    }
}
