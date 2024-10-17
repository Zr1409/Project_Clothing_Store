package poly.edu.controller;

import poly.edu.model.KhachHang;
import poly.edu.model.MailInfo;
import poly.edu.model.NhanVien;
import poly.edu.model.TaiKhoan;
import poly.edu.service.KhachHangService;
import poly.edu.service.MailerService;
import poly.edu.service.NhanVienService;
import poly.edu.service.TaiKhoanService;

import java.security.SecureRandom;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private TaiKhoanService taiKhoanService;
	@Autowired
	private NhanVienService nhanVienService;

	@Autowired
	private KhachHangService khachHangService; // Thêm KhachHangService

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private MailerService mailerService; // Inject MailerService để gửi email

	@GetMapping("/login")
	public String getLogin() {
		return "login";
	}

	@PostMapping("/login")
	public String postLogin(@RequestParam String email, @RequestParam String password, Model model,
			HttpSession session) {
		TaiKhoan taiKhoan = taiKhoanService.findByEmail(email);

		// if (taiKhoan != null && password.equals(taiKhoan.getMatKhau())) {
		if (taiKhoan != null && passwordEncoder.matches(password, taiKhoan.getMatKhau())) {
			// Tìm khách hàng dựa vào tài khoản
			KhachHang khachHang = khachHangService.findByTaiKhoanId(taiKhoan.getMaTaiKhoan());
			NhanVien nhanVien = nhanVienService.findByTaiKhoanId(taiKhoan.getMaTaiKhoan());

			// Thiết lập session cho người dùng
			// session.setAttribute("user", taiKhoan);
			session.setAttribute("taiKhoan", taiKhoan);
			session.setAttribute("nhanVien", nhanVien);
			session.setAttribute("khachHang", khachHang); // Thêm thông tin khách hàng vào session nếu cần

			model.addAttribute("message", "Đăng nhập thành công!");
			return "redirect:/index";
		} else {
			model.addAttribute("error", "Email hoặc mật khẩu không đúng");
			return "login";
		}

	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session != null) {
			session.invalidate();
			session = request.getSession(); // Tạo session mới
			session.setAttribute("lang", "vi"); // Đặt ngôn ngữ mặc định
		}
		return "redirect:/login"; // Chuyển hướng đến trang đăng nhập
	}

	@GetMapping("/register")
	public String getRegister() {
		return "register";
	}

	@PostMapping("/register")
	public String postRegister(@RequestParam String username, @RequestParam String email, @RequestParam String password,
	                           @RequestParam String cfmpassword, @RequestParam String address, 
	                           @RequestParam String phone, Model model) {
	    // Kiểm tra mật khẩu xác nhận
	    if (!password.equals(cfmpassword)) {
	        model.addAttribute("error", "Mật khẩu và mật khẩu xác nhận không trùng khớp");
	        return "register";
	    }

	    // Kiểm tra email đã tồn tại
	    TaiKhoan existingUser = taiKhoanService.findByEmail(email);
	    if (existingUser != null) {
	        model.addAttribute("error", "Email đã được sử dụng, vui lòng chọn email khác");
	        return "register";
	    }
	 // Kiểm tra số điện thoại đã tồn tại
	    KhachHang existingPhone = khachHangService.findBySoDienThoai(phone);
	    if (existingPhone != null) {
	        model.addAttribute("error", "Số điện thoại đã được sử dụng, vui lòng chọn số khác");
	        return "register";
	    }


	    // Kiểm tra số điện thoại (ví dụ, kiểm tra độ dài hoặc định dạng)
	    if (!phone.matches("^(0\\d{9}|84\\d{9})$")) {
	        model.addAttribute("error", "Số điện thoại không hợp lệ, vui lòng nhập đúng định dạng");
	        return "register";
	    }


	    // Mã hóa mật khẩu
	    String encodedPassword = passwordEncoder.encode(password);

	    // Tạo mới đối tượng TaiKhoan
	    TaiKhoan newTaiKhoan = new TaiKhoan();
	    newTaiKhoan.setEmail(email);
	    newTaiKhoan.setMatKhau(encodedPassword); // Lưu mật khẩu đã mã hóa
	    newTaiKhoan.setVaiTro("khachhang"); // Mặc định là khách hàng

	    // Lưu đối tượng TaiKhoan vào cơ sở dữ liệu
	    taiKhoanService.saveTaiKhoan(newTaiKhoan);

	    // Tạo mới đối tượng KhachHang
	    KhachHang newUser = new KhachHang();
	    newUser.setTenKhachHang(username);
	    newUser.setDiaChi(address); // Thiết lập địa chỉ
	    newUser.setSoDienThoai(phone); // Thiết lập số điện thoại
	    newUser.setTaiKhoan(newTaiKhoan); // Thiết lập mối quan hệ với tài khoản

	    // Lưu đối tượng KhachHang vào cơ sở dữ liệu
	    khachHangService.saveKhachHang(newUser);

	    return "redirect:/login"; // Chuyển hướng đến trang đăng nhập
	}

	@GetMapping("/forgotpassword")
	public String getForgotPassword() {
		return "forgotpassword";
	}

