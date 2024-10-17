package poly.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

import poly.edu.service.SanPhamQuanAoService; // Sử dụng dịch vụ SanPhamQuanAo
import poly.edu.model.SanPhamQuanAo; // Thay đổi kiểu về SanPhamQuanAo

import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private SanPhamQuanAoService sanPhamQuanAoService; // Thay đổi để sử dụng dịch vụ SanPhamQuanAo

    @GetMapping("index")
    public String index(HttpSession session, @RequestParam(name = "maSanPham", required = false) Integer id, Model model) {
        // Xử lý cài đặt ngôn ngữ
        String lang = (String) session.getAttribute("lang");
        if (lang == null) {
            lang = "vi"; // Giá trị mặc định
            session.setAttribute("lang", lang);
        }
        model.addAttribute("lang", lang);

        // Lấy tất cả sản phẩm
        List<SanPhamQuanAo> sp = sanPhamQuanAoService.getAllSanPham(); // Sử dụng dịch vụ SanPhamQuanAo
        System.out.println("Sản phẩm: " + sp); // Log để kiểm tra dữ liệu
        model.addAttribute("listSanPham", sp);

        if (id != null) {
            // Lấy chi tiết sản phẩm
            SanPhamQuanAo sanPham = sanPhamQuanAoService.findById(id); // Thay đổi sang SanPhamQuanAo
            model.addAttribute("sanPham", sanPham);
        }

        return "index"; // Tương ứng với /views/index.jsp
    }

    @GetMapping("wishlist")
    public String wishlist() {
        return "wishlist"; // Tương ứng với /views/wishlist.jsp
    }

    @GetMapping("lienhe")
    public String lienhe() {
        return "lienhe"; // Tương ứng với /views/lienhe.jsp
    }
}
