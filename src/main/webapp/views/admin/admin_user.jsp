<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="lang" value="${sessionScope.lang}" />
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" type="image/x-icon"
	href="assets\img\favicon.png">
<title>Quản lý người dùng</title>
<link rel="stylesheet" href="/views/admin/css/fontawesome.min.css">
<!--    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />-->
<!--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>-->
<link rel="stylesheet" type="text/css"
	href="/views/admin/css/datatables.min.css" />
<script src="/views/admin/js/moment.min.js"></script>
<link href="/views/admin/css/styles.css" rel="stylesheet" />
<!--    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>-->
</head>
<body class="sb-nav-fixed">

	<nav class="sb-topnav navbar navbar-expand navbar-dark "
		style="background-color: #00bba6;">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="#">Quản lý người dùng</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars" style="color: white;"></i>
		</button>
		<div class="switcher">
			<ul class="list-unstyled d-flex align-items-center m-0">
				<li class="languages dropdown position-relative"><a href="#"
					id="current-language" class="d-flex align-items-center"
					data-bs-toggle="dropdown" aria-expanded="false"
					style="text-decoration: none; color: white;"> <c:choose>
							<c:when test="${lang == 'vi'}">
								<img src="assets/img/logo/viet-nam.svg" alt="" class="me-2"> Việt Nam
                    </c:when>
							<c:when test="${lang == 'ja'}">
								<img src="assets/img/logo/Japan.svg" alt="" class="me-2"> Nhật Bản
                    </c:when>
							<c:otherwise>
								<img src="assets/img/logo/united-states.svg" alt="" class="me-2"> English
                    </c:otherwise>
						</c:choose> <i class="fa fa-angle-down ms-2"></i>
				</a>
					<ul class="dropdown-menu position-absolute">
						<li><a class="dropdown-item" href="ChangeLang?lang=vi"
							onclick="changeLanguage('vi'); return false;"
							style="text-decoration: none;"> <img
								src="assets/img/logo/viet-nam.svg" alt="" class="me-2">
								Việt Nam
						</a></li>
						<li><a class="dropdown-item" href="ChangeLang?lang=ja"
							onclick="changeLanguage('ja'); return false;"
							style="text-decoration: none;"> <img
								src="assets/img/logo/Japan.svg" alt="" class="me-2"> Nhật
								Bản
						</a></li>
						<li><a class="dropdown-item" href="ChangeLang?lang=en"
							onclick="changeLanguage('en'); return false;"
							style="text-decoration: none;"> <img
								src="assets/img/logo/united-states.svg" alt="" class="me-2">
								English
						</a></li>
					</ul></li>
				<li class="currency dropdown position-relative ms-3"><a
					href="#" class="d-flex align-items-center"
					data-bs-toggle="dropdown" aria-expanded="false"
					style="text-decoration: none; color: white;"> <fmt:message
							key="mnu.currency" /> <c:out value="${sessionScope.currency}" />
						<i class="fa fa-angle-down ms-2"></i>
				</a>
					<ul class="dropdown-menu position-absolute">
						<li><a class="dropdown-item" href="#"
							style="text-decoration: none;">Vietnamese (VNĐ)</a></li>
						<li><a class="dropdown-item" href="#"
							style="text-decoration: none;">Dollar (USD)</a></li>
						<li><a class="dropdown-item" href="#"
							style="text-decoration: none;">Japan (JPY)</a></li>
					</ul></li>
			</ul>
		</div>

		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<input class="form-control" type="text" placeholder="Search for..."
					aria-label="Search for..." aria-describedby="btnNavbarSearch" />
				<button class="btn btn-primary" id="btnNavbarSearch" type="button">
					<i class="fas fa-search"></i>
				</button>
			</div>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="logout">Logout</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion" style="background-color: #00bba6;">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading" style="color: white;">Core</div>
						<a style="color: white;" class="nav-link" href="index">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt" style="color: white;"></i>
							</div> Trang chủ
						</a>
						<div class="sb-sidenav-menu-heading" style="color: white;">Trang
							quản lý</div>
						<a class="nav-link" href="/admin_user" style="color: white;">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table" style="color: white;"></i>
							</div> Quản lý nhân viên
						</a> <a class="nav-link" href="/admin_product" style="color: white;">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table" style="color: white;"></i>
							</div> Quản lý sản phẩm
						</a> <a class="nav-link collapsed" style="color: white;"
							href="/admin/tour" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns" style="color: white;"></i>
							</div> Thống kê
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/admin_doanhthu" style="color: white;">Thống
									kê doanh thu</a> <a class="nav-link" href="/admin/tour"
									style="color: white;">Thống kê sản phẩm</a> <a class="nav-link"
									href="/admin/tour" style="color: white;">Thống kê đơn hàng</a>
							</nav>
						</div>
						<a class="nav-link" href="/admin_donhang" style="color: white;">
							<div class="sb-nav-link-icon">
								<i class="fas fa-table" style="color: white;"></i>
							</div> Quản lý đơn hàng
						</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">User name:
						${sessionScope.khachHang.tenKhachHang}</div>
					Vai trò: ${sessionScope.taiKhoan.vaiTro}
				</div>

			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
					<h1 class="mt-4">Quản lý nhân viên</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="index.html">Trang
								chủ</a></li>
						<li class="breadcrumb-item active">Quản lý nhân viên</li>
					</ol>
					<div class="container-fluid px-4">


						<!-- Form đăng ký nhân viên -->
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-user-plus me-1"></i> Thêm nhân viên
							</div>
							<div class="card-body d-flex justify-content-center">
								<div class="form-container"
									style="max-width: 450px; width: 100%;">
									<form:form action="/admin_user" modelAttribute="nhanVien">
										<c:if test="${not empty requestScope.error}">
											<div class="alert alert-danger show" role="alert">
												${requestScope.error}</div>
										</c:if>
										<div class="form-group mt-5 mb-3">
											<label class="form-label" for="register-fname"><fmt:message
													key="mnu.fullname" /></label> <input
												value="${nhanVien.tenNhanVien}" type="text"
												class="form-control" name="username" id="register-fname"
												placeholder="<fmt:message key='mnu.enteryourfullname' />"
												required>
										</div>

										<div class="form-group mb-3">
											<label class="form-label" for="register-email"><fmt:message
													key="mnu.diachiemail" /></label> <input
												value="${nhanVien.taiKhoan.email}" type="email"
												class="form-control" id="register-email" name="email"
												placeholder="name@email.com" required>
										</div>

										<div class="form-group mb-3">
											<label class="form-label" for="register-password"><fmt:message
													key="mnu.matkhau" /></label> <input
												value="${nhanVien.taiKhoan.matKhau }" type="password"
												class="form-control" id="register-password" name="password"
												placeholder="<fmt:message key='mnu.enteryourpassword' />"
												required>
										</div>

										<div class="form-group mb-3">
											<label class="form-label" for="register-cfmpassword"><fmt:message
													key="mnu.xacnhanmatkhau" /></label> <input
												value="${nhanVien.taiKhoan.matKhau }" type="password"
												class="form-control" id="register-cfmpassword"
												name="cfmpassword"
												placeholder="<fmt:message key='mnu.confirmyourpassword' />"
												required>
										</div>

										<div class="form-group mb-3">
											<label for="role"><fmt:message key='mnu.vaitro' /></label> <select
												value="${nhanVien.taiKhoan.vaiTro
												}"
												class="form-control" id="role" name="role" required>
												<option value="nhanvien"><fmt:message
														key='mnu.nhanvien' /></option>
												<option value="admin"><fmt:message
														key='mnu.quantri' /></option>
											</select>
										</div>

										<div class="form-group mb-3">
											<label class="form-label" for="register-address"><fmt:message
													key="mnu.diachi" /></label> <input
												value="${nhanVien.diaChiNhanVien}" type="text"
												class="form-control" name="address" id="register-address"
												placeholder="<fmt:message key='mnu.enteryouraddress' />"
												required>
										</div>

										<div class="form-group mb-3">
											<label class="form-label" for="register-phone"><fmt:message
													key="mnu.sodienthoai" /></label> <input
												value="${nhanVien.soDienThoaiNhanVien }" type="text"
												class="form-control" id="register-phone" name="phone"
												placeholder="<fmt:message key='mnu.enteryourphone' />"
												required>
										</div>

										<div class="text-center">
											<!-- Create Button -->
											<button type="submit" class="btn btn-primary mx-2"
												formaction="/admin_user/create">
												<i class="fas fa-plus-circle"></i> Create
											</button>

											<!-- Update Button -->
											<button type="submit" class="btn btn-warning mx-2"
												formaction="/admin_user/update/${nhanVien.maNhanVien}">
												<i class="fas fa-edit"></i> Update
											</button>


											<!-- Delete Button -->


											<!-- Reset Button -->
											<a class="btn btn-info mx-2" href="/admin_user"> <i
												class="fas fa-undo"></i> Reset
											</a>
										</div>
									</form:form>
								</div>
							</div>
						</div>
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> Bảng dữ liệu nhân viên
							</div>
							<div class="card-body">
								<table
									class="table table-striped table-bordered table-hover mt-3">
									<thead class="table-info">

										<tr>
											<th>ID</th>
											<th>Họ và tên</th>
											<th>Email</th>
											<th>Vai trò</th>
											<th>Số điện thoại</th>
											<th>Địa chỉ</th>
											<th>Action</th>

										</tr>
									</thead>


									<tbody>
										<c:forEach var="item" items="${nhanViens}">
											<tr>
												<td>${item.maNhanVien}</td>
												<td>${item.tenNhanVien}</td>
												<td>${item.taiKhoan.email}</td>
												<!-- Hiển thị email -->
												<td>${item.taiKhoan.vaiTro}</td>
												<!-- Hiển thị vai trò -->
												<td>${item.soDienThoaiNhanVien}</td>
												<td>${item.diaChiNhanVien}</td>
												<td><a href="/admin_user/edit/${item.maNhanVien}"
													class="btn btn-sm btn-warning">Edit</a> <a
													href="/admin_user/delete/${item.maNhanVien}"
													class="btn btn-sm btn-danger">Delete</a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
	<script src="/views/admin/js/jquery.js"></script>
	<script src="/views/admin/js/boostrap-bundle.min.js"></script>
	<script src="/views/admin/js/scripts.js"></script>
	<script type="text/javascript" src="/views/admin/js/datatables.min.js"></script>
	<script src="/views/admin/js/all.min.js"></script>
	<script src="/views/admin/js/ckeditor.js"></script>
	<script>
		function changeLanguage(lang) {
			const currentLangElement = document
					.getElementById('current-language');
			if (lang === 'vi') {
				currentLangElement.innerHTML = '<img src="assets/img/logo/viet-nam.svg" alt=""> Việt Nam <i class="fa fa-angle-down"></i>';
			}
			if (lang === 'ja') {
				currentLangElement.innerHTML = '<img src="assets/img/logo/Japan.svg" alt=""> Nhật Bản <i class="fa fa-angle-down"></i>';
			} else if (lang === 'en') {
				currentLangElement.innerHTML = '<img src="assets/img/logo/united-states.svg" alt=""> English <i class="fa fa-angle-down"></i>';
			}

			// Điều hướng đến servlet để thay đổi ngôn ngữ
			window.location.href = 'ChangeLang?lang=' + lang;
		}
	</script>

</body>
</html>
