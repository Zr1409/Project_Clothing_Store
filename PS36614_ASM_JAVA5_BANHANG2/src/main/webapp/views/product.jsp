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
<title>Sản phẩm</title>
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
<style>
.btn-success {
	background-color: #21ccb2 !important; /* Màu nền */
	border-color: #21ccb2 !important; /* Màu viền */
}

.btn-success:hover, .btn-success:focus {
	background-color: #1a9f8c !important; /* Màu nền khi hover hoặc focus */
	border-color: #1a9f8c !important; /* Màu viền khi hover hoặc focus */
}

.pagination_style {
	display: flex;
	justify-content: center; /* Canh giữa phần phân trang */
	align-items: center;
	margin: 20px 0;
}

.pagination_style .page_number {
	display: inline-block;
}

.pagination_style .pagination {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	gap: 10px; /* Khoảng cách giữa các mục */
}

.pagination_style .pagination li {
	display: inline;
}

.pagination_style .pagination li a {
	text-decoration: none;
	color: #000;
	padding: 8px 12px;
	border: 1px solid #ddd;
	border-radius: 4px;
	transition: background-color 0.3s, color 0.3s;
	/* Hiệu ứng chuyển màu */
}

.pagination_style .pagination li a:hover {
	background-color: #21ccb2;
	color: #333;
}

