package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO252 {
    protected Connection con;
    public DAO252() {
        String url = "jdbc:mysql://127.0.0.1:3306/monan252";
        String user = "root"; // Thay bằng tên người dùng MySQL của bạn
        String password = "pttkhttt"; // Thay bằng mật khẩu MySQL của bạn
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Tải driver
            con = DriverManager.getConnection(url, user, password); // Lưu kết nối vào biến con
            System.out.println("Kết nối thành công!");
        } catch (ClassNotFoundException e) {
            System.err.println("Driver không tìm thấy: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Kết nối thất bại: " + e.getMessage());
        }
    }
    // Thêm phương thức đóng kết nối
    public void closeConnection() {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                System.err.println("Đóng kết nối thất bại: " + e.getMessage());
            }
        }
    }
}