//    @PostMapping("/forgotpassword")
//    public String postForgotPassword(@RequestParam String email, Model model) {
//        if (email.isEmpty()) {
//            model.addAttribute("error", "Email không được để trống");
//            return "forgotpassword";
//        }
//
//        TaiKhoan taiKhoan = taiKhoanService.findByEmail(email);
//
//        if (taiKhoan != null) {
//            String newPassword = generateRandomPassword(6);
//            taiKhoan.setMatKhau(newPassword); // Lưu mật khẩu mới dưới dạng plain text
//            taiKhoanService.saveTaiKhoan(taiKhoan);
//
//            // Sử dụng MailerService để thêm vào hàng đợi email
//            String[] to = { email };
//            String subject = "Mật khẩu mới";
//            String body = "Mật khẩu mới của bạn là: " + newPassword;
//            mailerService.queue(to, subject, body); // Đưa email vào hàng đợi
//            
//            model.addAttribute("message", "Mật khẩu mới đã được gửi đến email của bạn.");
//            return "login";
//        } else {
//            model.addAttribute("error", "Email không đúng");
//            return "forgotpassword";
//        }
//    }
//
//
//    @GetMapping("/changepassword")
//    public String getChangePassword() {
//        return "changepassword";
//    }
//
//    @PostMapping("/changepassword")
//    public String postChangePassword(@RequestParam String email, @RequestParam String password, 
//                                     @RequestParam String newpassword, Model model) {
//        TaiKhoan taiKhoan = taiKhoanService.findByEmail(email);
//
//        if (taiKhoan != null && password.equals(taiKhoan.getMatKhau())) {
//            taiKhoan.setMatKhau(newpassword); // Cập nhật mật khẩu mới dưới dạng plain text
//            taiKhoanService.saveTaiKhoan(taiKhoan);
//            model.addAttribute("message", "Mật khẩu đã được thay đổi thành công!");
//            return "login";
//        } else {
//            model.addAttribute("error", "Email hoặc mật khẩu không đúng");
//            return "changepassword";
//        }
//    }
//
//    public String generateRandomPassword(int length) {
//        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
//        SecureRandom random = new SecureRandom();
//        StringBuilder sb = new StringBuilder(length);
//        for (int i = 0; i < length; i++) {
//            int index = random.nextInt(characters.length());
//            sb.append(characters.charAt(index));
//        }
//        return sb.toString();
//    }
//
//    private void sendPasswordEmail(String to, String newPassword) {
//        SimpleMailMessage message = new SimpleMailMessage();
//        message.setTo(to);
//        message.setSubject("Mật khẩu mới");
//        message.setText("Mật khẩu mới của bạn là: " + newPassword);
//        mailSender.send(message);
//    }
	@PostMapping("/forgotpassword")
	public String postForgotPassword(@RequestParam String email, Model model) {
		if (email.isEmpty()) {
			model.addAttribute("error", "Email không được để trống");
			return "forgotpassword";
		}

		TaiKhoan taiKhoan = taiKhoanService.findByEmail(email);

		if (taiKhoan != null) {
			String newPassword = generateRandomPassword(6);

			// Mã hóa mật khẩu mới trước khi lưu
			String encodedPassword = passwordEncoder.encode(newPassword);
			taiKhoan.setMatKhau(encodedPassword);
			taiKhoanService.saveTaiKhoan(taiKhoan);

			// Gửi mật khẩu mới qua email
			String[] to = { email };
			String subject = "Mật khẩu mới";
			String body = "Mật khẩu mới của bạn là: " + newPassword; // Gửi mật khẩu gốc (plain text)
			MailInfo mailInfo = new MailInfo(to, subject, body);
			mailerService.queue(mailInfo); // Đưa email vào hàng đợi để gửi

			model.addAttribute("message", "Mật khẩu mới đã được gửi đến email của bạn.");
			return "login";
		} else {
			model.addAttribute("error", "Email không đúng");
			return "forgotpassword";
		}
	}

	@GetMapping("/changepassword")
	public String getChangePassword() {
		return "changepassword";
	}

	@PostMapping("/changepassword")
	public String postChangePassword(@RequestParam String email, @RequestParam String password,
			@RequestParam String newpassword, Model model) {
		TaiKhoan taiKhoan = taiKhoanService.findByEmail(email);

		if (taiKhoan != null && passwordEncoder.matches(password, taiKhoan.getMatKhau())) {
			// Mã hóa mật khẩu mới trước khi lưu
			String encodedPassword = passwordEncoder.encode(newpassword);
			taiKhoan.setMatKhau(encodedPassword); // Cập nhật mật khẩu mới đã mã hóa
			taiKhoanService.saveTaiKhoan(taiKhoan);

			// Gửi email thông báo
			String[] recipients = { email };
			String subject = "Xác nhận thay đổi mật khẩu";
			String body = "Mật khẩu của bạn đã được thay đổi thành công.<br>" + 
		              "Mật khẩu mới là: " + newpassword + "<br>" + 
		              "Nếu bạn không thực hiện việc này, vui lòng liên hệ ngay với chúng tôi qua email:<br>" + 
		              "tranvandu19971029@gmail.com";


			MailInfo mailInfo = new MailInfo(recipients, subject, body);
			mailerService.queue(mailInfo); // Đưa email vào hàng đợi để gửi

			model.addAttribute("message", "Mật khẩu đã được thay đổi thành công! Email xác nhận đã được gửi.");
			return "login";
		} else {
			model.addAttribute("error", "Email hoặc mật khẩu không đúng");
			return "changepassword";
		}
	}

	public String generateRandomPassword(int length) {
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		SecureRandom random = new SecureRandom();
		StringBuilder sb = new StringBuilder(length);
		for (int i = 0; i < length; i++) {
			int index = random.nextInt(characters.length());
			sb.append(characters.charAt(index));
		}
		return sb.toString();
	}

	// Hàm này không còn cần thiết nữa
	private void sendPasswordEmail(String to, String newPassword) {
		// Đưa email vào hàng đợi thay vì gửi trực tiếp
		String[] recipients = { to };
		String subject = "Mật khẩu mới";
		String body = "Mật khẩu mới của bạn là: " + newPassword;
		MailInfo mailInfo = new MailInfo(recipients, subject, body);
		mailerService.queue(mailInfo);
	}
}
