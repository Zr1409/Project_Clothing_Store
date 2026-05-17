# Project Clothing Store

**Project Clothing Store** là hệ thống quản lý và bán hàng thời trang, xây dựng với Java Spring Boot (backend) và JSP (frontend). Ứng dụng hỗ trợ quản lý sản phẩm, đơn hàng, khách hàng, nhân viên, giỏ hàng, thanh toán, thống kê, đánh giá và nhiều tính năng khác cho cả người dùng và quản trị viên.

---

## 1. Tính năng nổi bật

### Người dùng (Khách hàng)
- Đăng ký, đăng nhập, đổi/quên mật khẩu
- Xem danh mục, chi tiết sản phẩm, tìm kiếm, lọc sản phẩm
- Thêm sản phẩm vào giỏ hàng, cập nhật số lượng, xóa sản phẩm
- Đặt hàng, thanh toán, xem lịch sử đơn hàng
- Đánh giá, bình luận sản phẩm
- Nhận thông báo khuyến mãi, ưu đãi

### Quản trị viên
- Quản lý sản phẩm, danh mục, khuyến mãi
- Quản lý đơn hàng, xác nhận/trạng thái giao hàng
- Quản lý khách hàng, nhân viên, phân quyền tài khoản
- Thống kê doanh thu, sản phẩm bán chạy, quản lý đánh giá
- Quản lý banner, nội dung trang chủ, upload hình ảnh

### Tính năng bổ sung
- Gửi email xác nhận, thông báo trạng thái đơn hàng
- Tích hợp chatbot hỗ trợ khách hàng
- Đa ngôn ngữ (Việt/Anh)
- Responsive UI (hỗ trợ mobile, tablet, desktop)

---

## 2. Công nghệ sử dụng

- **Backend:** Java 21, Spring Boot 3, Spring Data JPA, Hibernate, Maven, Lombok, Spring Security, Jakarta Mail, SQL Server
- **Frontend:** JSP, JSTL, HTML5, CSS3, Bootstrap, JavaScript
- **Khác:** Apache Tomcat, Maven Wrapper, RESTful API, OkHttp, Jackson, Gson, Apache POI (Excel), QRCode (ZXing)

---

## 3. Cấu trúc thư mục chính

- `src/main/java/com/edu/` - Mã nguồn backend (controller, service, model, repository, DTO, helper)
- `src/main/resources/` - Cấu hình, message, tài nguyên tĩnh, template
- `src/main/webapp/views/` - Giao diện JSP (user & admin), assets (css, js, img)
- `uploads/` - Thư mục lưu trữ file upload (ảnh sản phẩm, v.v.)
- `pom.xml` - Quản lý dependencies Maven

---

## 4. Hướng dẫn cài đặt & chạy dự án

### Bước 1: Clone project
```bash
git clone <repo-url>
cd Project_Clothing_Store
```

### Bước 2: Cấu hình database
Sửa thông tin kết nối trong file `src/main/resources/application.properties` cho phù hợp với SQL Server của bạn:

```
spring.datasource.url=jdbc:sqlserver://localhost:1433;databaseName=...;
spring.datasource.username=...
spring.datasource.password=...
```

### Bước 3: Chạy ứng dụng
```bash
./mvnw spring-boot:run
```
Hoặc chạy trực tiếp file `Project_Clothing_StoreApplication.java` trong IDE (IntelliJ/VSCode/Eclipse).

### Bước 4: Truy cập hệ thống
- Trang chủ: [http://localhost:14090](http://localhost:14090)
- Đăng nhập admin: `/login` (tài khoản mẫu: `admin/admin`)
- Đăng nhập user: `/login` (tài khoản mẫu: `user/user`)

---

## 5. Một số thư mục & file quan trọng

- `controller/` – Xử lý request từ client (user, admin, sản phẩm, đơn hàng, giỏ hàng...)
- `model/` – Định nghĩa các entity: Sản phẩm, Đơn hàng, Khách hàng, Nhân viên, Tài khoản, Khuyến mãi, Đánh giá...
- `service/` – Xử lý nghiệp vụ, logic chính
- `repository/` – Tầng truy xuất dữ liệu (JPA Repository)
- `static/assets/` – CSS, JS, hình ảnh dùng chung
- `webapp/views/` – Giao diện JSP cho user và admin
- `application.properties` – Cấu hình ứng dụng, database, mail, port

---

## 6. Đóng góp
Mọi đóng góp đều được hoan nghênh! Vui lòng tạo pull request hoặc issue để thảo luận, báo lỗi hoặc đề xuất tính năng mới.

---

## 7. License
Dự án sử dụng giấy phép MIT.

---

## 8. Liên hệ & Tài liệu

- **Email hỗ trợ:** tranvandu19971029@gmail.com
- **Tài liệu chi tiết:** Xem thêm trong file `HELP.md` hoặc liên hệ trực tiếp để được hỗ trợ.

## Đóng góp
Mọi đóng góp đều được hoan nghênh! Vui lòng tạo pull request hoặc issue để thảo luận.

