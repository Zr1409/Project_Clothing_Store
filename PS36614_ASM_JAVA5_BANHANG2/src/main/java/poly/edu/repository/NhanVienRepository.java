package poly.edu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import poly.edu.model.KhachHang;
import poly.edu.model.NhanVien;
import poly.edu.model.TaiKhoan;

@Repository
public interface NhanVienRepository extends JpaRepository<NhanVien, Integer> {
	NhanVien findBySoDienThoaiNhanVien(String sdt);
	NhanVien findByTaiKhoan(TaiKhoan taiKhoan);
	NhanVien findByTaiKhoan_MaTaiKhoan(int maTaiKhoan);

    
}
