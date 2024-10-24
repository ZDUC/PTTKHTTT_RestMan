package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class DAO252 {
    // Kết nối đến cơ sở dữ liệu 'monan252'
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/monan252";
    private static final String USER = "root"; // Tên người dùng MySQL của bạn
    private static final String PASSWORD = "pttkhttt"; // Mật khẩu MySQL của bạn

    // Đọc danh sách món ăn từ bảng MySQL
    public static List<MonAn252> con() {
        List<MonAn252> monAnList = new ArrayList<>();
        String query = "SELECT id, tenMonAn, giaMonAn, moTa FROM monan252";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Tải driver JDBC
            try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
                 PreparedStatement statement = connection.prepareStatement(query);
                 ResultSet resultSet = statement.executeQuery()) {

                // Khởi tạo đối tượng định dạng cho tiền Việt
                NumberFormat formatter = NumberFormat.getInstance(new Locale("vi", "VN"));

                while (resultSet.next()) {
                    MonAn252 monAn = new MonAn252();
                    monAn.setId(String.valueOf(resultSet.getInt("id")));
                    monAn.setTenMonAn(resultSet.getString("tenMonAn"));

                    // Định dạng giá thành kiểu tiền Việt
                    double gia = resultSet.getDouble("giaMonAn");
                    String giaFormatted = formatter.format(Math.round(gia)); // Làm tròn và định dạng
                    monAn.setGiaMonAn(giaFormatted); // Thêm VNĐ vào cuối

                    monAn.setMoTa(resultSet.getString("moTa"));
                    monAnList.add(monAn);
                }
            } catch (SQLException e) {
                System.err.println("Lỗi khi kết nối với MySQL: " + e.getMessage());
            }
        } catch (ClassNotFoundException e) {
            System.err.println("Không tìm thấy driver JDBC: " + e.getMessage());
        }

        return monAnList; // Trả về danh sách món ăn
    }
}
