<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đặt vé</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* Tùy chỉnh style tại đây */
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3>Các ngày chiếu:</h3>
				<ul class="list-group" id="listNgayChieu">
					<!-- Dữ liệu về ngày chiếu sẽ được thêm vào đây -->
				</ul>
			</div>
		</div>
		<div class="row">
		<div class="col-md-6">
			<h3>Chọn ca chiếu:</h3>
			<ul class="list-group" id="listCaChieu">
				<!-- Dữ liệu về ca chiếu sẽ được thêm vào đây -->
			</ul>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<h3>Chọn ghế:</h3>
			<!-- Sơ đồ ghế -->
			<img src="so-do-ghe.jpg" alt="Sơ đồ ghế"> <br>
			<button class="btn btn-primary mt-3">Xác nhận đặt vé</button>
		</div>
	</div>
	</div>

	<!-- Bootstrap JS and jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<!-- JavaScript để lấy dữ liệu từ controller -->
	<script>
		// Function để lấy dữ liệu về ngày chiếu từ controller
		function getNgayChieuData() {
			$.ajax({
				url : "url-cua-controller-lay-ngay-chieu",
				success : function(data) {
					// Hiển thị dữ liệu về ngày chiếu
					showNgayChieu(data);
				}
			});
		}

		// Function để hiển thị dữ liệu về ngày chiếu
		function showNgayChieu(ngayChieuData) {
			var listNgayChieu = document.getElementById("listNgayChieu");
			listNgayChieu.innerHTML = ""; // Xóa dữ liệu cũ

			// Thêm dữ liệu mới
			ngayChieuData.forEach(function(ngayChieu) {
				var listItem = document.createElement("li");
				listItem.className = "list-group-item";
				listItem.innerText = ngayChieu;

				listItem.addEventListener("click", function() {
					getCaChieuData(ngayChieu);
				});

				listNgayChieu.appendChild(listItem);
			});
		}

		// Function để lấy dữ liệu về ca chiếu từ controller dựa vào ngày chiếu được chọn
		function getCaChieuData(ngayChieu) {
			$.ajax({
				url : "url-cua-controller-lay-ca-chieu",
				data : {
					ngayChieu : ngayChieu
				},
				success : function(data) {
					// Hiển thị dữ liệu về ca chiếu
					showCaChieu(data);
				}
			});
		}

		// Function để hiển thị dữ liệu về ca chiếu dựa vào ngày chiếu được chọn
		function showCaChieu(caChieuData) {
			var listCaChieu = document.getElementById("listCaChieu");
			listCaChieu.innerHTML = ""; // Xóa dữ liệu cũ

			// Thêm dữ liệu mới
			caChieuData.forEach(function(caChieu) {
				var listItem = document.createElement("li");
				listItem.className = "list-group-item";
				listItem.innerText = caChieu;

				listCaChieu.appendChild(listItem);
			});
		}

		// Hiển thị dữ liệu về ngày chiếu khi trang được load
		window.onload = getNgayChieuData;
	</script>
</body>
</html>
