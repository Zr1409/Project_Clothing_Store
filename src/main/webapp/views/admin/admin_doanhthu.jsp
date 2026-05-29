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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="shortcut icon" type="image/x-icon"
	href="assets\img\favicon.png">
    <title>Quản lý doanh thu</title>
    <link rel="stylesheet" href="/views/admin/css/fontawesome.min.css">
<!--    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />-->
<!--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.25/datatables.min.css"/>-->
    <link rel="stylesheet" type="text/css" href="/views/admin/css/datatables.min.css"/>
    <script src="/views/admin/js/moment.min.js"></script>
    <link href="/views/admin/css/styles.css" rel="stylesheet" />
<!--    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>-->
<style >
.card {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

canvas {
    margin-top: 20px;
}

.sb-sidenav {
    background-color: #009688;
}

.sb-sidenav a.nav-link {
    color: white;
}

.sb-sidenav a.nav-link:hover {
    background-color: rgba(255, 255, 255, 0.2);
}

.sb-topnav {
    background-color: #009688;
}
</style>
</head>
<body class="sb-nav-fixed" >

<nav class="sb-topnav navbar navbar-expand navbar-dark " style="background-color: #00bba6;"  >
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="index.html">Quản lý người dùng</a>
    <!-- Sidebar Toggle-->
    <button  class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars" style="color: white;"></i></button>
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
    
    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
        <div class="input-group">
            <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
            <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
        </div>
    </form>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="logout">Logout</a></li>
            </ul>
        </li>
    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="background-color: #00bba6;" >
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading" style="color:white;">Core</div>
                    <a style="color:white;" class="nav-link" href="index">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt" style="color:white;"></i></div>
                        Trang chủ
                    </a>
                    <div class="sb-sidenav-menu-heading" style="color:white;">Trang quản lý</div>
                    <a class="nav-link" href="/admin_user" style="color:white;">
                        <div class="sb-nav-link-icon"><i class="fas fa-table" style="color:white;"></i></div>
                        Quản lý người dùng
                    </a>
                    <a class="nav-link" href="/admin_product" style="color:white;">
                        <div class="sb-nav-link-icon"><i class="fas fa-table" style="color:white;"></i></div>
                        Quản lý sản phẩm
                    </a> 
                    <a class="nav-link collapsed" style="color:white;" href="/admin/tour" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns" style="color:white;"></i></div>
                        Thống kê
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion" >
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="/admin_doanhthu" style="color:white;">Thống kê doanh thu</a>
                            <a class="nav-link" href="/admin/tour" style="color:white;">Thống kê sản phẩm</a>
                            <a class="nav-link" href="/admin/tour" style="color:white;">Thống kê đơn hàng</a>
                        </nav>
                    </div>
                    <a class="nav-link" href="/admin_donhang" style="color:white;">
                        <div class="sb-nav-link-icon"><i class="fas fa-table" style="color:white;"></i></div>
                        Quản lý đơn hàng
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
            <h1 class="mt-4">Thống kê doanh thu</h1>
            <ol class="breadcrumb mb-4">
                <li class="breadcrumb-item"><a href="index.html">Trang chủ</a></li>
                <li class="breadcrumb-item active">Thống kê doanh thu</li>
            </ol>

            <!-- Canvas cho biểu đồ -->
            <div class="card mb-4">
                <div class="card-header">
                    <i class="fas fa-chart-bar me-1"></i>
                    Biểu đồ doanh thu theo tháng
                </div>
                <div class="card-body">
                    <canvas id="userChart" width="400" height="200"></canvas>
                </div>
            </div>
        </div>
    </main>
</div>
</div>
<!-- Thêm Chart.js từ CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- Script tạo biểu đồ -->
<script>
    var ctx = document.getElementById('userChart').getContext('2d');
    var userChart = new Chart(ctx, {
        type: 'bar', // Loại biểu đồ: bar, line, pie, doughnut, etc.
        data: {
            labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6'],
            datasets: [{
                label: 'Số lượng người dùng',
                data: [50, 100, 75, 125, 90, 110],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            },
            plugins: {
                legend: {
                    display: true,
                    labels: {
                        color: 'rgb(255, 99, 132)'
                    }
                }
            }
        }
    });
</script>
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

<script src="/views/admin/js/jquery.js"></script>
<script src="/views/admin/js/boostrap-bundle.min.js"></script>
<script src="/views/admin/js/scripts.js"></script>
<script type="text/javascript" src="/views/admin/js/datatables.min.js"></script>
<script src="/views/admin/js/all.min.js"></script>
<script src="/views/admin/js/ckeditor.js"></script>
</body>
</html>
