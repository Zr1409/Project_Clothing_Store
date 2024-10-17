-- Tạo cơ sở dữ liệu
CREATE DATABASE quanlybanhang2_java5_PS36614;
GO

-- Sử dụng cơ sở dữ liệu
USE quanlybanhang2_java5_PS36614;

-- 1. Tạo bảng Danh Mục Sản Phẩm
DROP TABLE IF EXISTS danh_muc_san_pham_quan_ao;
CREATE TABLE danh_muc_san_pham_quan_ao (
    ma_danh_muc INT IDENTITY(1,1) PRIMARY KEY,
    ten_danh_muc NVARCHAR(255) NOT NULL
);

-- 2. Tạo bảng Tài Khoản
DROP TABLE IF EXISTS tai_khoan;
CREATE TABLE tai_khoan (
    ma_tai_khoan INT IDENTITY(1,1) PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    mat_khau VARCHAR(255) NOT NULL,
    --vai_tro VARCHAR(50) DEFAULT 'khach_hang', -- Mặc định là khách hàng
	vai_tro VARCHAR(50),
    ngay_tao DATE DEFAULT GETDATE()
);



-- 3. Tạo bảng Khách Hàng
DROP TABLE IF EXISTS khach_hang;
CREATE TABLE khach_hang (
    ma_khach_hang INT IDENTITY(1,1) PRIMARY KEY,
    ten_khach_hang NVARCHAR(255),
    dia_chi NVARCHAR(255) NOT NULL,
    so_dien_thoai VARCHAR(15) NOT NULL,
	ma_tai_khoan INT,
    FOREIGN KEY (ma_tai_khoan) REFERENCES tai_khoan(ma_tai_khoan)
);
-- Bảng Nhân Viên
CREATE TABLE nhan_vien (
    ma_nhan_vien INT IDENTITY(1,1) PRIMARY KEY,
    ten_nhan_vien NVARCHAR(255),
	dia_chi_nhan_vien NVARCHAR(255) NOT NULL,
    so_dien_thoai_nhan_vien VARCHAR(15) NOT NULL,
    ma_tai_khoan INT,
    FOREIGN KEY (ma_tai_khoan) REFERENCES tai_khoan(ma_tai_khoan)
);


-- 4. Tạo bảng Sản Phẩm
DROP TABLE IF EXISTS san_pham_quan_ao;
CREATE TABLE san_pham_quan_ao (
    ma_san_pham INT IDENTITY(1,1) PRIMARY KEY,
    ten_san_pham NVARCHAR(255),
    mo_ta NVARCHAR(255),
    gia DECIMAL(10, 2),
    duong_dan_hinh_anh VARCHAR(255),
    ma_danh_muc INT,          
    chat_lieu NVARCHAR(50),         
    thuong_hieu NVARCHAR(50),     
    ngay_tao DATE DEFAULT GETDATE(),
    FOREIGN KEY (ma_danh_muc) REFERENCES danh_muc_san_pham_quan_ao(ma_danh_muc)
);

ALTER TABLE san_pham_quan_ao 
ALTER COLUMN chat_lieu NVARCHAR(50);
ALTER TABLE san_pham_quan_ao 
ALTER COLUMN thuong_hieu NVARCHAR(50);
-- 5. Tạo bảng Đơn Hàng
DROP TABLE IF EXISTS don_hang;
CREATE TABLE don_hang (
    ma_don_hang INT IDENTITY(1,1) PRIMARY KEY,
    tong_tien DECIMAL(10, 2),
    dia_chi NVARCHAR(255),
    dien_thoai VARCHAR(15),
    ma_khach_hang INT,
    ngay_tao DATE DEFAULT GETDATE(),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang)
);
select *from don_hang
select *from san_pham_quan_ao
select *from tai_khoan
select *from nhan_vien
select *from khach_hang
select *from chi_tiet_don_hang



-- 6. Tạo bảng Chi Tiết Đơn Hàng
DROP TABLE IF EXISTS chi_tiet_don_hang;
CREATE TABLE chi_tiet_don_hang (
    ma_chi_tiet_don_hang INT IDENTITY(1,1) PRIMARY KEY,
    so_luong INT NOT NULL,
    gia DECIMAL(10, 2) NOT NULL,
    ma_don_hang INT,
    ma_san_pham INT,
    mau_sac NVARCHAR(50),  -- Cột màu sắc
    size VARCHAR(10),     -- Cột size (bạn có thể dùng INT nếu size theo mã số)
    FOREIGN KEY (ma_don_hang) REFERENCES don_hang(ma_don_hang),
    FOREIGN KEY (ma_san_pham) REFERENCES san_pham_quan_ao(ma_san_pham)
);

