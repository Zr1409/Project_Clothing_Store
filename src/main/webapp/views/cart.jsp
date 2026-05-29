<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<c:set var="lang" value="${sessionScope.lang}" />
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="messages" />
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Giỏ hàng</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets\img\favicon.png">

<!-- all css here -->
<link rel="stylesheet" href="assets\css\bootstrap.min.css">
<link rel="stylesheet" href="assets\css\plugin.css">
<link rel="stylesheet" href="assets\css\bundle.css">
<link rel="stylesheet" href="assets\css\style.css">
<link rel="stylesheet" href="assets\css\responsive.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<script src="assets\js\vendor\modernizr-2.8.3.min.js"></script>
<style>
.table_desc {
	margin: 0px; /* Thêm khoảng cách xung quanh bảng */
}

.cart_page {
	overflow-x: auto; /* Thêm thanh cuộn ngang nếu cần */
}

.cart_page table {
	width: 100%;
	max-width: 100%;
	/* Đảm bảo bảng không vượt quá chiều rộng của container */
	table-layout: fixed; /* Cố định kích thước bảng */
	border-collapse: collapse; /* Xóa khoảng cách giữa các ô */
}

.cart_page th, .cart_page td {
	padding: 10px; /* Thêm padding để tạo khoảng cách */
	text-align: center; /* Căn giữa nội dung */
	border: 1px solid #ccc; /* Thêm border cho các ô */
	background-color: #f9f9f9; /* Màu nền cho ô */
}

/* Nếu muốn tạo khoảng cách giữa các ô, có thể thêm margin-bottom cho mỗi th */
.cart_page th {
	margin-bottom: 5px; /* Thêm khoảng cách dưới các th */
}

.product_remove {
	width: 70px; /* Chiều rộng cột xóa */
}

.product_thumb {
	width: 100px; /* Chiều rộng cột hình ảnh */
}

.product_name {
	width: 100px; /* Chiều rộng cột tên sản phẩm */
}

.product_size {
	width: 100px; /* Chiều rộng cột tên sản phẩm */
}

.product_color {
	width: 100px; /* Chiều rộng cột tên sản phẩm */
}

.product_quantity {
	width: 80px; /* Chiều rộng cột số lượng */
}

.product-price {
	width: 120px; /* Chiều rộng cột giá */
}

.product_total {
	width: 120px; /* Chiều rộng cột tổng cộng */
}

/* Thêm kiểu cho các nút */
.btn {
	padding: 5px 10px; /* Khoảng cách trong nút */
}

