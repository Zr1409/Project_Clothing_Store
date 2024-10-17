package poly.edu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import poly.edu.model.ChiTietDonHang;
import poly.edu.model.DonHang;
import poly.edu.repository.ChiTietDonHangRepository;

import java.util.List;

@Service
public class ChiTietDonHangService {

    @Autowired
    private ChiTietDonHangRepository chiTietDonHangRepository;

    public List<ChiTietDonHang> getAllChiTietDonHang() {
        return chiTietDonHangRepository.findAll();
    }

    public ChiTietDonHang saveChiTietDonHang(ChiTietDonHang chiTietDonHang) {
        return chiTietDonHangRepository.save(chiTietDonHang);
    }

    public ChiTietDonHang findById(int id) {
        return chiTietDonHangRepository.findById(id).orElse(null);
    }
    public int updateChiTietDonHang(ChiTietDonHang chiTietDonHang) {
        return chiTietDonHangRepository.save(chiTietDonHang) != null ? 1 : -1;
    }
    public void deleteChiTietDonHang(int id) {
        chiTietDonHangRepository.deleteById(id);
    }

    public List<ChiTietDonHang> findByDonHangId(int donHangId) {
        return chiTietDonHangRepository.findByDonHangMaDonHang(donHangId);
    }
}