.pagination_style .pagination li.current_number a {
	background-color: #21ccb2; /* Màu nền cho trang hiện tại */
	color: #fff; /* Màu chữ cho trang hiện tại */
	border-color: #007bff;
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
									<li><a href="index"><fmt:message key="mnu.home1" /></a></li>
									<li><i class="fa fa-angle-right"></i></li>
									<li><fmt:message key="mnu.shop1" /></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!--breadcrumbs area end-->

				<!--pos home section-->
				<div class=" pos_home_section">
					<div class="row pos_home">
						<div class="col-lg-3 col-md-12">
							<!--layere categorie"-->
							<div class="sidebar_widget shop_c">
								<div class="categorie__titile">
									<h4>Categories</h4>
								</div>
								<div class="layere_categorie">
									<ul>
										<li><input id="acces" type="checkbox"> <label
											for="acces">Accessories<span>(1)</span></label></li>
										<li><input id="dress" type="checkbox"> <label
											for="dress">Dresses <span>(2)</span></label></li>
										<li><input id="tops" type="checkbox"> <label
											for="tops">Tops<span>(3)</span></label></li>
										<li><input id="bag" type="checkbox"> <label
											for="bag">HandBags<span>(4)</span></label></li>
									</ul>
								</div>
							</div>
							<!--layere categorie end-->

							<!--color area start-->
							<div class="sidebar_widget color">
								<h2>Màu xắc</h2>
								<div class="widget_color">
									<ul>

										<li><a href="#">Đen <span>(10)</span></a></li>

										<li><a href="#">Cam <span>(12)</span></a></li>

										<li><a href="#">Xanh <span>(14)</span></a></li>

										<li><a href="#">Vàng <span>(15)</span></a></li>

										<li><a href="#">Hồng <span>(16)</span></a></li>

										<li><a href="#">Xanh lá <span>(11)</span></a></li>

									</ul>
								</div>
							</div>
							<!--color area end-->

							<!--price slider start-->
							<div class="sidebar_widget price">
								<h2>Giá</h2>
								<div class="ca_search_filters">

									<input type="text" name="text" id="amount">
									<div id="slider-range"></div>
								</div>
							</div>
							<!--price slider end-->

							<!--wishlist block start-->

							<!--wishlist block end-->

							<!--newsletter block start-->
							<div class="sidebar_widget newsletter mb-30">
								<div class="block_title">
									<h3>Thông báo</h3>
								</div>
								<form action="#">
									<p>Đăng nhập để nhận thông báo</p>
									<input placeholder="Your email address" type="text">
									<button type="submit">Subscribe</button>
								</form>
							</div>
							<!--newsletter block end-->

							<!--special product start-->

							<!--special product end-->


						</div>
						<div class="col-lg-9 col-md-12">
							<!--banner slider start-->
							<div class="banner_slider mb-35">
								<img src="assets\img\banner\bannner10.jpg" alt="">
							</div>
							<!--banner slider start-->

							<!--shop toolbar start-->
							<div class="shop_toolbar mb-35">

								<div class="list_button">
									<ul class="nav" role="tablist">
										<li><a class="active" data-toggle="tab" href="#large"
											role="tab" aria-controls="large" aria-selected="true"><i
												class="fa fa-th-large"></i></a></li>
										<li><a data-toggle="tab" href="#list" role="tab"
											aria-controls="list" aria-selected="false"><i
												class="fa fa-th-list"></i></a></li>
									</ul>
								</div>
								<!-- Thay thế phần thông báo số lượng sản phẩm -->

								<c:choose>
									<c:when test="${not empty sessionScope.user}">

										<div class="add_product_button">
											<a href="addsanpham" class="btn btn-success"><fmt:message
													key="mnu.tsp" /></a>
										</div>
									</c:when>
									<c:otherwise>

									</c:otherwise>
								</c:choose>
								<div class="select_option">
									<form class="input-group" action="/sanpham" method="get">
										<input style="margin-right: 20px; height: 30px; width: 300px;"
											class="form-control" name="keywords" value="${keywords}">
										<button style="margin-right: 50px;" class="btn btn-danger">Search</button>

										<label>Sắp xếp</label> <select name="direction"
											onchange="this.form.submit()">
											<option value="asc" ${direction == 'asc' ? 'selected' : ''}>Giá
												tăng dần</option>
											<option value="desc" ${direction == 'desc' ? 'selected' : ''}>Giá
												giảm dần</option>
										</select> <input type="hidden" name="field" value="gia">

										<!-- Giữ lại trang hiện tại -->
									</form>
								</div>




							</div>
							<!--shop toolbar end-->

							<!--shop tab product-->
							<div class="shop_tab_product">
								<div class="tab-content" id="myTabContent">
									<div class="tab-pane fade show active" id="large"
										role="tabpanel">
										<div class="row">
											<c:forEach items="${listSanPham}" var="sanPham"
												varStatus="status">
												<jsp:include page="item2.jsp">
													<jsp:param name="maSanPham" value="${sanPham.maSanPham}" />
													<jsp:param name="name" value="${sanPham.tenSanPham}" />
													<jsp:param name="img" value="${sanPham.duongDanHinhAnh[0]}" />
													<jsp:param name="gia" value="${sanPham.gia}" />
												</jsp:include>
											</c:forEach>

											<!--                                                         <div class="col-lg-4 col-md-6"> -->
											<!--                                                             <div class="single_product"> -->
											<!--                                                                 <div class="product_thumb"> -->
											<!--                                                                    <a href="chitietsanpham"><img src="assets\img\product\product8.jpg" alt=""></a>  -->
											<!--                                                                    <div class="hot_img"> -->
											<!--                                                                        <img src="assets\img\cart\span-hot.png" alt=""> -->
											<!--                                                                    </div> -->
											<!--                                                                    <div class="product_action"> -->
											<!--                                                                        <a href="#"> <i class="fa fa-shopping-cart"></i> Add -->
											<!-- 															to cart</a> -->
											<!--                                                                    </div> -->
											<!--                                                                 </div> -->
											<!--                                                                 <div class="product_content"> -->
											<!--                                                                     <span class="product_price">$65.00</span> -->
											<!--                                                                     <h3 class="product_title"><a href="single-product.html">Áo Thun</a></h3> -->
											<!--                                                                 </div> -->
											<!--                                                                 <div class="product_info"> -->
											<!--                                                                     <ul> -->
											<!--                                                                         <li><a href="#" title=" Add to Wishlist ">Add to -->
											<!-- 																Wishlist</a></li> -->
											<!--                                                                         <li><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">View -->
											<!-- 																Detail</a></li> -->
											<!--                                                                     </ul> -->
											<!--                                                                 </div> -->
											<!--                                                             </div> -->
											<!--                                                         </div> -->
											<!--                                                         <div class="col-lg-4 col-md-6"> -->
											<!--                                                             <div class="single_product"> -->
											<!--                                                                 <div class="product_thumb"> -->
											<!--                                                                    <a href="chitietsanpham"><img src="assets\img\product\product9.jpg" alt=""></a>  -->
											<!--                                                                    <div class="img_icone"> -->
											<!--                                                                        <img src="assets\img\cart\span-new.png" alt=""> -->
											<!--                                                                    </div> -->
											<!--                                                                    <div class="product_action"> -->
											<!--                                                                        <a href="#"> <i class="fa fa-shopping-cart"></i>Add -->
											<!-- 															to cart</a> -->
											<!--                                                                    </div> -->
											<!--                                                                 </div> -->
											<!--                                                                 <div class="product_content"> -->
											<!--                                                                     <span class="product_price">$50.00</span> -->
											<!--                                                                     <h3 class="product_title"><a href="single-product.html">Quần jean</a></h3> -->
											<!--                                                                 </div> -->
											<!--                                                                 <div class="product_info"> -->
											<!--                                                                     <ul> -->
											<!--                                                                         <li><a href="#" title=" Add to Wishlist "> -->
											<!-- 																Wishlist</a></li> -->
											<!--                                                                         <li><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">View -->
											<!-- 																Detail</a></li> -->
											<!--                                                                     </ul> -->
											<!--                                                                 </div> -->
											<!--                                                             </div> -->
											<!--                                                         </div> -->
										</div>
									</div>
									<div class="tab-pane fade" id="list" role="tabpanel">
										<c:forEach items="${listSanPham}" var="sanPham">
											<div class="product_list_item mb-35">
												<div class="row align-items-center">
													<div class="col-lg-4 col-md-6 col-sm-6">
														<div class="product_thumb">
															<a href="chitietsanpham?maSanPham=${sanPham.maSanPham}"><img
																src="assets/img/product/${sanPham.duongDanHinhAnh[0]}"
																alt=""></a>
															<div class="hot_img">
																<img src="assets\img\cart\span-hot.png" alt="">
															</div>
														</div>
													</div>
													<div class="col-lg-8 col-md-6 col-sm-6">
														<div class="list_product_content">
															<div class="product_ratting">
																<ul>
																	<li><a href="#"><i class="fa fa-star"></i></a></li>
																	<li><a href="#"><i class="fa fa-star"></i></a></li>
																	<li><a href="#"><i class="fa fa-star"></i></a></li>
																	<li><a href="#"><i class="fa fa-star"></i></a></li>
																	<li><a href="#"><i class="fa fa-star"></i></a></li>
																</ul>
															</div>
															<div class="list_title">
																<h3>
																	<a href="single-product.html">${sanPham.tenSanPham}</a>
																</h3>
															</div>
															<p class="design">Chào mừng bạn đến với bộ sưu tập
																quần áo mới nhất, nơi phong cách và sự thoải mái hội tụ!
																Chúng tôi tự hào giới thiệu các thiết kế hiện đại, chất
																liệu cao cấp và sự tinh tế trong từng chi tiết. Từ những
																bộ trang phục hàng ngày đến các bộ đồ dự tiệc sang
																trọng, chúng tôi có tất cả những gì bạn cần để làm nổi
																bật phong cách cá nhân của mình.</p>

															<p class="compare">
																<input id="select" type="checkbox"> <label
																	for="select">Select to compare</label>
															</p>
															<div class="content_price">
																<span>$${sanPham.gia}</span> <span class="old-price">$130.00</span>
															</div>
															<div class="add_links">
																<ul>
																	<li><a href="#" title="add to cart"><i
																			class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
																	<li><a href="#" title="add to wishlist"><i
																			class="fa fa-heart" aria-hidden="true"></i></a></li>
																	<li><a href="#" data-toggle="modal"
																		data-target="#modal_box" title="Quick view"><i
																			class="fa fa-eye" aria-hidden="true"></i></a></li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>


										<!--                                                     <div class="product_list_item mb-35"> -->
										<!--                                                         <div class="row align-items-center"> -->
										<!--                                                             <div class="col-lg-4 col-md-6 col-sm-6"> -->
										<!--                                                                 <div class="product_thumb"> -->
										<!--                                                                    <a href="single-product.html"><img src="assets\img\product\product9.jpg" alt=""></a>  -->
										<!--                                                                    <div class="hot_img"> -->
										<!--                                                                        <img src="assets\img\cart\span-hot.png" alt=""> -->
										<!--                                                                    </div> -->
										<!--                                                                 </div> -->
										<!--                                                             </div> -->
										<!--                                                             <div class="col-lg-8 col-md-6 col-sm-6"> -->
										<!--                                                                 <div class="list_product_content"> -->
										<!--                                                                    <div class="product_ratting"> -->
										<!--                                                                        <ul> -->
										<!--                                                                            <li><a href="#"><i class="fa fa-star"></i></a></li> -->
										<!--                                                                            <li><a href="#"><i class="fa fa-star"></i></a></li> -->
										<!--                                                                            <li><a href="#"><i class="fa fa-star"></i></a></li> -->
										<!--                                                                            <li><a href="#"><i class="fa fa-star"></i></a></li> -->
										<!--                                                                            <li><a href="#"><i class="fa fa-star"></i></a></li> -->
										<!--                                                                        </ul> -->
										<!--                                                                    </div> -->
										<!--                                                                     <div class="list_title"> -->
										<!--                                                                         <h3><a href="single-product.html">Curabitur sodales</a></h3> -->
										<!--                                                                     </div> -->
										<!--                                                                     <p class="design"> in quibusdam accusantium qui nostrum consequuntur, officia, quidem ut placeat. Officiis, incidunt eos recusandae! Facilis aliquam vitae blanditiis quae perferendis minus eligendi</p> -->

										<!--                                                                     <p class="compare"> -->
										<!--                                                                         <input id="select7" type="checkbox"> -->
										<!--                                                                         <label for="select7">Select to compare</label> -->
										<!--                                                                     </p> -->
										<!--                                                                     <div class="content_price"> -->
										<!--                                                                         <span>$118.00</span> -->
										<!--                                                                         <span class="old-price">$130.00</span> -->
										<!--                                                                     </div> -->
										<!--                                                                     <div class="add_links"> -->
										<!--                                                                         <ul> -->
										<!--                                                                             <li><a href="#" title="add to cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li> -->
										<!--                                                                             <li><a href="#" title="add to wishlist"><i class="fa fa-heart" aria-hidden="true"></i></a></li> -->

										<!--                                                                             <li><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view"><i class="fa fa-eye" aria-hidden="true"></i></a></li> -->
										<!--                                                                         </ul> -->
										<!--                                                                     </div> -->
										<!--                                                                 </div> -->
										<!--                                                             </div> -->
										<!--                                                         </div>  -->
										<!--                                                     </div>  -->
										<!--                                                     <div class="product_list_item mb-35"> -->
										<!--                                                         <div class="row align-items-center"> -->
										<!--                                                             <div class="col-lg-4 col-md-6 col-sm-6"> -->
										<!--                                                                 <div class="product_thumb"> -->
										<!--                                                                    <a href="single-product.html"><img src="assets\img\product\product1.jpg" alt=""></a>  -->
										<!--                                                                    <div class="img_icone"> -->
										<!--                                                                        <img src="assets\img\cart\span-new.png" alt=""> -->
										<!--                                                                    </div> -->
										<!--                                                                 </div> -->
										<!--                                                             </div> -->
										<!--                                                             <div class="col-lg-8 col-md-6 col-sm-6"> -->
										<!--                                                                 <div class="list_product_content"> -->
										<!--                                                                    <div class="product_ratting"> -->
										<!--                                                                        <ul> -->
										<!--                                                                            <li><a href="#"><i class="fa fa-star"></i></a></li> -->
										<!--                                                                            <li><a href="#"><i class="fa fa-star"></i></a></li> -->
										<!--                                                                            <li><a href="#"><i class="fa fa-star"></i></a></li> -->
										<!--                                                                            <li><a href="#"><i class="fa fa-star"></i></a></li> -->
										<!--                                                                            <li><a href="#"><i class="fa fa-star"></i></a></li> -->
										<!--                                                                        </ul> -->
										<!--                                                                    </div> -->
										<!--                                                                     <div class="list_title"> -->
										<!--                                                                         <h3><a href="single-product.html">Lorem ipsum dolor</a></h3> -->
										<!--                                                                     </div> -->
										<!--                                                                     <p class="design"> in quibusdam accusantium qui nostrum consequuntur, officia, quidem ut placeat. Officiis, incidunt eos recusandae! Facilis aliquam vitae blanditiis quae perferendis minus eligendi</p> -->

										<!--                                                                     <p class="compare"> -->
										<!--                                                                         <input id="select8" type="checkbox"> -->
										<!--                                                                         <label for="select8">Select to compare</label> -->
										<!--                                                                     </p> -->
										<!--                                                                     <div class="content_price"> -->
										<!--                                                                         <span>$118.00</span> -->
										<!--                                                                         <span class="old-price">$130.00</span> -->
										<!--                                                                     </div> -->
										<!--                                                                     <div class="add_links"> -->
										<!--                                                                         <ul> -->
										<!--                                                                             <li><a href="#" title="add to cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a></li> -->
										<!--                                                                             <li><a href="#" title="add to wishlist"><i class="fa fa-heart" aria-hidden="true"></i></a></li> -->

										<!--                                                                             <li><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view"><i class="fa fa-eye" aria-hidden="true"></i></a></li> -->
										<!--                                                                         </ul> -->
										<!--                                                                     </div> -->
										<!--                                                                 </div> -->
										<!--                                                             </div> -->
										<!--                                                         </div>  -->
										<!--                                                     </div>                         -->
									</div>

								</div>
							</div>
							<!--shop tab product end-->

							<!--pagination style start-->
							<div class="pagination_style">
								<span>Pages: </span>
								<div class="page_number">
									<ul class="pagination justify-content-center">

										<!-- Nút Previous (về trang trước) -->
										<c:if test="${currentPage > 1}">
											<li><a
												href="?page=${currentPage-2}&keywords=${keywords}&field=${field}&direction=${direction}">«</a></li>
										</c:if>
										<c:if test="${currentPage == 1}">
											<li class="disabled"><a>«</a></li>
											<!-- Khi đang ở trang 1 -->
										</c:if>

										<!-- Hiển thị các số trang -->
										<c:forEach var="i" begin="1" end="${totalPages}">
											<li class="${i == currentPage ? 'current_number' : ''}">
												<a
												href="?page=${i-1}&keywords=${keywords}&field=${field}&direction=${direction}">${i}</a>
											</li>
										</c:forEach>

										<!-- Nút Next (tới trang sau) -->
										<c:if test="${currentPage < totalPages}">
											<li><a
												href="?page=${currentPage}&keywords=${keywords}&field=${field}&direction=${direction}">»</a></li>
										</c:if>
										<c:if test="${currentPage == totalPages}">
											<li class="disabled"><a>»</a></li>
											<!-- Khi đang ở trang cuối -->
										</c:if>
									</ul>
								</div>
							</div>



							<!--pagination style end-->
						</div>
					</div>
				</div>
				<!--pos home section end-->
			</div>
			<!--pos page inner end-->
		</div>
	</div>
	<!--pos page end-->

	<!--footer area start-->

	<jsp:include page="footer.jsp" />

	<!--footer area end-->


	<!-- modal area start -->
	<%@ page import="poly.edu.model.SanPhamQuanAo"%>
	<%
	SanPhamQuanAo sanPham = (SanPhamQuanAo) request.getAttribute("sanPham");
	if (sanPham != null) {
	%>
	<!-- Modal -->
	<div class="modal fade" id="modal_box" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<div class="modal_body">
					<div class="container">
						<div class="row">
							<div class="col-lg-5 col-md-5 col-sm-12">
								<div class="modal_tab">
									<div class="tab-content" id="pills-tabContent">
										<div class="tab-pane fade show active" id="tab1"
											role="tabpanel">
											<div class="modal_tab_img">
												<a href="#"><img
													src="assets/img/product/${sanPham.duongDanHinhAnh[0]}"
													alt=""></a>
											</div>
										</div>
										<div class="tab-pane fade" id="tab2" role="tabpanel">
											<div class="modal_tab_img">
												<a href="#"><img
													src="assets/img/product/${sanPham.duongDanHinhAnh[1]}"
													alt=""></a>
											</div>
										</div>
										<div class="tab-pane fade" id="tab3" role="tabpanel">
											<div class="modal_tab_img">
												<a href="#"><img
													src="assets/img/product/${sanPham.duongDanHinhAnh[2]}"
													alt=""></a>
											</div>
										</div>
									</div>
									<div class="modal_tab_button">
										<ul class="nav product_navactive" role="tablist">
											<li><a class="nav-link active" data-toggle="tab"
												href="#tab1" role="tab" aria-controls="tab1"
												aria-selected="false"><img
													src="assets/img/product/${sanPham.duongDanHinhAnh[0]}"
													alt=""></a></li>
											<li><a class="nav-link" data-toggle="tab" href="#tab2"
												role="tab" aria-controls="tab2" aria-selected="false"><img
													src="assets/img/product/${sanPham.duongDanHinhAnh[1]}"
													alt=""></a></li>
											<li><a class="nav-link button_three" data-toggle="tab"
												href="#tab3" role="tab" aria-controls="tab3"
												aria-selected="false"><img
													src="assets/img/product/${sanPham.duongDanHinhAnh[2]}"
													alt=""></a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-lg-7 col-md-7 col-sm-12">
								<div class="modal_right">
									<div class="modal_title mb-10">
										<h2>${sanPham.tenSanPham}</h2>
									</div>
									<div class="modal_price mb-10">
										<span class="new_price">$${sanPham.gia}</span> <span
											class="old_price">$78.99</span>
									</div>
									<div class="modal_content mb-10">
										<p>Phong cách thời trang đỉnh cao</p>
									</div>
									<div class="modal_size mb-15">
										<h2>size</h2>
										<ul>
											<li><a href="#">s</a></li>
											<li><a href="#">m</a></li>
											<li><a href="#">l</a></li>
											<li><a href="#">xl</a></li>
											<li><a href="#">xxl</a></li>
										</ul>
									</div>
									<div class="modal_add_to_cart mb-15">
										<form action="#">
											<input min="0" max="100" step="2" value="1" type="number">
											<button type="submit">add to cart</button>
										</form>
									</div>
									<div class="modal_description mb-15">
										<p>Chào mừng bạn đến với bộ sưu tập mới nhất của chúng
											tôi! Hôm nay, chúng tôi tự hào giới thiệu chiếc áo thun thời
											trang cao cấp, một sản phẩm hoàn hảo kết hợp giữa phong cách
											hiện đại và sự tiện dụng.</p>
									</div>
									<div class="modal_social">
										<h2>Share this product</h2>
										<ul>
											<li><a href="#"><i class="fa fa-facebook"></i></a></li>
											<li><a href="#"><i class="fa fa-twitter"></i></a></li>
											<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
											<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
											<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	session.removeAttribute("sanPham");
	}
	%>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			if ($('#modal_box').length) {
				$('#modal_box').modal('show');
			}
		});
	</script>

	<!-- modal area end -->

	<!-- modal area end -->

	<!-- all js here -->
	<script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
	<script src="assets\js\popper.js"></script>
	<script src="assets\js\bootstrap.min.js"></script>
	<script src="assets\js\ajax-mail.js"></script>
	<script src="assets\js\plugins.js"></script>
	<script src="assets\js\main.js"></script>
</body>
</html>
