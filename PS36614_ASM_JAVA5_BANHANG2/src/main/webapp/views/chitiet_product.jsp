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
<title>Chi tiết sản phẩm</title>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.color-options {
	list-style-type: none; /* Bỏ dấu chấm */
	padding: 0;
}

.color-radio {
	display: none; /* Ẩn nút radio */
}

.color-options label {
	display: inline-block;
	width: 30px; /* Kích thước nút */
	height: 30px;
	border-radius: 50%; /* Hình tròn */
	cursor: pointer; /* Con trỏ chuột */
	margin: 5px; /* Khoảng cách giữa các nút */
	border: 2px solid transparent; /* Đường viền mặc định */
}

.color-radio:checked+label {
	border-color: #000; /* Đường viền đen khi được chọn */
}

.color-radio:checked+label {
	outline: 2px solid #000; /* Đường viền khi được chọn */
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
				<jsp:include page="header.jsp" />
				<!--breadcrumbs area start-->
				<div class="breadcrumbs_area">
					<div class="row">
						<div class="col-12">
							<div class="breadcrumb_content">
								<ul>
									<li><a href="index.html"><fmt:message key="mnu.home1" /></a></li>
									<li><i class="fa fa-angle-right"></i></li>
									<li><fmt:message key="mnu.ctsp" /></li>
								</ul>

							</div>
						</div>
					</div>
				</div>
				<!--breadcrumbs area end-->


				<!--product wrapper start-->
				<div class="product_details">
					<div class="row">
						<div class="col-lg-5 col-md-6">
							<div class="product_tab fix">
								<div class="product_tab_button">
									<ul class="nav" role="tablist">
										<li><a class="active" data-toggle="tab" href="#p_tab1"
											role="tab" aria-controls="p_tab1" aria-selected="false"><img
												src="assets/img/product/${sanPham.duongDanHinhAnh[0]}"
												alt=""></a></li>
										<li><a data-toggle="tab" href="#p_tab2" role="tab"
											aria-controls="p_tab2" aria-selected="false"><img
												src="assets/img/product/${sanPham.duongDanHinhAnh[1]}"
												alt=""></a></li>
										<li><a data-toggle="tab" href="#p_tab3" role="tab"
											aria-controls="p_tab3" aria-selected="false"><img
												src="assets/img/product/${sanPham.duongDanHinhAnh[2]}"
												alt=""></a></li>
									</ul>
								</div>
								<div class="tab-content produc_tab_c">
									<div class="tab-pane fade show active" id="p_tab1"
										role="tabpanel">
										<div class="modal_img">
											<a href="#"><img
												src="assets/img/product/${sanPham.duongDanHinhAnh[0]}"
												alt=""></a>
											<div class="img_icone">
												<img src="assets\img\cart\span-new.png" alt="">
											</div>
											<div class="view_img">
												<a class="large_view"
													href="assets/img/product/${sanPham.duongDanHinhAnh[0]}"><i
													class="fa fa-search-plus"></i></a>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="p_tab2" role="tabpanel">
										<div class="modal_img">
											<a href="#"><img
												src="assets/img/product/${sanPham.duongDanHinhAnh[1]}"
												alt=""></a>
											<div class="img_icone">
												<img src="assets\img\cart\span-new.png" alt="">
											</div>
											<div class="view_img">
												<a class="large_view"
													href="assets/img/product/${sanPham.duongDanHinhAnh[1]}"><i
													class="fa fa-search-plus"></i></a>
											</div>
										</div>
									</div>
									<div class="tab-pane fade" id="p_tab3" role="tabpanel">
										<div class="modal_img">
											<a href="#"><img
												src="assets/img/product/${sanPham.duongDanHinhAnh[2]}"
												alt=""></a>
											<div class="img_icone">
												<img src="assets\img\cart\span-new.png" alt="">
											</div>
											<div class="view_img">
												<a class="large_view"
													href="assets/img/product/${sanPham.duongDanHinhAnh[2]}">
													<i class="fa fa-search-plus"></i>
												</a>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
						<div class="col-lg-7 col-md-6">
							<div class="product_d_right">
								<!--  <h1>Printed Summer Dress</h1> -->
								<h1>${sanPham.tenSanPham}</h1>
								<div class="product_ratting mb-10">
									<ul>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<!-- <li><a href="#"> Write a review </a></li>  -->
										<li><a href="#"> <fmt:message key="mnu.danhgia" />
										</a></li>
									</ul>
								</div>
								<div class="product_desc">
									<p>
										<fmt:message key="mnu.chaomung" />
									</p>
								</div>

								<div class="content_price mb-15">
									<span><c:choose>
											<c:when test="${sessionScope.currency == 'USD'}">
												<fmt:formatNumber
													value="${sanPham.gia / sessionScope.usdToVnd}"
													type="currency" currencySymbol="$" />
											</c:when>
											<c:when test="${sessionScope.currency == 'JPY'}">
												<fmt:formatNumber
													value="${sanPham.gia / sessionScope.jpyToVnd}"
													type="currency" currencySymbol="¥" />
											</c:when>
											<c:otherwise>
												<fmt:formatNumber value="${sanPham.gia}" type="currency"
													currencySymbol="VNĐ" />
											</c:otherwise>
										</c:choose></span> 
<!-- 										<span class="old-price">600000.0 VNĐ</span>  -->
										<input
										type="hidden" id="maSP" value="${sanPham.maSanPham}" />

								</div>

								<div class="box_quantity mb-20 ms-0">

									<button style="margin-left: 0px; margin-right: 10px;"
										type="submit" id="addToCart">
										<i class="fa fa-shopping-cart"></i>
										<fmt:message key="mnu.addcart" />
									</button>
									<%-- 									<c:choose> --%>
									<%-- 										<c:when test="${not empty sessionScope.user}"> --%>
									<!-- 											<button style="margin-left: 0px; margin-right: 10px;" -->
									<!-- 												type="submit" -->
									<%-- 												onclick="location.href='addsanpham?maSanPham=${sanPham.maSanPham}'"> --%>

									<!-- 												ADD SẢN PHẨM</button> -->

									<!-- 											<button style="margin-left: 0px; margin-right: 10px;" -->
									<!-- 												type="submit" -->
									<%-- 												onclick="location.href='updatesanpham?maSanPham=${sanPham.maSanPham}'"> --%>

									<!-- 												UPDATE SẢN PHẨM</button> -->



									<!-- 											<button style="margin-left: 0px; margin-right: 0px;" -->
									<!-- 												type="submit" -->
									<%-- 												onclick="location.href='deletesanpham?maSanPham=${sanPham.maSanPham}'"> --%>
									<!-- 												DELETE SẢN PHẨM</button> -->
									<%-- 										</c:when> --%>
									<%-- 										<c:otherwise> --%>

									<%-- 										</c:otherwise> --%>
									<%-- 									</c:choose> --%>
									<!-- 	<a href="#" title="add to wishlist"><i class="fa fa-heart" -->
									<!-- 	aria-hidden="true"></i></a> -->

								</div>



								<div class="product_d_size mb-20">
									<label for="group_1"><fmt:message key="mnu.kichthuoc" /></label>
									<select id="sizeSP" name="size" id="group_1">
										<option value="S">S</option>
										<option value="M">M</option>
										<option value="L">L</option>
									</select>
								</div>

								<div class="sidebar_widget color">
									<h2>
										<fmt:message key="mnu.mausac" />
									</h2>
									<div class="widget_color">
										<ul class="color-options">
											<li><input type="radio" id="color-black" name="color"
												value="Đen" class="color-radio"> <label
												for="color-black" style="background-color: black;"
												data-color="Đen"></label></li>
											<li><input type="radio" id="color-red" name="color"
												value="Đỏ" class="color-radio"> <label
												for="color-red" style="background-color: red;"
												data-color="Đỏ"></label></li>
											<li><input type="radio" id="color-orange" name="color"
												value="Cam" class="color-radio"> <label
												for="color-orange" style="background-color: orange;"
												data-color="Cam"></label> <!-- Sửa màu về orange --></li>
											<li><input type="radio" id="color-blue" name="color"
												value="Xanh" class="color-radio"> <label
												for="color-blue" style="background-color: blue;"
												data-color="Xanh"></label> <!-- Sửa màu về blue --></li>
											<li><input type="radio" id="color-yellow" name="color"
												value="Vàng" class="color-radio"> <label
												for="color-yellow" style="background-color: yellow;"
												data-color="Vàng"></label></li>
											<li><input type="radio" id="color-pink" name="color"
												value="Hồng" class="color-radio"> <label
												for="color-pink" style="background-color: pink;"
												data-color="Hồng"></label></li>
											<li><input type="radio" id="color-green" name="color"
												value="Xanh lá" class="color-radio"> <label
												for="color-green" style="background-color: green;"
												data-color="Xanh lá"></label></li>
										</ul>
									</div>
									<input type="hidden" id="selectedColor" name="color" value="">




									<div class="wishlist-share">
										<h4>
											<fmt:message key="mnu.chiase" />
											:
										</h4>
										<ul>
											<li><a href="#"><i class="fa fa-rss"></i></a></li>
											<li><a href="#"><i class="fa fa-vimeo"></i></a></li>
											<li><a href="#"><i class="fa fa-tumblr"></i></a></li>
											<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
											<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
										</ul>
									</div>

								</div>
							</div>
						</div>
					</div>
					<!--product details end-->


					<!--product info start-->
					<div class="product_d_info">
						<div class="row">
							<div class="col-12">
								<div class="product_d_inner">
									<div class="product_info_button">
										<ul class="nav" role="tablist">
											<li><a class="active" data-toggle="tab" href="#info"
												role="tab" aria-controls="info" aria-selected="false"><fmt:message
														key="mnu.themthongtin" /></a></li>
											<li><a data-toggle="tab" href="#sheet" role="tab"
												aria-controls="sheet" aria-selected="false"><fmt:message
														key="mnu.chatlieu" /></a></li>
											<li><a data-toggle="tab" href="#reviews" role="tab"
												aria-controls="reviews" aria-selected="false"><fmt:message
														key="mnu.danhgia" /></a></li>
										</ul>
									</div>
									<div class="tab-content">
										<div class="tab-pane fade show active" id="info"
											role="tabpanel">
											<div class="product_info_content">
												<!-- <p>Fashion has been creating well-designed collections since 2010. The brand offers feminine designs delivering stylish separates and statement dresses which have since evolved into a full ready-to-wear collection in which every item is a vital part of a woman's wardrobe. The result? Cool, easy, chic looks with youthful elegance and unmistakable signature style. All the beautiful pieces are made in Italy and manufactured with the greatest attention. Now Fashion extends to a range of accessories including shoes, hats, belts and more!</p>  -->
												<p>
													<fmt:message key="mnu.chaomung" />
												</p>
											</div>
										</div>

										<div class="tab-pane fade" id="sheet" role="tabpanel">
											<div class="product_d_table">
												<form action="#">
													<table>
														<tbody>
															<tr>
																<td class="first_child"><fmt:message
																		key="mnu.chatlieu" /></td>
																<td>${sanPham.chatLieu}</td>
															</tr>
															<tr>
																<td class="first_child"><fmt:message
																		key="mnu.phongcach" /></td>
																<td><fmt:message key="mnu.moimesangtrong" /></td>
															</tr>
															<tr>
																<td class="first_child"><fmt:message
																		key="mnu.thuonghieu" /></td>
																<td>${sanPham.thuongHieu}</td>
															</tr>
														</tbody>
													</table>
												</form>
											</div>
											<div class="product_info_content">
												<p>
													<fmt:message key="mnu.chaomung" />
												</p>
											</div>
										</div>
										<div class="tab-pane fade" id="reviews" role="tabpanel">
											<div class="product_info_content">
												<p>
													<fmt:message key="mnu.chaomung" />
												</p>
											</div>
											<div class="product_info_inner">
												<div class="product_ratting mb-10">
													<ul>
														<li><a href="#"><i class="fa fa-star"></i></a></li>
														<li><a href="#"><i class="fa fa-star"></i></a></li>
														<li><a href="#"><i class="fa fa-star"></i></a></li>
														<li><a href="#"><i class="fa fa-star"></i></a></li>
														<li><a href="#"><i class="fa fa-star"></i></a></li>
													</ul>
													<strong>Posthemes</strong>
													<p>09/07/2018</p>
												</div>
												<div class="product_demo">
													<strong>demo</strong>
													<p>
														<fmt:message key="mnu.sanphamtot" />
													</p>
												</div>
											</div>
											<div class="product_review_form">
												<form action="#">
													<h2>
														<fmt:message key="mnu.themdanhgia" />
													</h2>
													<p>
														<fmt:message key="mnu.diachiemailkhongcongkhai" />
													</p>
													<div class="row">
														<div class="col-12">
															<label for="review_comment"><fmt:message
																	key="mnu.danhgiacuaban" /> </label>
															<textarea name="comment" id="review_comment"></textarea>
														</div>
														<div class="col-lg-6 col-md-6">
															<label for="author"><fmt:message key="mnu.ten" /></label>
															<input id="author" type="text">

														</div>
														<div class="col-lg-6 col-md-6">
															<label for="email">Email </label> <input id="email"
																type="text">
														</div>
													</div>
													<button type="submit">
														<fmt:message key="mnu.dang" />
													</button>
												</form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--product info end-->


					<!--new product area start-->
					<div class="new_product_area product_page">
						<div class="row">
							<div class="col-12">
								<div class="block_title">
									<h3>
										<fmt:message key="mnu.spk" />
									</h3>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="single_p_active owl-carousel">
								<c:forEach items="${listSanPham}" var="sanPham"
									varStatus="status">
									<c:if test="${status.index < 5}">
										<jsp:include page="item.jsp">
											<jsp:param name="maSanPham" value="${sanPham.maSanPham}" />
											<jsp:param name="name" value="${sanPham.tenSanPham}" />
											<jsp:param name="img" value="${sanPham.duongDanHinhAnh[0]}" />
											<jsp:param name="gia" value="${sanPham.gia}" />
										</jsp:include>
									</c:if>
								</c:forEach>
								<!--                                     <div class="col-lg-3"> -->
								<!--                                         <div class="single_product"> -->
								<!--                                             <div class="product_thumb"> -->
								<!--                                                <a href="single-product.html"><img src="assets\img\product\product2.jpg" alt=""></a>  -->
								<!--                                                <div class="hot_img"> -->
								<!--                                                    <img src="assets\img\cart\span-hot.png" alt=""> -->
								<!--                                                </div> -->
								<!--                                                <div class="product_action"> -->
								<!--                                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Thêm vào giỏ</a> -->
								<!--                                                </div> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_content"> -->
								<!--                                                 <span class="product_price">$40.00</span> -->
								<!--                                                 <h3 class="product_title"><a href="single-product.html">Quisque ornare dui</a></h3> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_info"> -->
								<!--                                                 <ul> -->
								<!--                                                     <li><a href="#" title=" Add to Wishlist ">Thêm vào yêu thích</a></li> -->
								<!--                                                     <li><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">Xem chi tiết</a></li> -->
								<!--                                                 </ul> -->
								<!--                                             </div> -->
								<!--                                         </div> -->
								<!--                                     </div> -->
								<!--                                     <div class="col-lg-3"> -->
								<!--                                         <div class="single_product"> -->
								<!--                                             <div class="product_thumb"> -->
								<!--                                                <a href="single-product.html"><img src="assets\img\product\product3.jpg" alt=""></a>  -->
								<!--                                                <div class="img_icone"> -->
								<!--                                                    <img src="assets\img\cart\span-new.png" alt=""> -->
								<!--                                                </div> -->
								<!--                                                <div class="product_action"> -->
								<!--                                                    <a href="#"> <i class="fa fa-shopping-cart"></i>Thêm vào giỏ</a> -->
								<!--                                                </div> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_content"> -->
								<!--                                                 <span class="product_price">$60.00</span> -->
								<!--                                                 <h3 class="product_title"><a href="single-product.html">Sed non turpiss</a></h3> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_info"> -->
								<!--                                                 <ul> -->
								<!--                                                     <li><a href="#" title=" Add to Wishlist ">Thêm vào yêu thích</a></li> -->
								<!--                                                     <li><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">Xem chi tiết</a></li> -->
								<!--                                                 </ul> -->
								<!--                                             </div> -->
								<!--                                         </div> -->
								<!--                                     </div> -->
								<!--                                     <div class="col-lg-3"> -->
								<!--                                         <div class="single_product"> -->
								<!--                                             <div class="product_thumb"> -->
								<!--                                                <a href="single-product.html"><img src="assets\img\product\product4.jpg" alt=""></a>  -->
								<!--                                                <div class="hot_img"> -->
								<!--                                                    <img src="assets\img\cart\span-hot.png" alt=""> -->
								<!--                                                </div> -->
								<!--                                                <div class="product_action"> -->
								<!--                                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Thêm vào giỏ</a> -->
								<!--                                                </div> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_content"> -->
								<!--                                                 <span class="product_price">$65.00</span> -->
								<!--                                                 <h3 class="product_title"><a href="single-product.html">Duis convallis</a></h3> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_info"> -->
								<!--                                                 <ul> -->
								<!--                                                     <li><a href="#" title=" Add to Wishlist ">Thêm vào yêu thích</a></li> -->
								<!--                                                     <li><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">Xem chi tiết</a></li> -->
								<!--                                                 </ul> -->
								<!--                                             </div> -->
								<!--                                         </div> -->
								<!--                                     </div> -->
								<!--                                     <div class="col-lg-3"> -->
								<!--                                         <div class="single_product"> -->
								<!--                                             <div class="product_thumb"> -->
								<!--                                                <a href="single-product.html"><img src="assets\img\product\product6.jpg" alt=""></a>  -->
								<!--                                                <div class="img_icone"> -->
								<!--                                                    <img src="assets\img\cart\span-new.png" alt=""> -->
								<!--                                                </div> -->
								<!--                                                <div class="product_action"> -->
								<!--                                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Thêm vào giỏ</a> -->
								<!--                                                </div> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_content"> -->
								<!--                                                 <span class="product_price">$50.00</span> -->
								<!--                                                 <h3 class="product_title"><a href="single-product.html">Curabitur sodales</a></h3> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_info"> -->
								<!--                                                 <ul> -->
								<!--                                                     <li><a href="#" title=" Add to Wishlist ">Thêm vào yêu thích</a></li> -->
								<!--                                                     <li><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">Xem chi tiết</a></li> -->
								<!--                                                 </ul> -->
								<!--                                             </div> -->
								<!--                                         </div> -->
								<!--                                     </div> -->
							</div>
						</div>
					</div>
					<!--new product area start-->


					<!--new product area start-->
					<div class="new_product_area product_page">
						<div class="row">
							<div class="col-12">
								<div class="block_title">
									<h3>
										<fmt:message key="mnu.splq" />
									</h3>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="single_p_active owl-carousel">
								<c:forEach items="${listSanPham}" var="sanPham"
									varStatus="status">
									<c:if test="${status.index >= 5 && status.index < 9}">
										<jsp:include page="item.jsp">
											<jsp:param name="maSanPham" value="${sanPham.maSanPham}" />
											<jsp:param name="name" value="${sanPham.tenSanPham}" />
											<jsp:param name="img" value="${sanPham.duongDanHinhAnh[0]}" />
											<jsp:param name="gia" value="${sanPham.gia}" />
										</jsp:include>
									</c:if>
								</c:forEach>
								<!--                                     <div class="col-lg-3"> -->
								<!--                                         <div class="single_product"> -->
								<!--                                             <div class="product_thumb"> -->
								<!--                                                <a href="single-product.html"><img src="assets\img\product\product5.jpg" alt=""></a>  -->
								<!--                                                <div class="hot_img"> -->
								<!--                                                    <img src="assets\img\cart\span-hot.png" alt=""> -->
								<!--                                                </div> -->
								<!--                                                <div class="product_action"> -->
								<!--                                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Thêm vào giỏ</a> -->
								<!--                                                </div> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_content"> -->
								<!--                                                 <span class="product_price">$40.00</span> -->
								<!--                                                 <h3 class="product_title"><a href="single-product.html">Quisque ornare dui</a></h3> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_info"> -->
								<!--                                                 <ul> -->
								<!--                                                     <li><a href="#" title=" Add to Wishlist ">Thêm vào yêu thích</a></li> -->
								<!--                                                     <li><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">Xem chi tiết</a></li> -->
								<!--                                                 </ul> -->
								<!--                                             </div> -->
								<!--                                         </div> -->
								<!--                                     </div> -->
								<!--                                     <div class="col-lg-3"> -->
								<!--                                         <div class="single_product"> -->
								<!--                                             <div class="product_thumb"> -->
								<!--                                                <a href="single-product.html"><img src="assets\img\product\product4.jpg" alt=""></a>  -->
								<!--                                                <div class="img_icone"> -->
								<!--                                                    <img src="assets\img\cart\span-new.png" alt=""> -->
								<!--                                                </div> -->
								<!--                                                <div class="product_action"> -->
								<!--                                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Thêm vào giỏ</a> -->
								<!--                                                </div> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_content"> -->
								<!--                                                 <span class="product_price">$60.00</span> -->
								<!--                                                 <h3 class="product_title"><a href="single-product.html">Sed non turpiss</a></h3> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_info"> -->
								<!--                                                 <ul> -->
								<!--                                                     <li><a href="#" title=" Add to Wishlist ">Thêm vào yêu thích</a></li> -->
								<!--                                                     <li><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">Xem chi tiết</a></li> -->
								<!--                                                 </ul> -->
								<!--                                             </div> -->
								<!--                                         </div> -->
								<!--                                     </div> -->
								<!--                                     <div class="col-lg-3"> -->
								<!--                                         <div class="single_product"> -->
								<!--                                             <div class="product_thumb"> -->
								<!--                                                <a href="single-product.html"><img src="assets\img\product\product3.jpg" alt=""></a>  -->
								<!--                                                <div class="hot_img"> -->
								<!--                                                    <img src="assets\img\cart\span-hot.png" alt=""> -->
								<!--                                                </div> -->
								<!--                                                <div class="product_action"> -->
								<!--                                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Thêm vào giỏ</a> -->
								<!--                                                </div> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_content"> -->
								<!--                                                 <span class="product_price">$65.00</span> -->
								<!--                                                 <h3 class="product_title"><a href="single-product.html">Duis convallis</a></h3> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_info"> -->
								<!--                                                 <ul> -->
								<!--                                                     <li><a href="#" title=" Add to Wishlist ">Thêm vào yêu thích</a></li> -->
								<!--                                                     <li><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">Xem chi tiết</a></li> -->
								<!--                                                 </ul> -->
								<!--                                             </div> -->
								<!--                                         </div> -->
								<!--                                     </div> -->
								<!--                                     <div class="col-lg-3"> -->
								<!--                                         <div class="single_product"> -->
								<!--                                             <div class="product_thumb"> -->
								<!--                                                <a href="single-product.html"><img src="assets\img\product\product2.jpg" alt=""></a>  -->
								<!--                                                <div class="img_icone"> -->
								<!--                                                    <img src="assets\img\cart\span-new.png" alt=""> -->
								<!--                                                </div> -->
								<!--                                                <div class="product_action"> -->
								<!--                                                    <a href="#"> <i class="fa fa-shopping-cart"></i> Thêm vào giỏ</a> -->
								<!--                                                </div> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_content"> -->
								<!--                                                 <span class="product_price">$50.00</span> -->
								<!--                                                 <h3 class="product_title"><a href="single-product.html">Curabitur sodales</a></h3> -->
								<!--                                             </div> -->
								<!--                                             <div class="product_info"> -->
								<!--                                                 <ul> -->
								<!--                                                     <li><a href="#" title=" Add to Wishlist ">Thêm vào yêu thích</a></li> -->
								<!--                                                     <li><a href="#" data-toggle="modal" data-target="#modal_box" title="Quick view">Xem chi tiết</a></li> -->
								<!--                                                 </ul> -->
								<!--                                             </div> -->
								<!--                                         </div> -->
								<!--                                     </div> -->
							</div>
						</div>
					</div>
					<!--new product area start-->

				</div>
				<!--pos page inner end-->
			</div>
		</div>
		<!--pos page end-->
		<!--footer area start-->
		<jsp:include page="footer.jsp" />
		<!--footer area end-->

		<script>
			$(document)
					.ready(
							function() {
								// Cập nhật giá trị selectedColor khi chọn màu
								$('.color-radio').change(function() {
									var selectedColor = $(this).val();
									$('#selectedColor').val(selectedColor);
								});

								$('#addToCart')
										.click(
												function() {
													var maSP = $('#maSP').val();
													var soLuongMua = 1;

													// Lấy giá trị size từ dropdown
													var size = $('#sizeSP')
															.val();

													// Lấy giá trị màu sắc từ input ẩn được chọn
													var color = $(
															'#selectedColor')
															.val();

													// Kiểm tra xem màu sắc đã được chọn chưa
													if (!color) {
														alert('Vui lòng chọn màu sắc!');
														return; // Ngừng thực hiện nếu không có màu
													}

													$
															.ajax(
																	{
																		url : '/add?maSanPham='
																				+ maSP
																				+ '&soluong='
																				+ soLuongMua
																				+ '&isUpdate=0'
																				+ '&size='
																				+ size
																				+ '&color='
																				+ color,
																		dataType : 'json'
																	})
															.then(
																	function(
																			data) {
																		alert('Thêm thành công vào giỏ hàng!');
																		window.location.href = "cart?action=view";
																		$(
																				'#countTotal')
																				.text(
																						data.tongsl);
																	})
															.fail(
																	function(
																			error) {
																		alert('Thêm thất bại, vui lòng thử lại!');
																	});
												});
							});
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
