package dao;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class DAO252 {
    private static final ObjectMapper objectMapper = new ObjectMapper();

    // Đọc danh sách món ăn từ file JSON
    public static List<MonAn252> con() {
        List<MonAn252> monAnList = null;

        try (InputStream inputStream = DAO252.class.getClassLoader().getResourceAsStream("dtbs/data.json")) {
            if (inputStream != null) {
                // Đọc dữ liệu từ file JSON
                monAnList = objectMapper.readValue(inputStream, new TypeReference<List<MonAn252>>() {});
            } else {
                System.err.println("Không tìm thấy file JSON.");
            }
        } catch (IOException e) {
            System.err.println("Lỗi khi đọc file JSON: " + e.getMessage());
        }

        return monAnList; // Trả về danh sách món ăn
    }
}