ALTER TABLE chi_tiet_don_hang 
ALTER COLUMN mau_sac NVARCHAR(50);


-- 7. Tạo bảng Đánh Giá
DROP TABLE IF EXISTS danh_gia;
CREATE TABLE danh_gia (
    ma_danh_gia INT IDENTITY(1,1) PRIMARY KEY,
    binh_luan NVARCHAR(255),
    diem_danh_gia INT CHECK (diem_danh_gia BETWEEN 1 AND 5), -- Giới hạn điểm đánh giá từ 1 đến 5
    ma_khach_hang INT,
    ma_san_pham INT,
    ngay_danh_gia DATE DEFAULT GETDATE(),
    FOREIGN KEY (ma_khach_hang) REFERENCES khach_hang(ma_khach_hang),
    FOREIGN KEY (ma_san_pham) REFERENCES san_pham_quan_ao(ma_san_pham)
);

-- 8. Tạo bảng Thống Kê
DROP TABLE IF EXISTS thong_ke;
CREATE TABLE thong_ke (
    ma_thong_ke INT IDENTITY(1,1) PRIMARY KEY,
    diem_danh_gia_trung_binh DECIMAL(5, 2),
    doanh_thu DECIMAL(15, 2),
    ngay_thong_ke DATE,
    tong_don_hang INT,
    tong_khach_hang INT,
    tong_san_pham INT
);

-- 9. Tạo bảng Lịch Sử Giao Dịch
DROP TABLE IF EXISTS lich_su_giao_dich;
CREATE TABLE lich_su_giao_dich (
    ma_giao_dich INT IDENTITY(1,1) PRIMARY KEY,
    ma_don_hang INT,
    ngay_giao_dich DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ma_don_hang) REFERENCES don_hang(ma_don_hang)
);

-- 10. Tạo bảng Khuyến Mãi
DROP TABLE IF EXISTS khuyen_mai;
CREATE TABLE khuyen_mai (
    ma_khuyen_mai INT IDENTITY(1,1) PRIMARY KEY,
    ten_khuyen_mai NVARCHAR(255),
    phan_tram_giam_gia DECIMAL(5, 2) CHECK (phan_tram_giam_gia BETWEEN 0 AND 100), -- Phần trăm giảm giá
    ngay_bat_dau DATE,
    ngay_ket_thuc DATE
);

-- 11. Tạo bảng Sản Phẩm Khuyến Mãi
DROP TABLE IF EXISTS san_pham_khuyen_mai;
CREATE TABLE san_pham_khuyen_mai (
    ma_san_pham_khuyen_mai INT IDENTITY(1,1) PRIMARY KEY,
    ma_san_pham INT,
    ma_khuyen_mai INT,
    FOREIGN KEY (ma_san_pham) REFERENCES san_pham_quan_ao(ma_san_pham),
    FOREIGN KEY (ma_khuyen_mai) REFERENCES khuyen_mai(ma_khuyen_mai)
);

-- 12. Thêm dữ liệu mẫu vào bảng Danh Mục Sản Phẩm
INSERT INTO danh_muc_san_pham_quan_ao (ten_danh_muc) VALUES
(N'Áo'),
(N'Quần');


-- 13. Thêm dữ liệu mẫu vào bảng Tài Khoản
INSERT INTO tai_khoan (email, mat_khau, vai_tro) VALUES
('admin@example.com', 'adminpassword', 'admin'),
('nhanvien@example.com', 'staffpassword', 'nhan_vien'),
('khachhang1@example.com', 'userpassword', 'khach_hang'),
('khachhang2@example.com', 'userpassword', 'khach_hang'),
('tranvandu19971029@gmai.com', '123', 'admin');

-- 14. Thêm dữ liệu mẫu vào bảng Khách Hàng
INSERT INTO khach_hang (ten_khach_hang, dia_chi, so_dien_thoai, ma_tai_khoan) VALUES
(N'Nguyễn Văn A', N'123 Đường A, TP.HCM', '0123456789', 3),
(N'Nguyễn Văn B', N'456 Đường B, TP.HCM', '0987654321', 4);

