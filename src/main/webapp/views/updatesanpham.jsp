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
<title>Chỉnh sửa sản phẩm</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.png">

<!-- all css here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/plugin.css">
<link rel="stylesheet" href="assets/css/bundle.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/responsive.css">
<script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
<style>
.form-container {
	max-width: 500px;
	margin: 0 auto;
	background: #f7f7f7;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-header {
	text-align: center;
	margin-bottom: 20px;
}

.form-control {
	with: 800px;
	height:40px;
}

#preview {
	display: flex;
	flex-wrap: wrap;
	margin-top: 10px;
}

#preview img {
	max-width: 100px;
	max-height: 100px;
	margin-right: 10px;
	margin-bottom: 10px;
}

#fileNames {
	margin-top: 10px;
}
.btn-primary {
   	height:40px;
   	font-size: 16px; 
    border-radius: 5px; /* Tùy chọn: điều chỉnh border-radius nếu cần */
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
									<li><a href="index.html"><fmt:message key="mnu.home1" /></a></li>
									<li><i class="fa fa-angle-right"></i></li>
									<li><fmt:message key="mnu.chinhsua" /></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!--breadcrumbs area end-->

				<div class="container">

					<div class="form-container">
						<h2 class="form-header">Chỉnh sửa sản phẩm</h2>
						<form class="updatesanpham" method="post"
							enctype="multipart/form-data">
							<div class="mb-3">
								<label for="tenSanPham" class="form-label">Tên sản phẩm:</label>
								<input type="text" id="tenSanPham" name="tenSanPham"
									class="form-control" value="${sanPham.tenSanPham}" required>
							</div>

							<div class="mb-3">
								<label for="gia" class="form-label">Giá:</label> <input
									type="number" id="gia" name="gia" class="form-control" value="${sanPham.gia}" required>
							</div>

							<div class="mb-3">
								<label for="moTa" class="form-label">Mô tả:</label>
								<textarea id="moTa" name="moTa" rows="2"
									>${sanPham.moTa}</textarea>
							</div>

							<div class="mb-3">
								<label for="file" class="form-label">Ảnh:</label> <input
									type="file" id="file" name="file" class="form-control" multiple
									 onchange="previewImages(event)">							
								<div id="preview"></div>								
								<input id="fileNames" name="fileNames" value="${sanPham.duongDanHinhAnh}"> <!-- Thay đổi từ div sang input ẩn -->
							</div>

							<div class="text-center">
								<input type="submit" name="updatesanphamButton" value="Upload"
									class="btn btn-primary">
							</div>
						</form>
					</div>
				</div>
			</div>
			<!--pos page inner end-->
		</div>
	</div>
	<!--pos page end-->

	<!--footer area start-->
	<jsp:include page="footer.jsp" />
	<!--footer area end-->

	<!-- all js here -->
	<script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
	<script src="assets/js/popper.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/ajax-mail.js"></script>
	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
	<script>
// 		var selectedFiles = [];
// 		function previewImages(event) {
// 		    var files = event.target.files;
// 		    var preview = document.getElementById('preview');
// 		    var fileNames = [];

// 		    // Clear previous preview
// 		    //preview.innerHTML = '';

// 		    for (var i = 0; i < files.length; i++) {
// 		        selectedFiles.push(files[i]);

// 		        var reader = new FileReader();
// 		        reader.onload = function(e) {
// 		            var img = document.createElement('img');
// 		            img.src = e.target.result;
// 		            img.style.width = '100px'; // Resize image preview if needed
// 		            img.style.margin = '5px';
// 		            preview.appendChild(img);
// 		        }
// 		        reader.readAsDataURL(files[i]);

// 		        fileNames.push(files[i].name);
// 		    }

// 		    // Update the hidden input field with file names	   
// 		    document.getElementById('fileNames').value = selectedFiles.map(file => file.name).join(',');
// 		}
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