/* Kiểm tra các hình ảnh không vượt quá chiều rộng của cột */
.product_thumb img {
	max-width: 100%; /* Giới hạn chiều rộng hình ảnh */
	height: auto; /* Tự động điều chỉnh chiều cao */
}
</style>
</head>
<body>
	<!-- Add your site or application content here -->

	<!--pos page start-->
	<div class="pos_page">
		<div class="container">
			<!--pos page inner-->
			<div class="pos_page_inner">
				<!--header area -->

				<jsp:include page="header.jsp" />

				<!--header end -->
				<!--header end -->
				<!--breadcrumbs area start-->
				<div class="breadcrumbs_area">
					<div class="row">
						<div class="col-12">
							<div class="breadcrumb_content">
								<ul>
									<li><a href="index.html"><fmt:message key="mnu.home1" /></a></li>
									<li><i class="fa fa-angle-right"></i></li>
									<li><fmt:message key="mnu.mycart" /></li>
								</ul>

							</div>
						</div>
					</div>
				</div>
				<!--breadcrumbs area end-->



				<!--shopping cart area start -->
				<div class="shopping_cart_area">
					<form action="#">
						<div class="row">
							<div class="col-12">
								<div class="table_desc">
									<div class="cart_page table-responsive">
										<c:if test="${not empty sessionScope.cart.detail}">
											<table>
												<thead>
													<tr>
														<th class="product_remove">Xóa</th>
														<th class="product_thumb">Hình Ảnh</th>
														<th class="product_name">Sản Phẩm</th>
														<th class="product_size">Size</th>
														<th class="product_color">Màu Sắc</th>
														<th class="product_quantity">Số Lượng</th>
														<th class="product-price">Giá</th>
														<th class="product_total">Tổng cộng</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="cartDetail"
														items="${sessionScope.cart.detail}">
														<tr id="tr-${cartDetail.value.masp}">
															<td>
																<button onclick="removeSP('${cartDetail.value.masp}')"
																	class="btn btn-danger" type="button"
																	style="text-align: center; /* Căn giữa nội dung */ justify-content: center; border: none;">
																	<i class="fas fa-trash-alt" style="font-size: 20px;"></i>
																	<!-- Biểu tượng thùng rác -->
																</button>
															</td>


															<td class="product_thumb"><a href="#"><img
																	src="assets/img/product/${cartDetail.value.hinh[0]}"
																	alt=""></a></td>
															<td class="product_name"><a href="#">${cartDetail.value.tensp}</a></td>
															<td>${cartDetail.value.size}</td>
															<td>${cartDetail.value.mauSac}</td>
															<td><input id="slMua-${cartDetail.value.masp}"
																onchange="updateCart('${cartDetail.value.masp}')"
																type="number" value="${cartDetail.value.slMua}"></td>
															<td class="product-price">
																<c:choose>
																	<c:when test="${sessionScope.currency == 'USD'}">
																		<fmt:formatNumber
																			value="${cartDetail.value.giasp / sessionScope.usdToVnd}"
																			type="currency" currencySymbol="$" />
																	</c:when>
																	<c:when test="${sessionScope.currency == 'JPY'}">
																		<fmt:formatNumber
																			value="${cartDetail.value.giasp / sessionScope.jpyToVnd}"
																			type="currency" currencySymbol="¥" />
																	</c:when>
																	<c:otherwise>
																		<fmt:formatNumber
																			value="${cartDetail.value.giasp}" type="currency"
																			currencySymbol="VNĐ" />
																	</c:otherwise>
																</c:choose>
															</td>
															<td class="product_total"><span
																id="totalSP-${cartDetail.value.masp}">
																<c:choose>
																	<c:when test="${sessionScope.currency == 'USD'}">
																		<fmt:formatNumber
																			value="${cartDetail.value.giasp*cartDetail.value.slMua / sessionScope.usdToVnd}"
																			type="currency" currencySymbol="$" />
																	</c:when>
																	<c:when test="${sessionScope.currency == 'JPY'}">
																		<fmt:formatNumber
																			value="${cartDetail.value.giasp*cartDetail.value.slMua / sessionScope.jpyToVnd}"
																			type="currency" currencySymbol="¥" />
																	</c:when>
																	<c:otherwise>
																		<fmt:formatNumber
																			value="${cartDetail.value.giasp*cartDetail.value.slMua}" type="currency"
																			currencySymbol="VNĐ" />
																	</c:otherwise>
																</c:choose>
																</span>
																</td>
														</tr>
														<input type="hidden" id="giaSP-${cartDetail.value.masp}"
															value="${cartDetail.value.giasp}" />
													</c:forEach>
												</tbody>
											</table>
										</c:if>
										<c:if test="${empty sessionScope.cart.detail}">
											<p style="font-size: 20px;">Giỏ hàng của bạn đang trống.</p>
										</c:if>
									</div>
								</div>


							</div>
						</div>
						<!--coupon code area start-->
						<div class="coupon_area">
							<div class="row">
								<div class="col-lg-6 col-md-6">
									<div class="coupon_code">
										<h3>Phiếu mua hàng</h3>
										<div class="coupon_inner">
											<input
												placeholder="Nhập mã phiếu giảm giá của bạn nếu bạn có"
												type="text">
											<button type="submit">Áp dụng phiếu giảm giá</button>
										</div>
									</div>
								</div>
								<div class="col-lg-6 col-md-6">
									<div class="coupon_code">
										<h3>Tổng số giỏ hàng</h3>
										<div class="coupon_inner">
											<div class="cart_subtotal">
												<p>Tổng tiền sản phẩm</p>
												<p class="cart_amount">
													<%-- 													<strong id="tongTien"><fmt:formatNumber --%>
													<%-- 															type="number" maxFractionDigits="3" --%>
													<%-- 															value="${sessionScope.cart.tongtien}" /></strong> --%>
													<!-- 															<strong>VNĐ</strong> -->
													<strong id="tongTien"> <c:choose>
															<c:when test="${sessionScope.currency == 'USD'}">
																<fmt:formatNumber
																	value="${sessionScope.cart.tongtien / sessionScope.usdToVnd}"
																	type="currency" currencySymbol="$" />
															</c:when>
															<c:when test="${sessionScope.currency == 'JPY'}">
																<fmt:formatNumber
																	value="${sessionScope.cart.tongtien / sessionScope.jpyToVnd}"
																	type="currency" currencySymbol="¥" />
															</c:when>
															<c:otherwise>
																<fmt:formatNumber value="${sessionScope.cart.tongtien}"
																	type="currency" currencySymbol="VNĐ" />
															</c:otherwise>
														</c:choose>
													</strong>

												</p>

											</div>

											<!-- 											<a href="#">Phí vận chuyển</a> -->

											<!-- 											<div class="cart_subtotal"> -->
											<!-- 												<p>Tổng cộng</p> -->
											<!-- 												<p class="cart_amount">$215.00</p> -->
											<!-- 											</div> -->
											<%-- 											<c:choose> --%>
											<%-- 												<c:when test="${not empty sessionScope.khachHang}"> --%>

											<div class="checkout_btn">
												<a href="checkout">Check Out</a>
											</div>
											<%-- 												</c:when> --%>
											<%-- 												<c:otherwise> --%>
											<!-- 													<div class="checkout_btn mt-3"> -->
											<!-- 														<a href="login">Check Out</a> -->
											<!-- 													</div> -->
											<%-- 												</c:otherwise> --%>
											<%-- 											</c:choose> --%>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--coupon code area end-->
					</form>
				</div>
				<!--shopping cart area end -->

			</div>
			<!--pos page inner end-->
		</div>
	</div>
	<!--pos page end-->

	<!--footer area start-->
	<jsp:include page="footer.jsp" />
	<!--footer area end-->
	<script>
		function removeSP(maSP) {
			// Lấy giá trị size từ dropdown
			var size = $('#sizeSP').val();

			// Lấy giá trị màu sắc từ input ẩn được chọn
			var color = $('#selectedColor').val();

			$
					.ajax(
							{
								url : '/add?maSanPham=' + maSP
										+ '&soluong=0&isUpdate=0' + '&size='
										+ size + '&color=' + color,

								dataType : 'json'
							})
					.then(
							function(data) {
								$('#tongTien').text(
										numberWithDot(data.tongtien));
								$('#countTotal').text(data.tongsl);
								var idRemoveTag = '#tr-' + maSP;
								$(idRemoveTag).remove();
								// Kiểm tra nếu giỏ hàng đã trống
								if (data.tongsl === 0) {
									$('.table_desc')
											.html(
													'<p style="font-size: 20px;">Giỏ hàng của bạn đang trống.</p>');
								}
							}).fail(function(error) {
						alert('Xóa thất bại, vui lòng thử lại!');
					});
		}

		function updateCart(maSP) {
			// Lấy giá trị size từ dropdown
			var size = $('#sizeSP').val();

			// Lấy giá trị màu sắc từ input ẩn được chọn
			var color = $('#selectedColor').val();
			var idInputSL = '#slMua-' + maSP;
			var slUpdate = $(idInputSL).val();
			var idInputGiaSP = '#giaSP-' + maSP;
			var giaSP = parseFloat($(idInputGiaSP).val());
			if (parseInt(slUpdate) < 1) {
				removeSP(maSP);
			} else {
				$.ajax(
						{
							url : '/add?maSanPham=' + maSP + '&soluong='
									+ slUpdate + '&isUpdate=1' + '&size='
									+ size + '&color=' + color,
							dataType : 'json'
						}).then(
						function(data) {
							$('#tongTien').text(data.tongtien);
							$('#countTotal').text(data.tongsl);
							var tongTienSPUpdate = parseFloat(giaSP
									* parseInt(slUpdate));
							let idTongGiaSP = '#totalSP-' + maSP;
							$(idTongGiaSP).text(tongTienSPUpdate);
						}).fail(function(error) {
					alert('Cập nhật thất bại, vui lòng thử lại!');
				});
			}
		}

		// 		$('#payNow').click(
		// 				function() {					
		// 					var phone = $('#phoneNumber').val();
		// 					var address = $('#address').val();
		// 					if (phone.length == 0) {
		// 						alert('Vui lòng nhập sdt');
		// 						$('#phoneNumber').focus();
		// 						return;
		// 					}
		// 					;
		// 					if (address.length == 0) {
		// 						alert('Vui lòng nhập địa chỉ');
		// 						$('#address').focus();
		// 						return;
		// 					}

		// 					$.ajax(
		// 							{
		// 								url : 'cart?action=paying&phone=' + phone
		// 										+ '&address=' + address,
		// 								dataType : 'json'
		// 							}).then(function(data) {
		// 						alert('Thanh toán thành công!');
		// 						window.location.href = "index";
		// 					}).fail(function(error) {
		// 						alert('Thanh toán thất bại, vui lòng thử lại!');
		// 					});
		// 				})

		function numberWithDot(x) {
			return x.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ".");
		}
	</script>





	<!-- all js here -->
	<script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
	<script src="assets\js\popper.js"></script>
	<script src="assets\js\bootstrap.min.js"></script>
	<script src="assets\js\ajax-mail.js"></script>
	<script src="assets\js\plugins.js"></script>
	<script src="assets\js\main.js"></script>
</body>
</html>
