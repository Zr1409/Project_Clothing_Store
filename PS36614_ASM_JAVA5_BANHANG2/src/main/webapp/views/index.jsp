<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<title>index</title>
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
.chatbox {
	z-index: 1000;
	position: fixed;
	bottom: 20px;
	left: 20px;
	width: 300px;
	border: 1px solid #ccc;
	border-radius: 8px;
	display: none;
	flex-direction: column;
	background-color: #fff;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.chat-header {
	background-color: #007bff;
	color: white;
	padding: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.chat-messages {
	padding: 10px;
	max-height: 300px;
	overflow-y: auto;
}

.chat-input {
	display: flex;
	padding: 10px;
}

.chat-input input {
	flex: 1;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.chat-input button {
	margin-left: 5px;
	padding: 5px 10px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button#open-chat {
	z-index: 1000; 
	position : fixed;
	bottom: 20px;
	left: 20px;
	padding: 10px 20px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	position: fixed;
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

				<!--pos home section-->
				<!--pos home section-->
				<div class="pos_home_section">
					<div class="row">
						<!--banner slider start-->
						<div class="col-12">
							<div class="banner_slider slider_two">
								<div class="slider_active owl-carousel">
									<div class="single_slider"
										style="background-image: url(assets/img/slider/slider_2.png)">
										<div class="slider_content">
											<div class="slider_content_inner">
												<h1>
													<fmt:message key="mnu.bstm" />
												</h1>
												<p>
													<fmt:message key="mnu.clpc" />
												</p>
												<a href="#"><fmt:message key="mnu.muangay" /></a>
											</div>
										</div>
									</div>
									<div class="single_slider"
										style="background-image: url(assets/img/slider/slide_4.png)">
										<div class="slider_content">
											<div class="slider_content_inner">
												<h1>
													<fmt:message key="mnu.ttn" />
												</h1>
												<p>
													<fmt:message key="mnu.clpc" />
												</p>
												<a href="#"><fmt:message key="mnu.muangay" /></a>
											</div>
										</div>
									</div>
									<div class="single_slider"
										style="background-image: url(assets/img/slider/slider_3.png)">
										<div class="slider_content">
											<div class="slider_content_inner">
												<h1>
													<fmt:message key="mnu.bsttn" />
												</h1>
												<p>
													<fmt:message key="mnu.clpc" />
												</p>
												<a href="#"><fmt:message key="mnu.muangay" /></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!--banner slider start-->
						</div>
					</div>

					<!--new product area start-->
					<div class="new_product_area product_two">
						<div class="row">
							<div class="col-12">
								<div class="block_title">
									<h3>
										<fmt:message key="mnu.spm" />
									</h3>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="single_p_active owl-carousel">
								<c:forEach items="${listSanPham}" var="sanPham"
									varStatus="status">
									<c:if test="${status.index < 4}">
										<jsp:include page="item.jsp">
											<jsp:param name="maSanPham" value="${sanPham.maSanPham}" />
											<jsp:param name="name" value="${sanPham.tenSanPham}" />
											<jsp:param name="img" value="${sanPham.duongDanHinhAnh[0]}" />
											<jsp:param name="gia" value="${sanPham.gia}" />
										</jsp:include>
									</c:if>
								</c:forEach>

								<!-- 										<div class="col-lg-3"> -->
								<!-- 											<div class="single_product"> -->
								<!-- 												<div class="product_thumb"> -->
								<!-- 													<a href="chitietsanpham"><img -->
								<!-- 														src="assets\img\product\product3.jpg" alt=""></a> -->
								<!-- 													<div class="img_icone"> -->
								<!-- 														<img src="assets\img\cart\span-new.png" alt=""> -->
								<!-- 													</div> -->
								<!-- 													<div class="product_action"> -->
								<!-- 														<a href="#"> <i class="fa fa-shopping-cart"></i> Add -->
								<!-- 															to cart -->
								<!-- 														</a> -->
								<!-- 													</div> -->
								<!-- 												</div> -->
								<!-- 												<div class="product_content"> -->
								<!-- 													<span class="product_price">$60.00</span> -->
								<!-- 													<h3 class="product_title"> -->
								<!-- 														<a href="single-product.html">Sed non turpiss</a> -->
								<!-- 													</h3> -->
								<!-- 												</div> -->
								<!-- 												<div class="product_info"> -->
								<!-- 													<ul> -->
								<!-- 														<li><a href="#" title=" Add to Wishlist ">Add to -->
								<!-- 																Wishlist</a></li> -->
								<!-- 														<li><a href="#" data-toggle="modal" -->
								<!-- 															data-target="#modal_box" title="Quick view">View -->
								<!-- 																Detail</a></li> -->
								<!-- 													</ul> -->
								<!-- 												</div> -->
								<!-- 											</div> -->
								<!-- 										</div> -->
								<!-- 										<div class="col-lg-3"> -->
								<!-- 											<div class="single_product"> -->
								<!-- 												<div class="product_thumb"> -->
								<!-- 													<a href="single-product.html"><img -->
								<!-- 														src="assets\img\product\product4.jpg" alt=""></a> -->
								<!-- 													<div class="hot_img"> -->
								<!-- 														<img src="assets\img\cart\span-hot.png" alt=""> -->
								<!-- 													</div> -->
								<!-- 													<div class="product_action"> -->
								<!-- 														<a href="#"> <i class="fa fa-shopping-cart"></i> Add -->
								<!-- 															to cart -->
								<!-- 														</a> -->
								<!-- 													</div> -->
								<!-- 												</div> -->
								<!-- 												<div class="product_content"> -->
								<!-- 													<span class="product_price">$65.00</span> -->
								<!-- 													<h3 class="product_title"> -->
								<!-- 														<a href="single-product.html">Duis convallis</a> -->
								<!-- 													</h3> -->
								<!-- 												</div> -->
								<!-- 												<div class="product_info"> -->
								<!-- 													<ul> -->
								<!-- 														<li><a href="#" title=" Add to Wishlist ">Add to -->
								<!-- 																Wishlist</a></li> -->
								<!-- 														<li><a href="#" data-toggle="modal" -->
								<!-- 															data-target="#modal_box" title="Quick view">View -->
								<!-- 																Detail</a></li> -->
								<!-- 													</ul> -->
								<!-- 												</div> -->
								<!-- 											</div> -->
								<!-- 										</div> -->
								<!-- 										<div class="col-lg-3"> -->
								<!-- 											<div class="single_product"> -->
								<!-- 												<div class="product_thumb"> -->
								<!-- 													<a href="single-product.html"><img -->
								<!-- 														src="assets\img\product\product6.jpg" alt=""></a> -->
								<!-- 													<div class="img_icone"> -->
								<!-- 														<img src="assets\img\cart\span-new.png" alt=""> -->
								<!-- 													</div> -->
								<!-- 													<div class="product_action"> -->
								<!-- 														<a href="#"> <i class="fa fa-shopping-cart"></i> Add -->
								<!-- 															to cart -->
								<!-- 														</a> -->
								<!-- 													</div> -->
								<!-- 												</div> -->
								<!-- 												<div class="product_content"> -->
								<!-- 													<span class="product_price">$50.00</span> -->
								<!-- 													<h3 class="product_title"> -->
								<!-- 														<a href="single-product.html">Curabitur sodales</a> -->
								<!-- 													</h3> -->
								<!-- 												</div> -->
								<!-- 												<div class="product_info"> -->
								<!-- 													<ul> -->
								<!-- 														<li><a href="#" title=" Add to Wishlist ">Add to -->
								<!-- 																Wishlist</a></li> -->
								<!-- 														<li><a href="#" data-toggle="modal" -->
								<!-- 															data-target="#modal_box" title="Quick view">View -->
								<!-- 																Detail</a></li> -->
								<!-- 													</ul> -->
								<!-- 												</div> -->
								<!-- 											</div> -->
								<!-- 										</div> -->
							</div>
						</div>
					</div>
					<!--new product area start-->
					<!--new product area start-->

					<!--banner area start-->
					<div class="banner_area banner_two">
						<div class="row">
							<div class="col-lg-4 col-md-6">
								<div class="single_banner">
									<a href="#"><img src="assets\img\banner\banner7.jpg" alt=""></a>
									<div class="banner_title">
										<p>
											<fmt:message key="mnu.upto" />
										</p>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6">
								<div class="single_banner">
									<a href="#"><img src="assets\img\banner\banner8.jpg" alt=""></a>
									<div class="banner_title title_2">
										<p>
											<fmt:message key="mnu.saleoff" />
										</p>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6">
								<div class="single_banner">
									<a href="#"><img src="assets\img\banner\banner11.jpg"
										alt=""></a>
									<div class="banner_title title_3">
										<p>
											<fmt:message key="mnu.saleoff" />
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--banner area end-->

					<!--featured product start-->
					<div class="new_product_area product_two">
						<div class="row">
							<div class="col-12">
								<div class="block_title">
									<h3>
										<fmt:message key="mnu.spnb" />
									</h3>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="single_p_active owl-carousel">
								<c:forEach items="${listSanPham}" var="sanPham"
									varStatus="status">
									<c:if test="${status.index >= 4 && status.index < 9}">
										<jsp:include page="item.jsp">
											<jsp:param name="maSanPham" value="${sanPham.maSanPham}" />
											<jsp:param name="name" value="${sanPham.tenSanPham}" />
											<jsp:param name="img" value="${sanPham.duongDanHinhAnh[0]}" />
											<jsp:param name="gia" value="${sanPham.gia}" />
										</jsp:include>
									</c:if>
								</c:forEach>

							</div>
						</div>
					</div>
					<!--featured product end-->

					<!--featured product area start-->

					<!--blog area start-->
					<div class="blog_area blog_two">
						<div class="row">
							<div class="col-lg-4 col-md-6">
								<div class="single_blog">
									<div class="blog_thumb">
										<a href="sanpham"><img src="assets\img\blog\blog3.jpg"
											alt=""></a>
									</div>
									<div class="blog_content">
										<div class="blog_post">
											<ul>
												<li><a href="sanpham"><fmt:message key="mnu.tech" /></a>
												</li>
											</ul>
										</div>
										<h3>
											<a href="sanpham"><fmt:message key="mnu.1tt" /></a>
										</h3>
										<p>
											<fmt:message key="mnu.1nd" />
										</p>
										<div class="post_footer">
											<div class="post_meta">
												<ul>
													<li>Jun 20, 2024</li>
													<li>3 <fmt:message key="mnu.comments" /></li>
												</ul>
											</div>
											<div class="Read_more">
												<a href="sanpham"><fmt:message key="mnu.readmore" /> <i
													class="fa fa-angle-double-right"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6">
								<div class="single_blog">
									<div class="blog_thumb">
										<a href="sanpham"><img src="assets\img\blog\blog4.jpg"
											alt=""></a>
									</div>
									<div class="blog_content">
										<div class="blog_post">
											<ul>
												<li><a href="sanpham"><fmt:message key="mnu.nam" /></a>
												</li>
											</ul>
										</div>
										<h3>
											<a href="sanpham"><fmt:message key="mnu.2tt" /></a>
										</h3>
										<p>
											<fmt:message key="mnu.2nd" />
										</p>
										<div class="post_footer">
											<div class="post_meta">
												<ul>
													<li>Jun 20, 2024</li>
													<li>3 <fmt:message key="mnu.comments" /></li>
												</ul>
											</div>
											<div class="Read_more">
												<a href="sanpham"><fmt:message key="mnu.readmore" /> <i
													class="fa fa-angle-double-right"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-6">
								<div class="single_blog">
									<div class="blog_thumb">
										<a href="sanpham"><img src="assets\img\blog\blog1.jpg"
											alt=""></a>
									</div>
									<div class="blog_content">
										<div class="blog_post">
											<ul>
												<li><a href="sanpham"><fmt:message key="mnu.nu" /></a>
												</li>
											</ul>
										</div>
										<h3>
											<a href="sanpham"><fmt:message key="mnu.3tt" /></a>
										</h3>
										<p>
											<fmt:message key="mnu.3nd" />
										</p>
										<div class="post_footer">
											<div class="post_meta">
												<ul>
													<li>Jun 20, 2024</li>
													<li>3 <fmt:message key="mnu.comments" /></li>
												</ul>
											</div>
											<div class="Read_more">
												<a href="sanpham"><fmt:message key="mnu.readmore" /> <i
													class="fa fa-angle-double-right"></i></a>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<!--blog area end-->

					<!--brand logo strat-->
					<div class="brand_logo brand_two">
						<div class="block_title">
							<h3>
								<fmt:message key="mnu.th" />
							</h3>
						</div>
						<div class="row">
							<div class="brand_active owl-carousel">
								<div class="col-lg-2">
									<div class="single_brand">
										<a href="#"><img src="assets\img\brand\brand1.jpg" alt=""></a>
									</div>
								</div>
								<div class="col-lg-2">
									<div class="single_brand">
										<a href="#"><img src="assets\img\brand\brand2.jpg" alt=""></a>
									</div>
								</div>
								<div class="col-lg-2">
									<div class="single_brand">
										<a href="#"><img src="assets\img\brand\brand3.jpg" alt=""></a>
									</div>
								</div>
								<div class="col-lg-2">
									<div class="single_brand">
										<a href="#"><img src="assets\img\brand\brand4.jpg" alt=""></a>
									</div>
								</div>
								<div class="col-lg-2">
									<div class="single_brand">
										<a href="#"><img src="assets\img\brand\brand5.jpg" alt=""></a>
									</div>
								</div>
								<div class="col-lg-2">
									<div class="single_brand">
										<a href="#"><img src="assets\img\brand\brand6.jpg" alt=""></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--brand logo end-->
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

	<!-- all js here -->
	<script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
	<script src="assets\js\popper.js"></script>
	<script src="assets\js\bootstrap.min.js"></script>
	<script src="assets\js\ajax-mail.js"></script>
	<script src="assets\js\plugins.js"></script>
	<script src="assets\js\main.js"></script>
	<button id="open-chat"><fmt:message key="mnu.chatvoichungtoi" /></button>
	<div class="chatbox" id="chatbox" style="display: none;">
		<div class="chat-header">
			<h3><fmt:message key="mnu.chatbox" /></h3>
			<button id="close-chat">✖</button>
		</div>
		<div class="chat-messages" id="chat-messages"></div>
		<div class="chat-input">
			<input type="text" id="user-input"
				placeholder="<fmt:message key="mnu.nhaptinnhan" />" />
			<button id="send-button"><fmt:message key="mnu.gui" /></button>
		</div>
	</div>

	<script>
    document.getElementById('open-chat').addEventListener('click', function () {
        document.getElementById('chatbox').style.display = 'flex';
    });

    document.getElementById('close-chat').addEventListener('click', function () {
        document.getElementById('chatbox').style.display = 'none';
    });

    document.getElementById('send-button').addEventListener('click', function () {
        const userInput = document.getElementById('user-input');
        const userMessage = userInput.value;

        if (userMessage.trim() !== '') {
            appendMessage('Bạn: ' + userMessage);
            userInput.value = '';

            // Disable send button to prevent multiple requests
            const sendButton = document.getElementById('send-button');
            sendButton.disabled = true;

            // Gọi API để lấy phản hồi từ chatbot
            getChatbotResponse(userMessage);

            // Re-enable send button after 2 seconds
            setTimeout(function () {
                sendButton.disabled = false;
            }, 2000);
        }
    });

    function appendMessage(message) {
        const messageElement = document.createElement('div');
        messageElement.textContent = message;
        document.getElementById('chat-messages').appendChild(messageElement);
    }

    function getChatbotResponse(userMessage) {
        fetch('/chat', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ message: userMessage })
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            appendMessage('Chatbot: ' + data.reply);
        })
        .catch(error => {
            console.error('Error:', error);
            appendMessage('Chatbot: Có lỗi xảy ra, xin thử lại.');
        });
    }
</script>


</body>
</html>

