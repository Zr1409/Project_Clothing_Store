<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<title>Quản lý sản phẩm</title>
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
		<a class="navbar-brand ps-3" href="index.html">Quản lý người dùng</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars" style="color: white;"></i>
		</button>
		<!-- Navbar Search-->
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
							</div> Quản lý người dùng
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
					<h1 class="mt-4">Danh sách sản phẩm</h1>
					<ol class="breadcrumb mb-4">
						<li class="breadcrumb-item"><a href="/admin/tour">Trang
								chủ</a></li>
						<li class="breadcrumb-item active">Quản lý sản phẩm</li>
					</ol>
					<div class="container-fluid px-4">


						<!-- Form đăng ký nhân viên -->
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-user-plus me-1"></i> Thêm sản phẩm
							</div>
							<div class="card-body d-flex justify-content-center">
								<div class="form-container"
									style="max-width: 450px; width: 100%;">
									<form:form action="/admin_product" modelAttribute="sanPham"
										method="post" enctype="multipart/form-data">
										<c:if test="${not empty requestScope.error}">
											<div class="alert alert-danger show" role="alert">
												${requestScope.error}</div>
										</c:if>

										<div class="mb-3">
											<label for="tenSanPham" class="form-label">Tên sản
												phẩm:</label> <input value="${sanPham.tenSanPham}" type="text"
												id="tenSanPham" name="tenSanPham" class="form-control"
												required>
										</div>

										<div class="mb-3">
											<label for="gia" class="form-label">Giá:</label> <input
												value="${sanPham.gia}" type="number" id="gia" name="gia"
												class="form-control" required>
										</div>
										<div class="mb-3">
											<label for="gia" class="form-label">Chất liệu:</label> <input
												value="${sanPham.chatLieu}" type="text" id="gia"
												name="chatLieu" class="form-control" required>
										</div>
										<div class="mb-3">
											<label for="gia" class="form-label">Thương hiệu:</label> <input
												value="${sanPham.thuongHieu}" type="text" id="gia"
												name="thuongHieu" class="form-control" required>
										</div>

										<div class="mb-3">
											<label for="moTa" class="form-label">Mô tả:</label>
											<textarea class="form-control" id="moTa" name="moTa" rows="2"
												required>${sanPham.moTa}</textarea>
										</div>


										<div class="mb-3">
											<label for="file" class="form-label">Ảnh:</label> <input
												type="file" id="file" name="file" class="form-control"
												multiple required onchange="previewImages(event)">
											<div id="preview"></div>
											<input class="form-control"
												value="${sanPham.duongDanHinhAnh}" id="fileNames"
												name="fileNames">
											<!-- Thay đổi từ div sang input ẩn -->
										</div>
										<div class="text-center">
											<!-- Create Button -->
											<button type="submit" class="btn btn-primary mx-2"
												formaction="/admin_product/create">
												<i class="fas fa-plus-circle"></i> Create
											</button>

											<!-- Update Button -->
											<button type="submit" class="btn btn-warning mx-2"
												formaction="/admin_product/update">
												<i class="fas fa-edit"></i> Update
											</button>


											<!-- Delete Button -->


											<!-- Reset Button -->
											<a class="btn btn-info mx-2" href="/admin_product"> <i
												class="fas fa-undo"></i> Reset
											</a>
										</div>



									</form:form>
								</div>
							</div>
						</div>
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1"></i> Bảng dữ liệu sản phẩm
							</div>
							<div class="card-body">
								<table
									class="table table-striped table-bordered table-hover mt-3">
									<thead class="table-info">

										<tr>
											<th>ID</th>
											<th>Tên Sản Phẩm</th>
											<th>Giá</th>
											<th>Chất Liệu</th>
											<th>Thương Hiệu</th>
											<th>Hình ảnh</th>
											<th>Mô tả</th>
											<th>Ngày Tạo</th>
											<th>Action</th>

										</tr>
									</thead>


									<tbody>
										<c:forEach var="item" items="${sanPhams}">
											<tr>
												<td>${item.maSanPham}</td>
												<td>${item.tenSanPham}</td>
												<td>${item.gia}</td>
												<!-- Hiển thị email -->
												<td>${item.chatLieu}</td>
												<!-- Hiển thị vai trò -->
												<td>${item.thuongHieu}</td>
												<td><img style="width: 100px"
													src="assets/img/product/${item.duongDanHinhAnh[0]}" alt="" />
												</td>


												<td>${item.moTa}</td>
												<td>${item.ngayTao}</td>

												<td><a href="/admin_product/edit/${item.maSanPham}"
													class="btn btn-sm btn-warning">Edit</a></td>
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
	<script>	
	 var selectedFiles = [];

	    function previewImages(event) {
	        var files = event.target.files;
	        var preview = document.getElementById('preview');
	        var fileNames = [];

	        // Iterate through the newly selected files
	        for (var i = 0; i < files.length; i++) {
	            selectedFiles.push(files[i]);

	            var reader = new FileReader();
	            reader.onload = (function(file) {
	                return function(e) {
	                    var img = document.createElement('img');
	                    img.src = e.target.result;
	                    img.style.width = '100px';
	                    img.style.margin = '5px';
	                    img.setAttribute('data-file-name', file.name); // Gán tên tệp vào thuộc tính data
	                    preview.appendChild(img);
	                };
	            })(files[i]);
	            reader.readAsDataURL(files[i]);

	            fileNames.push(files[i].name);
	        }

	        // Update the text input field with file names
	        document.getElementById('fileNames').value = selectedFiles.map(file => file.name).join(',');
	    }

	    document.getElementById('fileNames').addEventListener('input', function() {
	        var preview = document.getElementById('preview');
	        var currentFileNames = this.value.split(',');

	     // Xóa các hình ảnh không còn trong trường input fileNames
	        var newSelectedFiles = [];
	        var previewImages = preview.getElementsByTagName('img');

	    // Lặp qua các hình ảnh trong phần hiển thị và xóa những hình không còn trong currentFileNames
	        for (var i = previewImages.length - 1; i >= 0; i--) {
	            var img = previewImages[i];
	            var fileName = img.getAttribute('data-file-name');
	    // Nếu tên tệp không nằm trong danh sách currentFileNames, xóa hình ảnh
	            if (!currentFileNames.includes(fileName)) {
	                img.remove();
	            } else {
	   // Nếu tên tệp nằm trong danh sách currentFileNames, thêm tệp vào newSelectedFiles
	                newSelectedFiles.push(selectedFiles.find(file => file.name === fileName));
	            }
	        }
	   // Cập nhật lại danh sách selectedFiles
	        selectedFiles = newSelectedFiles;
	    });
		
	
	</script>
</body>
</html>
