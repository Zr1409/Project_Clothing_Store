package poly.edu.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import poly.edu.interceptor.AuthInterceptor;

@Configuration
public class SecurityConfig implements WebMvcConfigurer {

    @Autowired
    AuthInterceptor authInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authInterceptor)
                .addPathPatterns("/**") // Áp dụng cho mọi đường dẫn
                .excludePathPatterns(
                        "/assets/**", 
                        "/admin/assets/**", 
                        "/admin/css/**", 
                        "/admin/js/**", 
                        "/admin/webfonts/**", 
                        "/login", 
                        "/index"
                             // Loại trừ các trang cart
                ); 
    }
}
