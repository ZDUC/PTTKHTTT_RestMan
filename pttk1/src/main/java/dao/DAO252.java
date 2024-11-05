package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO252 {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/monan252";
    private static final String USER = "root";
    private static final String PASSWORD = "pttkhttt";

    // Phương thức để thiết lập kết nối đến cơ sở dữ liệu
    public static Connection con() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Kết nối thành công!");// Tải driver JDBC
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("Không tìm thấy driver JDBC: " + e.getMessage());
        } catch (SQLException e) {
            System.err.println("Lỗi khi kết nối với MySQL: " + e.getMessage());
        }
        return null;
    }
}
