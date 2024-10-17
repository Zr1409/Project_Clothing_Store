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
<title>Forgotpassword</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="icon" href="assets/img/favicon.png">

<!-- all css here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/plugin.css">
<link rel="stylesheet" href="assets/css/bundle.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>

<style>
.custom-button-height {
	height: 50px; /* Thay đổi chiều cao của nút */
	font-size: 1.25rem; /* Thay đổi kích thước font chữ nếu cần */
	line-height: 1.5; /* Tinh chỉnh dòng chữ nếu cần */
	display: flex;
	justify-content: center;
	align-items: center;
}

.form-label {
	color: white; /* Màu chữ của nhãn trắng */
	font-size: 18px;
}

.bg-dang {
	background-color: #21ccad; /* Màu nền sáng hơn */
	/* Bạn có thể thay đổi mã màu này theo nhu cầu của bạn */
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
				<!--breadcrumbs area start-->
				<div class="breadcrumbs_area">
					<div class="row">
						<div class="col-12">
							<div class="breadcrumb_content">
								<ul>
									<li><a href="index.html"><fmt:message
													key="mnu.home" /></a></li>
									<li><i class="fa fa-angle-right"></i></li>
									<li><fmt:message
													key="mnu.quenmatkhau" /></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!--breadcrumbs area end-->

				<!-- customer login start -->
				<!-- Main Section-->
				<section
					class="mt-0 overflow-hidden d-flex justify-content-center align-items-center p-4">
					<!-- Page Content Goes Here -->

					<!-- Login Form-->
					<div class="col col-md-8 col-lg-6 col-xxl-5">
						<!-- Logo-->
						<a
							class="navbar-brand fw-bold fs-3 flex-shrink-0 order-0 align-self-center justify-content-center d-flex mx-0 px-0"
							href="index">
							<div class="d-flex align-items-center">
								<svg class="f-w-7" viewBox="0 0 77.53 72.26"
									xmlns="http://www.w3.org/2000/svg">
                    <path
										d="M10.43,54.2h0L0,36.13,10.43,18.06,20.86,0H41.72L10.43,54.2Zm67.1-7.83L73,54.2,68.49,62,45,48.47,31.29,72.26H20.86l-5.22-9L52.15,0H62.58l5.21,9L54.06,32.82,77.53,46.37Z"
										fill="currentColor" fill-rule="evenodd" /></svg>
							</div>
						</a>
						<!-- / Logo-->
						<div class="shadow-xl p-4 p-lg-5 bg-dang">
							<h1 class="text-center fw-bold mb-5 fs-2 text-white"><fmt:message
													key="mnu.quenmatkhau" /></h1>

							<form id="login-form" action="forgotpassword" method="POST">
								<!-- Hiển thị thông báo lỗi nếu có -->
								<c:if test="${not empty requestScope.error}">
									<div class="alert alert-danger show" role="alert">
										${requestScope.error}</div>
								</c:if>
<!-- 								Hiển thị thông báo thành công nếu có -->
<%-- 								<c:if test="${not empty requestScope.message}"> --%>
<!-- 									<div class="alert alert-success show" role="alert"> -->
<%-- 										${requestScope.message}</div> --%>
<%-- 								</c:if> --%>
								<div class="form-group">
									<label class="form-label" for="login-email"><fmt:message
													key="mnu.diachiemail" /></label> <input type="email" class="form-control"
										id="login-email" name="email" placeholder="name@email.com">
								</div>

								<button type="submit"
									class="btn btn-dark d-block w-100 my-4 custom-button-height"><fmt:message
													key="mnu.xacnhan" /></button>

							</form>

						</div>

					</div>
					<!-- / Login Form-->

					<!-- /Page Content -->
				</section>
				<!-- customer login end -->
			</div>
			<!--pos page inner end-->
		</div>
	</div>

	<!--pos page end-->

	<!--footer area start-->
	<jsp:include page="footer.jsp" />
	<!--footer area end-->

	<!-- all js here -->
	<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
	<script src="assets/js/popper.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/ajax-mail.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>