-- 15. Thêm dữ liệu mẫu vào bảng Sản Phẩm
INSERT INTO san_pham_quan_ao (ten_san_pham, mo_ta, gia, duong_dan_hinh_anh, ma_danh_muc, chat_lieu, thuong_hieu) 
VALUES
(N'Áo Thun Nam', N'Áo thun nam chất liệu cotton', 200000, 'product1.jpg,product4.jpg,product5.jpg', 1, N'Cotton', N'Nike'),
(N'Quần Jean Nữ', N'Quần jean nữ thời trang', 300000, 'product2.jpg,product8.jpg,product9.jpg', 2, N'Denim', N'Levis'),
(N'Vòng Tay Phong Thủy', N'Vòng tay phong thủy cho nữ', 150000, 'product3.jpg,product6.jpg,trinh.jpg', 1, N'Gỗ', N'Phong Thủy Thạch'),
(N'Giày Sneaker', N'Giày sneaker phong cách Hàn Quốc', 500000, 'product4.jpg,product3.jpg,product7.jpg', 2, N'Vải tổng hợp', N'Adidas'),
(N'Quần Jean Nữ', N'Quần jean nữ thời trang', 400000, 'product5.jpg,product6.jpg,blog4.jpg', 1, N'Denim', N'Zara'),
(N'Quần Jean Nữ', N'Quần jean nữ thời trang', 500000, 'product6.jpg,product13.jpg,blog5.jpg', 2, N'Denim', N'Calvin Klein'),
(N'Quần Jean Nữ', N'Quần jean nữ thời trang', 300000, 'product7.jpg,trinh.jpg,blog2.jpg', 2, N'Denim', N'H&M'),
(N'Quần Jean Nữ', N'Quần jean nữ thời trang', 600000, 'product8.jpg,product9.jpg,blog3.jpg', 1, N'Denim', N'Gucci'),
(N'Quần Jean Nữ', N'Quần jean nữ thời trang', 700000, 'product9.jpg,product2.jpg,product8.jpg', 1, N'Denim', N'Prada'),
(N'Quần Jean Nữ', N'Quần jean nữ thời trang', 350000, 'product13.jpg,blog2.jpg,blog3.jpg', 2, N'Denim', N'Uniqlo');


-- 16. Thêm dữ liệu mẫu vào bảng Đơn Hàng
INSERT INTO don_hang (tong_tien, dia_chi, dien_thoai, ma_khach_hang) VALUES
(200000, N'123 Đường A, TP.HCM', '0123456789', 1),
(300000, N'456 Đường B, TP.HCM', '0987654321', 2);

-- 17. Thêm dữ liệu mẫu vào bảng Chi Tiết Đơn Hàng
INSERT INTO chi_tiet_don_hang (so_luong, gia, ma_don_hang, ma_san_pham, mau_sac, size) VALUES
(1, 200000, 1, 4, N'Màu đỏ',  N'S'),
(2, 300000, 2, 5, N'Màu trắng',  N'L');

-- 18. Thêm dữ liệu mẫu vào bảng Đánh Giá
INSERT INTO danh_gia (binh_luan, diem_danh_gia, ma_khach_hang, ma_san_pham) VALUES
(N'Rất tốt', 5, 1, 4),
(N'Khá ổn', 4, 2, 5);

-- 19. Thêm dữ liệu mẫu vào bảng Thống Kê
INSERT INTO thong_ke (diem_danh_gia_trung_binh, doanh_thu, ngay_thong_ke, tong_don_hang, tong_khach_hang, tong_san_pham) VALUES
(4.5, 500000, GETDATE(), 2, 2, 4);

-- 20. Thêm dữ liệu mẫu vào bảng Khuyến Mãi
INSERT INTO khuyen_mai (ten_khuyen_mai, phan_tram_giam_gia, ngay_bat_dau, ngay_ket_thuc) VALUES
(N'Khuyến mãi mùa hè', 20, '2024-06-01', '2024-06-30');

-- 21. Thêm dữ liệu mẫu vào bảng Sản Phẩm Khuyến Mãi
INSERT INTO san_pham_khuyen_mai (ma_san_pham, ma_khuyen_mai) VALUES
(4, 1), -- Áo Thun Nam
(5, 1); -- Quần Jean Nữ
-- Bước 1: Xóa ràng buộc kiểm tra
ALTER TABLE khuyen_mai DROP CONSTRAINT CK__khuyen_ma__phan___6D0D32F4;

-- Bước 2: Thay đổi kiểu dữ liệu
ALTER TABLE khuyen_mai 
ALTER COLUMN phan_tram_giam_gia NUMERIC(38,2);

-- Bước 3: Tạo lại ràng buộc kiểm tra (nếu cần)
ALTER TABLE khuyen_mai 
ADD CONSTRAINT CK__khuyen_ma__phan___6D0D32F4 CHECK (phan_tram_giam_gia >= 0 AND phan_tram_giam_gia <= 100);
