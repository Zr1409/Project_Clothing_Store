package poly.edu;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.context.annotation.Configuration;
import java.util.Locale;

@Configuration
@EnableWebSecurity
@EnableScheduling
public class AppConfig {

    @Bean
    public ResourceBundleMessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasename("messages");
        messageSource.setDefaultEncoding("UTF-8");
        messageSource.setCacheSeconds(3600); // 1 hour
        return messageSource;
    }

    @Bean
    public LocaleResolver localeResolver() {
        CookieLocaleResolver localeResolver = new CookieLocaleResolver();
        localeResolver.setDefaultLocale(Locale.forLanguageTag("vi")); // Mặc định là tiếng Việt
        localeResolver.setCookieName("localeCookie"); // Tên cookie lưu trữ ngôn ngữ
        localeResolver.setCookieMaxAge(3600); // Thời gian sống của cookie (1 giờ)
        return localeResolver;
    }

    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName("lang"); // Tham số dùng để thay đổi ngôn ngữ
        return localeChangeInterceptor;
    }
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        // Tắt xác thực cho tất cả các request
        http
            .authorizeRequests()
                .anyRequest().permitAll()
            .and()
            .csrf().disable(); // Tắt CSRF chỉ khi cần (chỉ khi không cần bảo mật)

        return http.build();
    }
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http
//            .authorizeRequests()
//                .anyRequest().authenticated() // Yêu cầu tất cả request phải đăng nhập
//            .and()
//            .formLogin() // Sử dụng form đăng nhập mặc định
//                .permitAll()
//            .and()
//            .logout()
//                .permitAll();
//
//        return http.build();
//    }
//
//    @Bean
//    public UserDetailsService userDetailsService() {
//        UserDetails user = User.withDefaultPasswordEncoder() // Tạo người dùng với mật khẩu đơn giản (chỉ nên dùng khi phát triển)
//            .username("admin")
//            .password("123456")
//            .roles("USER")
//            .build();
//
//        return new InMemoryUserDetailsManager(user);
//    }
}
