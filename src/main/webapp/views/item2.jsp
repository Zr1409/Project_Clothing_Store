<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<c:set var="lang" value="${sessionScope.lang}" />
<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="messages" />
<div class="col-lg-4 col-md-6">
	<div class="single_product">
		<div class="product_thumb">
			<a href="chitietsanpham?maSanPham=${param.maSanPham}"> <img
				src="assets/img/product/${param.img}" alt="${param.name}">
			</a>
			<div class="img_icone">
				<img src="assets/img/cart/span-new.png" alt="New">
			</div>
			<div class="product_action">
				<a href="chitietsanpham?maSanPham=${param.maSanPham}"> <i
					class="fa fa-shopping-cart"></i> <fmt:message key="mnu.addcart" /></a>
			</div>
		</div>
		<div class="product_content">
			<span class="product_price">
			<c:choose>
                    <c:when test="${sessionScope.currency == 'USD'}">
                        <fmt:formatNumber value="${param.gia / sessionScope.usdToVnd}" type="currency" currencySymbol="$" />
                    </c:when>
                    <c:when test="${sessionScope.currency == 'JPY'}">
                        <fmt:formatNumber value="${param.gia / sessionScope.jpyToVnd}" type="currency" currencySymbol="¥"  />
                    </c:when>
                    <c:otherwise>
                        <fmt:formatNumber value="${param.gia}" type="currency" currencySymbol="VNĐ"  />
                    </c:otherwise>
                </c:choose>
			</span>
			<h3 class="product_title">
				<a href="chitietsanpham?maSanPham=${param.maSanPham}">${param.name}</a>
			</h3>
		</div>
		<div class="product_info">
			<ul>
				<li><a href="#" title="Add to Wishlist"><fmt:message
							key="mnu.addwishlist" /></a></li>
				<%--                 <li><a href="sanpham?maSanPham=${param.maSanPham}" class="open-modal" title="Quick view"><fmt:message key="mnu.viewdetail"/></a></li> --%>
				<li><a href="chitietsanpham?maSanPham=${param.maSanPham}"
					class="open-modal" title="Quick view"><fmt:message
							key="mnu.viewdetail" /></a></li>
			</ul>
		</div>
	</div>
</div>
