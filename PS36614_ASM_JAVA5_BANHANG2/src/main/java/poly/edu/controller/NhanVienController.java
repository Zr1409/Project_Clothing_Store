package poly.edu.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import poly.edu.model.NhanVien;
import poly.edu.model.TaiKhoan;
import poly.edu.repository.NhanVienRepository;
import poly.edu.repository.TaiKhoanRepository;
import poly.edu.service.KhachHangService;
import poly.edu.service.NhanVienService;

@Controller

public class NhanVienController {

	@Autowired
	private NhanVienRepository nhanVienRepository;
	@Autowired
	private NhanVienService nhanVienService; // Thêm KhachHangService

	@Autowired
	private TaiKhoanRepository taiKhoanRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	// Tạo trang sửa

	@RequestMapping("/admin_user/edit/{id}")
	public String showEditForm(@PathVariable("id") Integer id, Model model) {
		// Lấy nhân viên từ cơ sở dữ liệu theo ID
		NhanVien nhanVien = nhanVienRepository.findById(id).get();
		// Đặt đối tượng nhân viên vào model để hiển thị trên form
		model.addAttribute("nhanVien", nhanVien);
		List<NhanVien> nhanViens = nhanVienRepository.findAll();
		model.addAttribute("nhanViens", nhanViens);

		return "admin/admin_user"; // Đường dẫn đến trang HTML hoặc JSP của bạn
	}

	@GetMapping("/admin_user")
	public String admin_user(HttpSession session, Model model) {
		NhanVien nhanVien = new NhanVien();
		// Đặt đối tượng nhân viên vào model để hiển thị trên form
		model.addAttribute("nhanVien", nhanVien);
		List<NhanVien> nhanViens = nhanVienRepository.findAll((Sort.by(Direction.ASC, "maNhanVien")));
		model.addAttribute("nhanViens", nhanViens);
		// Nếu đã xác thực trong AuthInterceptor, chỉ cần trả về trang admin
		return "admin/admin_user"; // Thay thế bằng tên trang admin của bạn
	}

	// Thêm nhân viên và tạo tài khoản
	@RequestMapping("/admin_user/create")
	public String create(@RequestParam String username, @RequestParam String email, @RequestParam String password,
			@RequestParam String cfmpassword, @RequestParam String address, @RequestParam String phone,
			@RequestParam String role, Model model) {

		// Kiểm tra mật khẩu xác nhận
		if (!password.equals(cfmpassword)) {
			model.addAttribute("error", "Mật khẩu và mật khẩu xác nhận không trùng khớp");
			List<NhanVien> nhanViens = nhanVienRepository.findAll();
			model.addAttribute("nhanViens", nhanViens);
			return "admin/admin_user"; // Hoặc trang thích hợp
		}

		// Kiểm tra email đã tồn tại
		TaiKhoan existingUser = taiKhoanRepository.findByEmail(email);
		if (existingUser != null) {
			model.addAttribute("error", "Email đã được sử dụng, vui lòng chọn email khác");
			List<NhanVien> nhanViens = nhanVienRepository.findAll();
			model.addAttribute("nhanViens", nhanViens);
			return "admin/admin_user"; // Hoặc trang thích hợp
		}

		// Kiểm tra số điện thoại đã tồn tại
		NhanVien existingPhone = nhanVienService.findBySoDienThoaiNhanVien(phone);
		if (existingPhone != null) {
			model.addAttribute("error", "Số điện thoại đã được sử dụng, vui lòng chọn số khác");
			List<NhanVien> nhanViens = nhanVienRepository.findAll();
			model.addAttribute("nhanViens", nhanViens);
			return "admin/admin_user"; // Hoặc trang thích hợp
		}

		// Kiểm tra số điện thoại (ví dụ, kiểm tra độ dài hoặc định dạng)
		if (!phone.matches("^(0\\d{9}|84\\d{9})$")) {
			model.addAttribute("error", "Số điện thoại không hợp lệ, vui lòng nhập đúng định dạng");
			List<NhanVien> nhanViens = nhanVienRepository.findAll();
			model.addAttribute("nhanViens", nhanViens);
			return "admin/admin_user"; // Hoặc trang thích hợp
		}

		// Mã hóa mật khẩu
		String encodedPassword = passwordEncoder.encode(password);

		// Tạo tài khoản cho nhân viên
		TaiKhoan taiKhoan = new TaiKhoan();
		taiKhoan.setEmail(email);
		taiKhoan.setMatKhau(encodedPassword);
		taiKhoan.setVaiTro(role); // Vai trò từ form

		// Lưu tài khoản trước
		taiKhoanRepository.save(taiKhoan);

		// Tạo mới đối tượng NhanVien
		NhanVien nhanVien = new NhanVien();
		nhanVien.setTenNhanVien(username); // Gán tên nhân viên
		nhanVien.setDiaChiNhanVien(address); // Gán địa chỉ
		nhanVien.setSoDienThoaiNhanVien(phone); // Gán số điện thoại
		nhanVien.setTaiKhoan(taiKhoan); // Gán tài khoản vào nhân viên

		// Lưu nhân viên kèm tài khoản
		nhanVienRepository.save(nhanVien);

		return "redirect:/admin_user"; // Chuyển hướng đến trang danh sách nhân viên
	}

