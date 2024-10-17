package poly.edu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import poly.edu.model.NhanVien;
import poly.edu.model.TaiKhoan;
import poly.edu.repository.DonHangRepository;
import poly.edu.repository.NhanVienRepository;

@Controller
public class AdminController {
	@Autowired
	NhanVienRepository nhanVienRepository;
	@Autowired
	DonHangRepository donHangRepository;

    @GetMapping("/admin")
    public String adminPage(HttpSession session, Model model) {
        // Nếu đã xác thực trong AuthInterceptor, chỉ cần trả về trang admin
        return "admin/admin_product"; // Thay thế bằng tên trang admin của bạn
    }

//    @GetMapping("/admin_user")
//    public String admin_user(HttpSession session, Model model) {
//    	  List<NhanVien> nhanViens = nhanVienRepository.findAll();
//          model.addAttribute("nhanViens", nhanViens);
//        // Nếu đã xác thực trong AuthInterceptor, chỉ cần trả về trang admin
//        return "admin/admin_user"; // Thay thế bằng tên trang admin của bạn
//    }
//    @GetMapping("/admin_product")
//    public String admin_product(HttpSession session, Model model) {
//        // Nếu đã xác thực trong AuthInterceptor, chỉ cần trả về trang admin
//        return "admin/admin_product"; // Thay thế bằng tên trang admin của bạn
//    }

    @GetMapping("/admin_donhang")
    public String admin_donhang(HttpSession session, Model model) {
        // Nếu đã xác thực trong AuthInterceptor, chỉ cần trả về trang admin
        // Gọi phương thức DAO để lấy danh sách đơn hàng
        List<Object[]> orders = donHangRepository.findAllOrderDetails();
        
        // Đưa kết quả vào model để hiển thị trên JSP
        model.addAttribute("orders", orders);
        return "admin/admin_donhang"; // Thay thế bằng tên trang admin của bạn
    }

    @GetMapping("/admin_doanhthu")
    public String admin_doanhthu(HttpSession session, Model model) {
        // Nếu đã xác thực trong AuthInterceptor, chỉ cần trả về trang admin
        return "admin/admin_doanhthu"; // Thay thế bằng tên trang admin của bạn
    }
}
