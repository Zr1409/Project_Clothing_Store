package poly.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class ChangeLanguageController {

    @GetMapping("/ChangeLang")
    public void changeLanguage(@RequestParam("lang") String lang,
                               HttpServletRequest request,
                               HttpServletResponse response) throws IOException {
        // Lưu ngôn ngữ vào session
        HttpSession session = request.getSession();
        session.setAttribute("lang", lang);

        // Set đơn vị tiền tệ theo ngôn ngữ
        // Set đơn vị tiền tệ theo ngôn ngữ
        if ("en".equals(lang)) {
            session.setAttribute("currency", "USD");
            session.setAttribute("usdToVnd", 23000.0); // Tỷ giá USD sang VNĐ
            session.setAttribute("jpyToVnd", 170.0);   // Tỷ giá JPY sang VNĐ
        } else if ("vi".equals(lang)) {
            session.setAttribute("currency", "VNĐ");
            session.removeAttribute("usdToVnd"); // Không cần tỷ giá nếu là VNĐ
            session.removeAttribute("jpyToVnd");
        } else {
            session.setAttribute("currency", "JPY"); // Ví dụ cho tiếng Nhật
            session.setAttribute("usdToVnd", 23000.0); // Tỷ giá USD sang VNĐ
            session.setAttribute("jpyToVnd", 170.0);   // Tỷ giá JPY sang VNĐ
        }

        // Lấy URL của trang hiện tại và chuyển hướng
        String referer = request.getHeader("referer");
        if (referer != null && !referer.isEmpty()) {
            response.sendRedirect(referer);
        } else {
            response.sendRedirect(request.getContextPath() + "/index");
        }
    }
}
