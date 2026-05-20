package com.edu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.edu.model.KhachHang;
import com.edu.model.TaiKhoan;

@Repository
public interface KhachHangRepository extends JpaRepository<KhachHang, Integer> {

	KhachHang findByTaiKhoan(TaiKhoan taiKhoan);
    KhachHang findByTaiKhoan_MaTaiKhoan(int maTaiKhoan);
	KhachHang findBySoDienThoai(String sdt);
    
}
