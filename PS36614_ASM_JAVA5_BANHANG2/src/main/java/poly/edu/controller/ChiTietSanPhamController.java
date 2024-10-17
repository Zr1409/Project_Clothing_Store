package poly.edu.controller;
import poly.edu.model.SanPhamQuanAo;
import poly.edu.service.SanPhamQuanAoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class ChiTietSanPhamController {

    @Autowired
    private SanPhamQuanAoService sanPhamQuanAoService;

    @GetMapping("/chitietsanpham")
    public String getChiTietSanPham(@RequestParam(value = "maSanPham", required = false) Integer id, Model model) {
        try {
            List<SanPhamQuanAo> listSanPham = sanPhamQuanAoService.getAllSanPham();
            model.addAttribute("listSanPham", listSanPham);

            if (id != null) {
                SanPhamQuanAo sanPham = sanPhamQuanAoService.findById(id);
                model.addAttribute("sanPham", sanPham);
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Error: " + e.getMessage());
        }

        return "chitiet_product";
    }
}
