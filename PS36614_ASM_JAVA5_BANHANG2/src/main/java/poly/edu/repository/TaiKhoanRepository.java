package poly.edu.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import poly.edu.model.KhachHang;
import poly.edu.model.TaiKhoan;

@Repository
public interface TaiKhoanRepository extends JpaRepository<TaiKhoan, Integer> {
    // Có thể thêm các phương thức truy vấn tùy chỉnh ở đây nếu cần
	TaiKhoan findByEmail(String email);
	
}