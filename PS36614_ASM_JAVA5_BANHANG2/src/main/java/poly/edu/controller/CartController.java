package poly.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import jakarta.*;
import jakarta.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;
import poly.edu.dto.*;
import poly.edu.service.*;
import poly.edu.model.KhachHang;

@Controller
public class CartController {
    
    @Autowired
    private CartService cartService;

    @Autowired
    private SanPhamQuanAoService sanPhamService; // Sử dụng dịch vụ sản phẩm

    @Autowired
    private KhachHangService khachHangService; // Sử dụng dịch vụ khách hàng

    @GetMapping("/cart")
    public String viewCart(HttpSession session, Model model) {
        CartDto cart = (CartDto) session.getAttribute("cart");
        if (cart == null) {
            cart = new CartDto();
            session.setAttribute("cart", cart);
        }
        model.addAttribute("cart", cart);
        return "cart"; // Trả về tên trang cart.jsp
    }
    @GetMapping("/checkout")
    public String checkoutCart(HttpSession session, Model model) {
        CartDto cart = (CartDto) session.getAttribute("cart");
        if (cart == null) {
            cart = new CartDto();
            session.setAttribute("cart", cart);
        }
        model.addAttribute("cart", cart);
        return "checkout"; // Trả về tên trang checkout.jsp
    }

    @GetMapping("/add")
    @ResponseBody
    public String addToCart(@RequestParam("maSanPham") int masp,
                            @RequestParam("soluong") int soluong,
                            @RequestParam("isUpdate") boolean isUpdate,
                            @RequestParam("size") String size,
                            @RequestParam("color") String color,
                            HttpSession session) throws Exception {
        CartDto cart = (CartDto) session.getAttribute("cart");
        if (cart == null) {
            cart = new CartDto();
            session.setAttribute("cart", cart);
        }
        cartService.updateCart(cart, masp, soluong, size, color, isUpdate);
        
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(cart); // Trả về dữ liệu JSON của giỏ hàng
    }

    @GetMapping("/remove")
    public String removeFromCart(@RequestParam("maSanPham") int masp, HttpSession session) {     
        // Thêm logic để xóa sản phẩm khỏi giỏ hàng nếu cần
        return "redirect:/cart"; // Chuyển hướng về trang giỏ hàng
    }

    @GetMapping("/paying")
    @ResponseBody
    public String processPayment(@RequestParam("phone") String phone,
                                 @RequestParam("address") String address,
                                 HttpSession session) {
        KhachHang currentUser = (KhachHang) session.getAttribute("khachHang");
        if (currentUser != null) {
            CartDto cart = (CartDto) session.getAttribute("cart");
            cart.setDienthoai(phone);
            cart.setDiachi(address);
            cart.setUserId(currentUser.getMaKhachHang());

            boolean isInserted = cartService.insertHoaDon(cart);
            if (isInserted) {
                session.setAttribute("cart", new CartDto()); // Xoá giỏ hàng sau khi thanh toán
                return "Payment successful";
            } else {
                return "Payment failed";
            }
        } else {
            return "Please login before paying";
        }
    }
}
