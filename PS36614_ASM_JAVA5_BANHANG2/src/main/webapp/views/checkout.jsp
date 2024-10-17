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
<title>Checkout</title>
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
<script src="assets\js\vendor\modernizr-2.8.3.min.js"></script>
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
				<!--breadcrumbs area start-->
				<div class="breadcrumbs_area">
					<div class="row">
						<div class="col-12">
							<div class="breadcrumb_content">
								<ul>
									<li><a href="index.html">Trang chủ</a></li>
									<li><i class="fa fa-angle-right"></i></li>
									<li>Trang mua hàng</li>
								</ul>

							</div>
						</div>
					</div>
				</div>
				<!--breadcrumbs area end-->


				<!--Checkout page section-->
				<div class="Checkout_section">
					<div class="row">
						<div class="col-12">
							<div class="user-actions mb-20">
								<h3>
									<i class="fa fa-file-o" aria-hidden="true"></i> Khách hàng quay
									lại? <a class="Returning" href="#" data-toggle="collapse"
										data-target="#checkout_login" aria-expanded="true">Nhấn
										vào đây để đăng nhập</a>

								</h3>
								<div id="checkout_login" class="collapse"
									data-parent="#accordion">
									<div class="checkout_info">
										<p>Nếu bạn đã từng mua sắm với chúng tôi trước đây, vui
											lòng nhập thông tin của bạn vào các ô bên dưới. Nếu bạn là
											khách hàng mới, vui lòng tiếp tục đến phần Thanh toán & Giao
											hàng.</p>
										<form action="#">
											<div class="form_group mb-20">
												<label>Tài khoản hoặc email <span>*</span></label> <input
													type="text">
											</div>
											<div class="form_group mb-25">
												<label>Mật khẩu <span>*</span></label> <input type="text">
											</div>
											<div class="form_group group_3 ">
												<input value="Login" type="submit"> <label
													for="remember_box"> <input id="remember_box"
													type="checkbox"> <span> Lưu thông tin </span>
												</label>
											</div>
											<a href="#">Quên mật khẩu?</a>
										</form>
									</div>
								</div>
							</div>
							<div class="user-actions mb-20">
								<h3>
									<i class="fa fa-file-o" aria-hidden="true"></i> Khách hàng quay
									lại? <a class="Returning" href="#" data-toggle="collapse"
										data-target="#checkout_coupon" aria-expanded="true">Bấm
										vào đây để nhập mã của bạn</a>

								</h3>
								<div id="checkout_coupon" class="collapse"
									data-parent="#accordion">
									<div class="checkout_info">
										<form action="#">
											<input placeholder="Coupon code" type="text"> <input
												value="Apply coupon" type="submit">
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="checkout_form">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<form action="#">
									<h3>Chi tiết Thanh toán</h3>
									<div class="row">

										<div class="col-lg-6 mb-30">
											<label>Họ và Tên <span>*</span></label> <input id="fullName"
												type="text" required>
										</div>
										<div class="col-lg-6 mb-30">
											<label>Số điện thoại<span>*</span></label> <input
												id="phoneNumber" type="text" required>
										</div>


										<div class="col-12 mb-30">
											<label>Địa chỉ <span>*</span></label> <input id="address"
												required placeholder="Số nhà và tên đường" type="text">
										</div>


										<div class="col-12 mb-30">
											<input id="address" type="checkbox"
												data-target="createp_account"> <label class="righ_0"
												for="address" data-toggle="collapse"
												data-target="#collapsetwo" aria-controls="collapseOne">Giao
												đến địa chỉ khác?</label>

											<div id="collapsetwo" class="collapse one"
												data-parent="#accordion">
												<div class="row">
													<div class="col-lg-6 mb-30">
														<label>Họ <span>*</span></label> <input type="text">
													</div>
													<div class="col-lg-6 mb-30">
														<label>Tên <span>*</span></label> <input type="text">
													</div>
													<div class="col-12 mb-30">
														<label>Tên Công ty</label> <input type="text">
													</div>
													<div class="col-12 mb-30">
														<div class="select_form_select">
															<label for="countru_name">Quốc gia <span>*</span></label>
															<select name="cuntry" id="countru_name">
																<option value="2">Việt Nam</option>
																<option value="3">Mỹ</option>
																<option value="4">Anh Quốc</option>
																<option value="5">Hàn Quốc</option>
																<option value="6">Thái Lan</option>
																<option value="7">Trung Quốc</option>
																<option value="8">Colombia</option>
																<option value="9">Nga</option>

															</select>
														</div>
													</div>

													<div class="col-12 mb-30">
														<label>Địa chỉ <span>*</span></label> <input
															placeholder="Số nhà và tên đường" type="text">
													</div>
													<div class="col-12 mb-30">
														<input placeholder="Căn hộ, công ty (Không bắt buộc)"
															type="text">
													</div>
													<div class="col-12 mb-30">
														<label>Thị trấn / Thành phố <span>*</span></label> <input
															type="text">
													</div>
													<div class="col-12 mb-30">
														<label>Quận <span>*</span></label> <input type="text">
													</div>
													<div class="col-lg-6 mb-30">
														<label>Số điện thoại<span>*</span></label> <input
															type="text">

													</div>
													<div class="col-lg-6">
														<label> Email <span>*</span></label> <input type="text">

													</div>
												</div>
											</div>
										</div>
										<div class="col-12">
											<div class="order-notes">
												<label for="order_note">Ghi chú</label>
												<textarea id="order_note"
													placeholder="Ghi chú về đơn hàng của bạn, ví dụ ghi chú đặc biệt về việc giao hàng."></textarea>
											</div>
										</div>
									</div>
								</form>
							</div>
							<div class="col-lg-6 col-md-6">
								<form action="#">
									<h3>Đơn hàng của bạn</h3>
									<div class="order_table table-responsive mb-30">
										<table>
											<thead>
												<tr>
													<th>Sản phẩm</th>

													<th>Tổng cộng</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<c:forEach var="cartDetail"
														items="${sessionScope.cart.detail}">
														<tr id="tr-${cartDetail.value.masp}">

															<td>${cartDetail.value.tensp}<strong> × </strong>${cartDetail.value.slMua} (Size:
																${cartDetail.value.size}/Màu:
																${cartDetail.value.mauSac})
															</td>


															<td><c:choose>
																	<c:when test="${sessionScope.currency == 'USD'}">
																		<fmt:formatNumber
																			value="${cartDetail.value.giasp *
																cartDetail.value.slMua / sessionScope.usdToVnd}"
																			type="currency" currencySymbol="$" />
																	</c:when>
																	<c:when test="${sessionScope.currency == 'JPY'}">
																		<fmt:formatNumber
																			value="${cartDetail.value.giasp *
																cartDetail.value.slMua / sessionScope.jpyToVnd}"
																			type="currency" currencySymbol="¥" />
																	</c:when>
																	<c:otherwise>
																		<fmt:formatNumber
																			value="${cartDetail.value.giasp *
																cartDetail.value.slMua}"
																			type="currency" currencySymbol="VNĐ" />
																	</c:otherwise>
																</c:choose></td>
														</tr>
													</c:forEach>
												</tr>
											</tbody>
											<tfoot>
												<tr class="order_total">
													<th>Tổng tiền đơn hàng</th>
													<td><strong> <c:choose>
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
													</strong></td>
												</tr>
											</tfoot>
										</table>
									</div>
									<div class="payment_method">

										<div class="order_button">
											<button style="width: 570px" id="payNow" type="submit">Xác
												Nhận Đặt Hàng</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--Checkout page section end-->

			</div>
			<!--pos page inner end-->
		</div>
	</div>
	<!--pos page end-->
	<!--footer area start-->
	<jsp:include page="footer.jsp" />
	<!--footer area end-->

	<script>
		document.getElementById('payNow').addEventListener(
				'click',
				function() {
					console.log('Nút đã được bấm');
					var fullname = document.getElementById('fullName').value;
					var phone = document.getElementById('phoneNumber').value;
					var address = document.getElementById('address').value;
					console.log('Họ và tên:', fullname);
					console.log('Số điện thoại:', phone);
					console.log('Địa chỉ:', address);

					if (fullname.length === 0) {
						alert('Vui lòng nhập họ và tên');
						document.getElementById('fullName').focus();
						return;
					}
					if (phone.length === 0) {
						alert('Vui lòng nhập số điện thoại');
						document.getElementById('phoneNumber').focus();
						return;
					}
					if (address.length === 0) {
						alert('Vui lòng nhập địa chỉ');
						document.getElementById('address').focus();
						return;
					}

					var xhr = new XMLHttpRequest();
					xhr.open('GET', '/paying?phone='
							+ encodeURIComponent(phone) + '&address='
							+ encodeURIComponent(address), true);
					xhr.responseType = 'json';

					xhr.onload = function() {
						if (xhr.status === 200) {
							alert('Đặt hàng thành công!');
							window.location.href = "index";
						} else {
							alert('Đặt hàng thất bại, vui lòng thử lại!');
						}
					};

					xhr.onerror = function() {
						alert('Đặt hàng thất bại, vui lòng thử lại!');
					};

					xhr.send();
				});

		function numberWithDot(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
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
