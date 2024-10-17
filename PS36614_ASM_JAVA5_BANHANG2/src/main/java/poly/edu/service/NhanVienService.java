package poly.edu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.edu.model.KhachHang;
import poly.edu.model.NhanVien;
import poly.edu.model.TaiKhoan;
import poly.edu.repository.NhanVienRepository;

import java.util.List;

@Service
public class NhanVienService {

    @Autowired
    private NhanVienRepository nhanVienRepository;

    public List<NhanVien> getAllKhachHang() {
        return nhanVienRepository.findAll();
    }

    public NhanVien saveKhachHang(NhanVien nhanVien) {
        return nhanVienRepository.save(nhanVien);
    }

    public NhanVien findById(int maNhanVien) {
        return nhanVienRepository.findById(maNhanVien).orElse(null);
    }

    public void deleteNhanVien(int maKhachHang) {
    	nhanVienRepository.deleteById(maKhachHang);
    }
    public NhanVien findByTaiKhoan(TaiKhoan taiKhoan) {
        return nhanVienRepository.findByTaiKhoan(taiKhoan);
    }
    public NhanVien findBySoDienThoaiNhanVien(String sdt) {
        return nhanVienRepository.findBySoDienThoaiNhanVien(sdt);
    }
    public NhanVien findByTaiKhoanId(int maTaiKhoan) {
        return nhanVienRepository.findByTaiKhoan_MaTaiKhoan(maTaiKhoan);
    }
    

    
}
