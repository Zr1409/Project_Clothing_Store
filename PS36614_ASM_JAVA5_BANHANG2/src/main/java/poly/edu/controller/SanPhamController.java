package poly.edu.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import poly.edu.model.NhanVien;
import poly.edu.model.SanPhamQuanAo;
import poly.edu.model.TaiKhoan;
import poly.edu.repository.NhanVienRepository;
import poly.edu.repository.SanPhamQuanAoRepository;
import poly.edu.service.NhanVienService;
import poly.edu.service.SanPhamQuanAoService;
import poly.edu.service.SessionService;

@Controller
//@RequestMapping("/sanpham")
public class SanPhamController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse response;

	@Autowired
	private SanPhamQuanAoService sanPhamQuanAoService;
	@Autowired
	SessionService session;
	@Autowired
	SanPhamQuanAoRepository sanPhamQuanAoRepository;

	@GetMapping("/sanpham")
	public String getSanpham(@RequestParam("keywords") Optional<String> kw,
			@RequestParam(value = "field", defaultValue = "gia") String field,
			@RequestParam(value = "direction", defaultValue = "asc") String direction,
			@RequestParam(name = "page", required = false, defaultValue = "0") int page, Model model) {

		String kwords = kw.orElse("").trim(); // Lấy từ khóa tìm kiếm
		session.set("keywords", kwords); // Lưu từ khóa vào session

		// Xử lý sắp xếp
		if (field.equalsIgnoreCase((String) model.getAttribute("field"))) {
			direction = direction.equals("asc") ? "desc" : "asc"; // Đảo ngược hướng sắp xếp
		}

		Sort sort = Sort.by(Sort.Direction.fromString(direction), field);
		Pageable pageable = PageRequest.of(page, 6, sort); // Kích thước trang là 6

		// Lấy sản phẩm theo từ khóa và phân trang
		Page<SanPhamQuanAo> pagedSanPham = sanPhamQuanAoRepository.findAllByTenSanPhamLike("%" + kwords + "%",
				pageable);

		// Thêm các thuộc tính vào mô hình
		model.addAttribute("listSanPham", pagedSanPham.getContent());
		model.addAttribute("currentPage", pagedSanPham.getNumber() + 1); // Cộng thêm 1 vì page bắt đầu từ 0
		model.addAttribute("totalPages", pagedSanPham.getTotalPages());
		model.addAttribute("keywords", kwords);
		model.addAttribute("field", field);
		model.addAttribute("direction", direction);

		return "product"; // Trả về view product.jsp
	}

//	@GetMapping("/sanpham/chitiet")
//	public String doChiTietSanPham(@RequestParam("maSanPham") int id, Model model) {
//		SanPhamQuanAo sanPham = sanPhamQuanAoService.findById(id);
//		model.addAttribute("sanPham", sanPham);
//		return "chitiet_product"; // Trả về view chitiet_product.jsp
//	}

