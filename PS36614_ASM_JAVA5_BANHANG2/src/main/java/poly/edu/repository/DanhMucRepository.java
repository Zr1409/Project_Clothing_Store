package poly.edu.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import poly.edu.model.DanhMucSanPhamQuanAo;


@Repository
public interface DanhMucRepository extends JpaRepository<DanhMucSanPhamQuanAo, Integer> {
    // Có thể thêm các phương thức truy vấn tùy chỉnh ở đây nếu cần

	
}