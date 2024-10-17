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
        <title>Yêu thích</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets\img\favicon.png">
		
		<!-- all css here -->
       <link rel="stylesheet" href="assets\css\bootstrap.min.css">
        <link rel="stylesheet" href="assets\css\plugin.css">
        <link rel="stylesheet" href="assets\css\bundle.css">
        <link rel="stylesheet" href="assets\css\style.css">
        <link rel="stylesheet" href="assets\css\responsive.css">
        <script src="assets\js\vendor\modernizr-2.8.3.min.js"></script>
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
                        <!--header end -->
                         <!--breadcrumbs area start-->
                        <div class="breadcrumbs_area">
                            <div class="row">
                                <div class="col-12">
                                    <div class="breadcrumb_content">
                                        <ul>
                                            <li><a href="index.html">Trang Chủ</a></li>
                                            <li><i class="fa fa-angle-right"></i></li>
                                            <li>Danh Sách Yêu Thích</li>
                                        </ul>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--breadcrumbs area end-->

                         <!--shopping cart area start -->
                        <div class="shopping_cart_area">
                               <form action="#"> 
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="table_desc wishlist">
                                                <div class="cart_page table-responsive">
                                                    <table>
                                                        <thead>
                                                            <tr>
                                                                <th class="product_remove">Xóa</th>
                                                                <th class="product_thumb">Hình Ảnh</th>
                                                                <th class="product_name">Sản Phẩm</th>
                                                                <th class="product-price">Giá</th>
                                                                <th class="product_quantity">Tình Trạng</th>
                                                                <th class="product_total">Thêm Vào Giỏ</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                               <td class="product_remove"><a href="#">X</a></td>
                                                                <td class="product_thumb"><a href="#"><img src="assets\img\cart\cart17.jpg" alt=""></a></td>
                                                                <td class="product_name"><a href="#">Viền súi sách</a></td>
                                                                <td class="product-price">$65.00</td>
                                                                <td class="product_quantity">Còn Hàng</td>
                                                                <td class="product_total"><a href="#">Thêm Vào Giỏ</a></td>


                                                            </tr>

                                                            <tr>
                                                               <td class="product_remove"><a href="#">X</a></td>
                                                                <td class="product_thumb"><a href="#"><img src="assets\img\cart\cart18.jpg" alt=""></a></td>
                                                                <td class="product_name"><a href="#">Túi Xách Vừa</a></td>
                                                                <td class="product-price">$90.00</td>
                                                                <td class="product_quantity">Còn Hàng</td>
                                                                <td class="product_total"><a href="#">Thêm Vào Giỏ</a></td>


                                                            </tr>
                                                            <tr>
                                                               <td class="product_remove"><a href="#">X</a></td>
                                                                <td class="product_thumb"><a href="#"><img src="assets\img\cart\cart19.jpg" alt=""></a></td>
                                                                <td class="product_name"><a href="#">Tinh Hoa Túi Xách</a></td>
                                                                <td class="product-price">$80.00</td>
                                                                <td class="product_quantity">Còn Hàng</td>
                                                                <td class="product_total"><a href="#">Thêm Vào Giỏ</a></td>


                                                            </tr>

                                                        </tbody>
                                                    </table>   
                                                </div>  

                                            </div>
                                         </div>
                                     </div>

                                </form> 
                                <div class="row">
                                    <div class="col-12">
                                         <div class="wishlist-share">
                                            <h4>Chia sẽ:</h4>
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
                         <!--shopping cart area end -->

                    </div>
                    <!--pos page inner end-->
                </div>
            </div>
            <!--pos page end-->
            
         <!--footer area start-->
	<jsp:include page="footer.jsp" />
	<!--footer area end-->
            
            
            
            
      
		
		<!-- all js here -->
        <script src="assets\js\vendor\jquery-1.12.0.min.js"></script>
        <script src="assets\js\popper.js"></script>
        <script src="assets\js\bootstrap.min.js"></script>
        <script src="assets\js\ajax-mail.js"></script>
        <script src="assets\js\plugins.js"></script>
        <script src="assets\js\main.js"></script>
    </body>
</html>
