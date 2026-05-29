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
<title>Liên hệ</title>
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
				<!--header end -->
				<!--breadcrumbs area start-->
				<div class="breadcrumbs_area">
					<div class="row">
						<div class="col-12">
							<div class="breadcrumb_content">
								<ul>
									<li><a href="index.html">Trang Chủ</a></li>
									<li><i class="fa fa-angle-right"></i></li>
									<li>Liên hệ</li>
								</ul>

							</div>
						</div>
					</div>
				</div>
				<!--breadcrumbs area end-->

				<!--contact area start-->
				<div class="contact_area">
					<div class="row">
						<div class="col-lg-6 col-md-12">
							<div class="contact_message">
								<h3>Hãy cho chúng tôi biết</h3>
								<form id="contact-form" method="POST" action="assets/mail.php">
									<div class="row">
										<div class="col-lg-6">
											<input name="name" placeholder="Name *" type="text">
										</div>
										<div class="col-lg-6">
											<input name="email" placeholder="Email *" type="email">
										</div>
										<div class="col-lg-6">
											<input name="subject" placeholder="Subject *" type="text">
										</div>
										<div class="col-lg-6">
											<input name="phone" placeholder="Phone *" type="text">
										</div>

										<div class="col-12">
											<div class="contact_textarea">
												<textarea placeholder="Message *" name="message"
													class="form-control2"></textarea>
											</div>
											<button type="submit">Send Message</button>
										</div>
										<div class="col-12">
											<p class="form-messege">
										</div>
									</div>
								</form>
							</div>
						</div>

						<div class="col-lg-6 col-md-12">
							<div class="contact_message contact_info">
								<h3>Liên hệ với chúng tôi</h3>
								<p>Chúng tôi luôn sẵn sàng lắng nghe và hỗ trợ bạn. Nếu bạn
									có bất kỳ câu hỏi, góp ý, hoặc yêu cầu hỗ trợ nào, xin vui lòng
									liên hệ với chúng tôi qua các kênh dưới đây</p>
								<ul>
									<li><i class="fa fa-fax"></i> Địa chỉ : FPT Polytechnic,
										Tòa T, Tầng 10, Phòng 10.01, Công viên PMQT Quận 12, TP.HCM</li>
									<li><i class="fa fa-envelope-o"></i> <a href="#">tranvandu19971029@gmail.com</a></li>
									<li><i class="fa fa-phone"></i> 0358768117</li>
								</ul>
								<h3>
									<strong>Giờ làm việc</strong>
								</h3>
								<p>
									<strong>Thứ hai - Thứ bảy</strong>: 08AM – 22PM
								</p>
							</div>
						</div>
					</div>
				</div>

				<!--contact area end-->

				<!--contact map start-->
				<div class="contact_map">
					<div class="row">
						<div class="col-12">
							<iframe
								src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.462322180692!2d106.62452997462827!3d10.852397889301026!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752b161f50ae47%3A0x2328d1d1acc3b11a!2zVHLGsOG7nW5nIENhbyDEkeG6s25nIEZQVCBQb2x5dGVjaG5pYyBUUC5IQ00gLSBUw7JhIEY!5e0!3m2!1svi!2s!4v1722772137742!5m2!1svi!2s"
								width="500" height="450" style="border: 0;" allowfullscreen=""
								loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
						</div>
					</div>
				</div>
				<!--contact map end-->

			</div>
			<!--pos page inner end-->
		</div>
	</div>
	<!--pos page end-->

	<!--footer area start-->
	<jsp:include page="footer.jsp" />
	<!--footer area end-->






	<!-- all js here -->
	<script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
	<script src="assets\js\popper.js"></script>
	<script src="assets\js\bootstrap.min.js"></script>
	<script src="assets\js\ajax-mail.js"></script>
	<script src="assets\js\plugins.js"></script>
	<script src="assets\js\main.js"></script>
</body>
</html>
