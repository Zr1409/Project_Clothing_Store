package poly.edu.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.*;
import lombok.*; // Import Lombok để dùng các annotation

import java.util.Date;
//Các import khác...

@Entity
@Table(name = "san_pham_quan_ao")
@NamedQuery(name = "SanPhamQuanAo.findAll", query = "SELECT s FROM SanPhamQuanAo s")
@Data
@NoArgsConstructor
@AllArgsConstructor
@JsonIgnoreProperties(value = {"applications", "hibernateLazyInitializer"})
public class SanPhamQuanAo implements Serializable {

 private static final long serialVersionUID = 1L;

 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 @Column(name = "ma_san_pham")
 private int maSanPham;

 @Column(name = "ten_san_pham")
 private String tenSanPham;

 private double gia;

 @Column(name = "mo_ta")
 private String moTa;

 @Column(name = "duong_dan_hinh_anh")
 private String duongDanHinhAnh;

 @Column(name = "chat_lieu",columnDefinition = "NVARCHAR(50)")
 private String chatLieu;

 @Column(name = "thuong_hieu",columnDefinition = "NVARCHAR(50)")
 private String thuongHieu;

 @Temporal(TemporalType.DATE)
 @Column(name = "ngay_tao")
 private Date ngayTao = new Date(); // Gán giá trị mặc định

// @ManyToOne
// @JoinColumn(name = "ma_danh_muc", nullable = false)
// @JsonIgnore
// private DanhMucSanPhamQuanAo danhMucSanPham;

 // Phương thức gán danh sách đường dẫn hình ảnh
 
 public void setDuongDanHinhAnh(List<String> duongDanHinhAnh) {
     if (duongDanHinhAnh != null && !duongDanHinhAnh.isEmpty()) {
         this.duongDanHinhAnh = String.join(",", duongDanHinhAnh);
     } else {
         this.duongDanHinhAnh = ""; // hoặc null nếu bạn muốn
     }
 }

 public List<String> getDuongDanHinhAnh() {
     if (duongDanHinhAnh != null && !duongDanHinhAnh.isEmpty()) {
         return Arrays.asList(duongDanHinhAnh.split(","));
     }
     return new ArrayList<>(); // Trả về danh sách rỗng nếu không có dữ liệu
 }

public SanPhamQuanAo(String tenSanPham, double gia, String moTa, String duongDanHinhAnh, String chatLieu,
		String thuongHieu) {
	super();
	this.tenSanPham = tenSanPham;
	this.gia = gia;
	this.moTa = moTa;
	this.duongDanHinhAnh = duongDanHinhAnh;
	this.chatLieu = chatLieu;
	this.thuongHieu = thuongHieu;
}
 
}