	// Sửa thông tin nhân viên
	// Sửa thông tin nhân viên
	@RequestMapping("/admin_user/update/{id}")
	public String update(
	        @PathVariable("id") Integer id, // Lấy mã nhân viên từ URL
	        @ModelAttribute("nhanVien") NhanVien nhanVien,
	        @RequestParam String username,
	        @RequestParam String password,
	        @RequestParam String cfmpassword,
	        @RequestParam String email,
	        @RequestParam String address, 
	        @RequestParam String phone,
			@RequestParam String role, 
	        Model model) {

	    // Kiểm tra xem nhân viên có tồn tại không
	    Optional<NhanVien> existingNhanVienOpt = nhanVienRepository.findById(id);
	    if (!existingNhanVienOpt.isPresent()) {
	        model.addAttribute("error", "Nhân viên không tồn tại");
	        return "admin/admin_user"; // Trả về trang admin_user với thông báo lỗi
	    }

	    NhanVien existingNhanVien = existingNhanVienOpt.get();

	    // Cập nhật thông tin nhân viên
	    existingNhanVien.setTenNhanVien(username);
	    existingNhanVien.setDiaChiNhanVien(address);
	    existingNhanVien.setSoDienThoaiNhanVien(phone);

	    // Lấy tài khoản hiện tại để cập nhật
	    TaiKhoan taiKhoan = existingNhanVien.getTaiKhoan();
	    if (taiKhoan == null) {
	        model.addAttribute("error", "Tài khoản không tồn tại");
	        return "admin/admin_user"; // Trả về trang admin_user với thông báo lỗi
	    }

	    // Cập nhật thông tin tài khoản
	    taiKhoan.setEmail(email);

	    // Kiểm tra và cập nhật mật khẩu
	    if (!password.isEmpty()) { // Chỉ cập nhật mật khẩu nếu có mật khẩu mới
	        if (!password.equals(cfmpassword)) { // Kiểm tra mật khẩu và mật khẩu xác nhận
	            model.addAttribute("error", "Mật khẩu và mật khẩu xác nhận không trùng khớp");
	            return "admin/admin_user"; // Trả về trang admin_user với thông báo lỗi
	        }
	        // Mã hóa mật khẩu và lưu lại
	        String encodedPassword = passwordEncoder.encode(password);
	        taiKhoan.setMatKhau(encodedPassword);
	    }
	    taiKhoan.setVaiTro(role);

	    // Lưu tài khoản đã cập nhật
	    taiKhoanRepository.save(taiKhoan);
	    // Lưu nhân viên đã được cập nhật
	    nhanVienRepository.save(existingNhanVien);
	    
	    return "redirect:/admin_user"; // Chuyển hướng đến trang danh sách nhân viên
	}





	// Xóa nhân viên
	@RequestMapping("/admin_user/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		nhanVienRepository.deleteById(id);
		return "redirect:/admin_user";
	}
}
