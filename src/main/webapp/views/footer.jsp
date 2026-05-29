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
</head>
<body>
<!--footer area start-->
	<div class="footer_area">
		<div class="footer_top">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="footer_widget">
							<h3><fmt:message key="mnu.we" /></h3>
							<p><fmt:message key="mnu.trg" /></p>
							<div class="footer_widget_contect">
								<p>
									<i class="fa fa-map-marker" aria-hidden="true"></i> <fmt:message key="mnu.trg1" />
								</p>
								<p>
									<i class="fa fa-mobile" aria-hidden="true"></i> 0358768117
								</p>
								<a href="#"><i class="fa fa-envelope-o" aria-hidden="true"></i>
									tranvandu19971029@gmail.com </a>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="footer_widget">
							<h3><fmt:message key="mnu.tkct" /></h3>
							<ul>
								<li><a href="#"><fmt:message key="mnu.tkcb" /></a></li>
								<li><a href="#"><fmt:message key="mnu.dhct" /></a></li>
								<li><a href="#"><fmt:message key="mnu.ptdct" /></a></li>
								<li><a href="#"><fmt:message key="mnu.dcct" /></a></li>
								<li><a href="#"><fmt:message key="mnu.dn" /></a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="footer_widget">
							<h3><fmt:message key="mnu.tt" /></h3>
							<ul>
								<li><a href="#"><fmt:message key="mnu.db" /></a></li>
								<li><a href="#"><fmt:message key="mnu.chcct" /></a></li>
								<li><a href="#"><fmt:message key="mnu.ptdct" /></a></li>
								<li><a href="#"><fmt:message key="mnu.dkdk" /></a></li>
								<li><a href="#"><fmt:message key="mnu.vct" /></a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="footer_widget">
							<h3><fmt:message key="mnu.them" /></h3>
							<ul>
								<li><a href="#"><fmt:message key="mnu.th2" /></a></li>
								<li><a href="#"><fmt:message key="mnu.pqt" /></a></li>
								<li><a href="#"><fmt:message key="mnu.lk" /></a></li>
								<li><a href="#"><fmt:message key="mnu.db" /></a></li>
								<li><a href="#"><fmt:message key="mnu.csbm2" /></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer_bottom">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-6">
						<div class="copyright_area">
							<ul>
								<li><a href="#"><fmt:message key="mnu.we" /></a></li>
								<li><a href="#"><fmt:message key="mnu.dvkh" /></a></li>
								<li><a href="#"><fmt:message key="mnu.csbm" /></a></li>
							</ul>
							<p>
								<fmt:message key="mnu.ttft" />
							</p>
						</div>
					</div>
					<div class="col-lg-6 col-md-6">
						<div class="footer_social text-right">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"
										aria-hidden="true"></i></a></li>
								<li><a class="pinterest" href="#"><i
										class="fa fa-pinterest-p" aria-hidden="true"></i></a></li>
								<li><a href="#"><i class="fa fa-wifi"
										aria-hidden="true"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>