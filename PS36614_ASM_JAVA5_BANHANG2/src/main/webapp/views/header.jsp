<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<c:set var="lang" value="${sessionScope.lang}" />
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="messages" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> -->

</head>
<body>

	<!--header area -->
	<div class="header_area">
		<!--header top-->
		<div class="header_top">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6">
					<div class="switcher">
						<ul>
							<li class="languages"><a href="#" id="current-language">
									<c:choose>
										<c:when test="${lang == 'vi'}">
											<img src="assets/img/logo/viet-nam.svg" alt=""> Việt Nam
                                        </c:when>
										<c:when test="${lang == 'ja'}">
											<img src="assets/img/logo/Japan.svg" alt="">Nhật Bản
                                        </c:when>
										<c:otherwise>
											<img src="assets/img/logo/united-states.svg" alt=""> English
                                        </c:otherwise>
									</c:choose> <%-- 									</c:choose> <i class="fa fa-angle-down"></i> --%>
							</a>
								<ul class="dropdown_languages">
									<li><a href="ChangeLang?lang=vi"
										onclick="changeLanguage('vi'); return false;"> <img
											src="assets/img/logo/viet-nam.svg" alt=""> Việt Nam
									</a></li>
									<li><a href="ChangeLang?lang=ja"
										onclick="changeLanguage('ja'); return false;"> <img
											src="assets/img/logo/Japan.svg" alt="">Nhật Bản
									</a></li>
									<li><a href="ChangeLang?lang=en"
										onclick="changeLanguage('en'); return false;"> <img
											src="assets/img/logo/united-states.svg" alt=""> English
									</a></li>
								</ul></li>



							<li class="currency"><a href="#"> <fmt:message
										key="mnu.currency" /> <c:out value="${sessionScope.currency}" />
									<i class="fa fa-angle-down"></i>
							</a>
								<ul class="dropdown_currency">
									<li><a href="#"> Vietnamese (VNĐ) </a></li>
									<li><a href="#"> Dollar (USD)</a></li>
									<li><a href="#"> Japan (JPY)</a></li>

								</ul></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="header_links">
						<ul>
							<c:choose>
								<c:when test="${not empty sessionScope.khachHang}">
									<li><a href="lienhe" title="Contact"><fmt:message
												key="mnu.contact" /></a></li>
									<li><a href="wishlist" title="wishlist"><fmt:message
												key="mnu.wishlist" /></a></li>
									<li><a href="admin"><fmt:message key="mnu.myaccount" />:
											${sessionScope.khachHang.tenKhachHang}</a></li>
									<li><a href="logout" title="logout"><fmt:message
												key="mnu.logout" /></a></li>
								</c:when>
								<c:when test="${not empty sessionScope.nhanVien}">
									<li><a href="lienhe" title="Contact"><fmt:message
												key="mnu.contact" /></a></li>
									<li><a href="wishlist" title="wishlist"><fmt:message
												key="mnu.wishlist" /></a></li>
									<li><a href="admin"><fmt:message key="mnu.myaccount" />:
											${sessionScope.nhanVien.tenNhanVien}</a></li>
									<li><a href="logout" title="logout"><fmt:message
												key="mnu.logout" /></a></li>
								</c:when>
								<c:otherwise>
									<li><a href="lienhe" title="Contact"><fmt:message
												key="mnu.contact" /></a></li>
									<li><a href="wishlist" title="wishlist"><fmt:message
												key="mnu.wishlist" /></a></li>
									<li><a href="login" title="login"><fmt:message
												key="mnu.login" /></a></li>
									<li><a href="register" title="register"><fmt:message
												key="mnu.register" /></a></li>
								</c:otherwise>
							</c:choose>
						</ul>

					</div>
				</div>
			</div>
		</div>
		<!--header top end-->
		<!--header middel-->
		<div class="header_middel">
			<div class="row align-items-center">
				<div class="col-lg-3 col-md-3">
					<div class="logo">
						<a href="index"><img src="assets\img\logo\logo.jpg.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-9 col-md-9">
					<div class="header_right_info">
						<div class="search_bar">
							<form action="#">
								<input placeholder="Search..." type="text">
								<button type="submit">
									<i class="fa fa-search"></i>
								</button>
							</form>
						</div>
						<div class="shopping_cart">

							<a class=" position-relative" href="cart?action=view"><i
								style="color: #00bba6; font-size: 30px;"
								class="fa fa-shopping-cart"></i> <span style="font-size: 12px"
								id="countTotal"
								class="position-absolute top-0 start-90 translate-middle badge rounded-pill bg-danger text-white">
									${sessionScope.cart.tongsl} </span> </a>

							<!-- 							<a href="cart?action=view"><i -->
							<!-- 								style="color: red; font-size: 30px;" class="fa fa-shopping-cart"></i>(<span -->
							<%-- 								id="countTotal">${sessionScope.cart.tongsl}</span>) </a> --%>

							<!--mini cart-->
							<!-- 							<div class="mini_cart"> -->
							<!-- 								<div class="cart_item"> -->
							<!-- 									<div class="cart_img"> -->
							<!-- 										<a href="#"><img src="assets\img\cart\cart.jpg" alt=""></a> -->
							<!-- 									</div> -->
							<!-- 									<div class="cart_info"> -->
							<!-- 										<a href="#">lorem ipsum dolor</a> <span class="cart_price">$115.00</span> -->
							<!-- 										<span class="quantity">Qty: 1</span> -->
							<!-- 									</div> -->
							<!-- 									<div class="cart_remove"> -->
							<!-- 										<a title="Remove this item" href="#"><i -->
							<!-- 											class="fa fa-times-circle"></i></a> -->
							<!-- 									</div> -->
							<!-- 								</div> -->
							<!-- 								<div class="cart_item"> -->
							<!-- 									<div class="cart_img"> -->
							<!-- 										<a href="#"><img src="assets\img\cart\cart2.jpg" alt=""></a> -->
							<!-- 									</div> -->
							<!-- 									<div class="cart_info"> -->
							<!-- 										<a href="#">Quisque ornare dui</a> <span class="cart_price">$105.00</span> -->
							<!-- 										<span class="quantity">Qty: 1</span> -->
							<!-- 									</div> -->
							<!-- 									<div class="cart_remove"> -->
							<!-- 										<a title="Remove this item" href="#"><i -->
							<!-- 											class="fa fa-times-circle"></i></a> -->
							<!-- 									</div> -->
							<!-- 								</div> -->
							<!-- 								<div class="shipping_price"> -->
							<!-- 									<span> Shipping </span> <span> $7.00 </span> -->
							<!-- 								</div> -->
							<!-- 								<div class="total_price"> -->
							<!-- 									<span> total </span> <span class="prices"> $227.00 </span> -->
							<!-- 								</div> -->
							<!-- 								<div class="cart_button"> -->
							<!-- 									<a href="checkout.html"> Check out</a> -->
							<!-- 								</div> -->
							<!-- 							</div> -->
							<!--mini cart end-->
						</div>

					</div>
				</div>
			</div>
		</div>
		<!--header middel end-->
		<!--header_bottom-->
		<div class="header_bottom">
			<div class="row">
				<div class="col-12">
					<div class="main_menu_inner">
						<div class="main_menu d-none d-lg-block">
							<nav>
								<ul>
									<li class="active"><a href="index"><fmt:message
												key="mnu.home" /></a></li>
									<li><a href="sanpham"><fmt:message key="mnu.shop" /></a>
										<div class="mega_menu jewelry">
											<div class="mega_items jewelry">
												<ul>
													<li><a href="#">shop list</a></li>
													<li><a href="#">shop Full Width Grid</a></li>
													<li><a href="#">shop Full Width list</a></li>
													<li><a href="#">shop Right Sidebar</a></li>
													<li><a href="#">shop list Right Sidebar</a></li>
													<li><a href="#">Product Details</a></li>
													<li><a href="#">Product sidebar</a></li>
													<li><a href="#">Product Details video</a></li>
													<li><a href="#">Product Details Gallery</a></li>
												</ul>
											</div>
										</div></li>
									<li><a href="sanpham"><fmt:message key="mnu.nu" /></a>
										<div class="mega_menu">
											<div class="mega_top fix">
												<div class="mega_items">
													<h3>
														<a href="#">Accessories</a>
													</h3>
													<ul>
														<li><a href="#">Cocktai</a></li>
														<li><a href="#">day</a></li>
														<li><a href="#">Evening</a></li>
														<li><a href="#">Sundresses</a></li>
														<li><a href="#">Belts</a></li>
														<li><a href="#">Sweets</a></li>
													</ul>
												</div>
												<div class="mega_items">
													<h3>
														<a href="#">HandBags</a>
													</h3>
													<ul>
														<li><a href="#">Accessories</a></li>
														<li><a href="#">Hats and Gloves</a></li>
														<li><a href="#">Lifestyle</a></li>
														<li><a href="#">Bras</a></li>
														<li><a href="#">Scarves</a></li>
														<li><a href="#">Small Leathers</a></li>
													</ul>
												</div>
												<div class="mega_items">
													<h3>
														<a href="#">Tops</a>
													</h3>
													<ul>
														<li><a href="#">Evening</a></li>
														<li><a href="#">Long Sleeved</a></li>
														<li><a href="#">Shrot Sleeved</a></li>
														<li><a href="#">Tanks and Camis</a></li>
														<li><a href="#">Sleeveless</a></li>
														<li><a href="#">Sleeveless</a></li>
													</ul>
												</div>
											</div>
											<div class="mega_bottom fix">
												<div class="mega_thumb">
													<a href="#"><img src="assets\img\banner\banner1.jpg"
														alt=""></a>
												</div>
												<div class="mega_thumb">
													<a href="#"><img src="assets\img\banner\banner2.jpg"
														alt=""></a>
												</div>
											</div>
										</div></li>
									<li><a href="sanpham"><fmt:message key="mnu.nam" /></a>
										<div class="mega_menu">
											<div class="mega_top fix">
												<div class="mega_items">
													<h3>
														<a href="#">Rings</a>
													</h3>
													<ul>
														<li><a href="#">Platinum Rings</a></li>
														<li><a href="#">Gold Ring</a></li>
														<li><a href="#">Silver Ring</a></li>
														<li><a href="#">Tungsten Ring</a></li>
														<li><a href="#">Sweets</a></li>
													</ul>
												</div>
												<div class="mega_items">
													<h3>
														<a href="#">Bands</a>
													</h3>
													<ul>
														<li><a href="#">Platinum Bands</a></li>
														<li><a href="#">Gold Bands</a></li>
														<li><a href="#">Silver Bands</a></li>
														<li><a href="#">Silver Bands</a></li>
														<li><a href="#">Sweets</a></li>
													</ul>
												</div>
												<div class="mega_items">
													<a href="#"><img src="assets\img\banner\banner3.jpg"
														alt=""></a>
												</div>
											</div>

										</div></li>
									<li><a href="#"><fmt:message key="mnu.pages" /></a>
										<div class="mega_menu">
											<div class="mega_top fix">
												<div class="mega_items">
													<h3>
														<a href="#">Column1</a>
													</h3>
													<ul>
														<li><a href="#">Portfolio</a></li>
														<li><a href="#">single portfolio </a></li>
														<li><a href="#">About Us </a></li>
														<li><a href="#">About Us 2</a></li>
														<li><a href="#">Service </a></li>
														<li><a href="#">my account </a></li>
													</ul>
												</div>
												<div class="mega_items">
													<h3>
														<a href="#">Column2</a>
													</h3>
													<ul>
														<li><a href="#">Blog </a></li>
														<li><a href="#">Blog Details </a></li>
														<li><a href="#">Blog FullWidth</a></li>
														<li><a href="#">Blog Sidebar</a></li>
														<li><a href="#">Frequently Questions</a></li>

													</ul>
												</div>
												<div class="mega_items">
													<h3>
														<a href="#">Column3</a>
													</h3>
													<ul>
														<li><a href="#">Contact</a></li>
														<li><a href="#">cart</a></li>
														<li><a href="#">Checkout </a></li>
														<li><a href="#">Wishlist</a></li>
														<li><a href="#">Login</a></li>
													</ul>
												</div>
											</div>
										</div></li>

									<li><a href="#"><fmt:message key="mnu.blog" /></a>
										<div class="mega_menu jewelry">
											<div class="mega_items jewelry">
												<ul>
													<li><a href="#">blog details</a></li>
													<li><a href="#">blog fullwidth</a></li>
													<li><a href="#">blog sidebar</a></li>
												</ul>
											</div>
										</div></li>
									<li><a href="#"><i class="fa fa-user"></i></a>
										<div class="mega_menu jewelry">
											<div class="mega_items jewelry">
												<ul>
													<c:choose>
														<c:when test="${not empty sessionScope.khachHang}">

															<li><a href="cart?action=view"><fmt:message
																		key="mnu.mycart" /></a></li>
															<li><a href="checkout"><fmt:message
																		key="mnu.checkout" /></a></li>

															<li><a href="changepassword"><fmt:message
																		key="mnu.changepassword" /></a></li>
															<li><a href="logout"><fmt:message
																		key="mnu.logout" /></a></li>
														</c:when>
														<c:otherwise>
															<li><a href="login"><fmt:message key="mnu.login" /></a></li>
															<li><a href="register"><fmt:message
																		key="mnu.register" /></a></li>
															<li><a href="forgotpassword"><fmt:message
																		key="mnu.forgotpassword" /></a></li>
														</c:otherwise>
													</c:choose>

												</ul>
											</div>
										</div></li>

								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--header_bottom en-->
	</div>
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