//	@GetMapping("/add")
//	public String showAddSanPhamForm(Model model) {
//		model.addAttribute("sanPham", new SanPhamQuanAo());
//		return "addsanpham"; // Trả về form thêm sản phẩm
//	}
//
//	@PostMapping("/add")
//	public String doAddSanPham(@ModelAttribute("sanPham") SanPhamQuanAo sanPham,
//			@RequestParam("fileNames") MultipartFile[] files, Model model) {
//		try {
//			List<String> duongDanHinhAnhList = new ArrayList<>(); // Danh sách để lưu các đường dẫn hình ảnh
//
//			for (MultipartFile file : files) {
//				if (!file.isEmpty()) {
//					// Lưu file vào server
//					String filePath = "src/main/resources/static/uploads/" + file.getOriginalFilename();
//					file.transferTo(new java.io.File(filePath));
//					duongDanHinhAnhList.add(filePath); // Thêm đường dẫn hình ảnh vào danh sách
//				}
//			}
//
//			sanPham.setDuongDanHinhAnh(duongDanHinhAnhList); // Sử dụng phương thức set với danh sách
//			sanPhamQuanAoService.saveSanPham(sanPham); // Lưu sản phẩm
//
//			return "redirect:/sanpham";
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("error", "Lỗi khi thêm sản phẩm: " + e.getMessage());
//			return "addsanpham";
//		}
//	}
//
//	@GetMapping("/delete")
//	public String doDeleteSanPham(@RequestParam("maSanPham") int id) {
//		sanPhamQuanAoService.deleteSanPham(id); // Xóa sản phẩm
//		return "redirect:/sanpham";
//	}
//
//	@GetMapping("/update")
//	public String showUpdateSanPhamForm(@RequestParam("maSanPham") int id, Model model) {
//		SanPhamQuanAo sanPham = sanPhamQuanAoService.findById(id);
//		model.addAttribute("sanPham", sanPham);
//		return "updatesanpham"; // Trả về form cập nhật sản phẩm
//	}
//
//	@PostMapping("/update")
//	public String doUpdateSanPham(@ModelAttribute("sanPham") SanPhamQuanAo sanPham,
//			@RequestParam("fileNames") MultipartFile[] files) {
//		try {
//			List<String> duongDanHinhAnhList = new ArrayList<>(); // Danh sách để lưu các đường dẫn hình ảnh
//
//			for (MultipartFile file : files) {
//				if (!file.isEmpty()) {
//					// Lưu file vào server
//					String filePath = "src/main/resources/static/uploads/" + file.getOriginalFilename();
//					file.transferTo(new java.io.File(filePath));
//					duongDanHinhAnhList.add(filePath); // Thêm đường dẫn hình ảnh vào danh sách
//				}
//			}
//
//			sanPham.setDuongDanHinhAnh(duongDanHinhAnhList); // Sử dụng phương thức set với danh sách
//			sanPhamQuanAoService.updateSanPham(sanPham); // Cập nhật sản phẩm
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "redirect:/sanpham/chitiet?maSanPham=" + sanPham.getMaSanPham();
//	}
	@RequestMapping("/admin_product/edit/{id}")
	public String showEditFormProduct(@PathVariable("id") Integer id, Model model) {
		// Lấy nhân viên từ cơ sở dữ liệu theo ID
		SanPhamQuanAo sanPham = sanPhamQuanAoRepository.findById(id).get();
		// Đặt đối tượng nhân viên vào model để hiển thị trên form
		model.addAttribute("sanPham", sanPham);
		List<SanPhamQuanAo> sanPhams = sanPhamQuanAoRepository.findAll();
		model.addAttribute("sanPhams", sanPhams);

		return "admin/admin_product"; // Đường dẫn đến trang HTML hoặc JSP của bạn
	}

	@GetMapping("/admin_product")
	public String admin_product(HttpSession session, Model model) {
		SanPhamQuanAo sanPham = new SanPhamQuanAo();
		// Đặt đối tượng nhân viên vào model để hiển thị trên form
		model.addAttribute("sanPham", sanPham);
		List<SanPhamQuanAo> sanPhams = sanPhamQuanAoRepository.findAll((Sort.by(Direction.ASC, "maSanPham")));
		model.addAttribute("sanPhams", sanPhams);
		// Nếu đã xác thực trong AuthInterceptor, chỉ cần trả về trang admin
		return "admin/admin_product"; // Thay thế bằng tên trang admin của bạn
	}

	// Thêm nhân viên và tạo tài khoản
	@RequestMapping("/admin_product/create")
	public String doAddSanPham( Model model) {
		try {
//			List<String> duongDanHinhAnhList = new ArrayList<>(); // Danh sách để lưu các đường dẫn hình ảnh
//
//			for (MultipartFile file : files) {
//				if (!file.isEmpty()) {
//					// Lưu file vào server
//					String filePath = "src/main/resources/static/uploads/" + file.getOriginalFilename();
//					file.transferTo(new java.io.File(filePath));
//					duongDanHinhAnhList.add(filePath); // Thêm đường dẫn hình ảnh vào danh sách
//				}
//			}
			String tenSanPham = request.getParameter("tenSanPham");
			String giaStr = request.getParameter("gia");
			String moTa = request.getParameter("moTa");
			String duongDanHinhAnh = request.getParameter("fileNames"); // Lấy chuỗi tên tệp
			String chatLieu = request.getParameter("chatLieu");
			String thuongHieu = request.getParameter("thuongHieu");

			double gia = 0; // Khởi tạo biến gia

			// Chuyển đổi giaStr về gia
			try {
			    gia = Double.parseDouble(giaStr);
			} catch (NumberFormatException e) {
			    // Xử lý nếu giaStr không phải là số hợp lệ
			    System.err.println("Giá không hợp lệ: " + giaStr);
			    // Có thể cần đặt giá mặc định hoặc thông báo lỗi cho người dùng
			}

			// Khởi tạo đối tượng SanPhamQuanAo			

			SanPhamQuanAo sanPham = new SanPhamQuanAo(tenSanPham, gia, moTa, duongDanHinhAnh, chatLieu, thuongHieu);			
			sanPhamQuanAoService.saveSanPham(sanPham); // Lưu sản phẩm

			return "redirect:/admin_product";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Lỗi khi thêm sản phẩm: " + e.getMessage());
			return "admin/admin_product";
		}
	}

	@RequestMapping("/admin_product/update")
	public String doUpdateSanPham(@ModelAttribute("sanPham") SanPhamQuanAo sanPham,
			@RequestParam("fileNames") MultipartFile[] files) {
		try {
			List<String> duongDanHinhAnhList = new ArrayList<>(); // Danh sách để lưu các đường dẫn hình ảnh

			for (MultipartFile file : files) {
				if (!file.isEmpty()) {
					// Lưu file vào server
					String filePath = "src/main/resources/static/uploads/" + file.getOriginalFilename();
					file.transferTo(new java.io.File(filePath));
					duongDanHinhAnhList.add(filePath); // Thêm đường dẫn hình ảnh vào danh sách
				}
			}

			sanPham.setDuongDanHinhAnh(duongDanHinhAnhList); // Sử dụng phương thức set với danh sách
			sanPhamQuanAoService.updateSanPham(sanPham); // Cập nhật sản phẩm
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin_product";
	}


	// Xóa nhân viên
	@RequestMapping("/admin_product/delete/{id}")
	public String deleteSanPham(@PathVariable("id") Integer id) {
		sanPhamQuanAoRepository.deleteById(id);
		return "redirect:/admin_product";
	}
}
