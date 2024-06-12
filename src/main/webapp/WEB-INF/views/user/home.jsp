<%@page import="java.util.ArrayList"%>
<%@page import="web.model.CaChieu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<base href="${pageContext.servletContext.contextPath}/*">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #b1d1d9;
	width: 100%;
	height: 100vh;
	margin: 0;
	padding: 0;
}

.main {
	background-color: #ffffff;
	padding: 2rem;
	border-radius: 15px;
}

.chart-container {
	position: relative;
	height: 300px;
	width: 100%;
}

.movie-card {
	margin-bottom: 20px;
}

.pagination {
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<header class="navbar navbar-expand-lg navbar-light col"
				style="margin-bottom: 4.5rem;">
				<div class="container-fluid">
					<a class="navbar-brand" href="#"><img
						src="assets\images\logo\logo.png" alt="" class="mr-2">Pengu</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarNav"
						aria-controls="navbarNav" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" aria-current="page"
								href="user/home.htm">Trang chủ</a></li>
							<li class="nav-item"><a class="nav-link"
								href="user/caChieuUser.htm">Lịch chiếu</a></li>
							<li class="nav-item"><a class="nav-link"
								href="user/thanhToan.htm">Thanh toán</a></li>
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.servletContext.contextPath}/user/infor.htm">Thông
									tin cá nhân</a></li>
						</ul>
					</div>
				</div>
				<form action="<c:url value='/logout.htm'/>" method="post">
					<button type="submit" class="btn btn-info"
						style="width: 150px; height: 50px; border-radius: 15px; color: aliceblue">Đăng
						Xuất</button>
				</form>

			</header>
		</div>
		<div class="main">
			<div class="col">
				<h2>Những bộ phim chiếu rạp hot!</h2>
			</div>
			<div class="row justify-content-center" id="movieContainer">
				<c:forEach var="cc" items="${caChieus}" varStatus="loop">
					<div class="card m-4 movie-card" style="width: 16rem;"
						data-index="${loop.index}">

						<img src="${cc.phim.anhBia}" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">${cc.phim.tenPhim}</h5>
							<p class="card-text">${cc.phim.moTa}</p>
							<button href="#" class="btn btn-primary" data-bs-toggle="modal"
								data-bs-target="#movie_${cc.phim.maPhim}">Xem Chi Tiết</button>
							<button class="btn btn-primary"
								onclick="bookTicket(${cc.phim.maPhim})">Đặt Vé</button>
							<button class="btn btn-primary mt-2" data-bs-toggle="modal"
								data-bs-target="#model_youtube_${cc.phim.maPhim}">Xem
								trailer</button>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- Nút chuyển trang -->
			<div class="row justify-content-center">
				<div class="col">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center" id="pagination">
							<li class="page-item  showPage1" active><a
								class="page-link " onclick="showPage(1)">1</a></li>
							<li class="page-item showPage2"><a class="page-link "
								onclick="showPage(2)">2</a></li>
							<li class="page-item  showPage3"><a class="page-link"
								onclick="showPage(3)">3</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!--Model youtube  -->
	<c:forEach var="p" items="${caChieus}">
		<div class="modal fade" id="model_youtube_${p.phim.maPhim}"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="youtubeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header custom-modal-header">
						<h5 class="modal-title" id="youtubeModalLabel">Trailer Film</h5>
						<button type="button" class="custom-close-btn"
							data-bs-dismiss="modal" aria-label="Close">&times;</button>
					</div>
					<div class="modal-body">
						<div class="embed-responsive embed-responsive-16by9">
							<iframe id="cartoonVideo" class="embed-responsive-item"
								width="560" height="315" src="${p.phim.trailer}" allowfullscreen></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>

	</c:forEach>
	<!--End Model Youtube  -->
	<!--Phần Model  -->
	<c:forEach var="p" items="${caChieus}">
		<div class="modal fade getmodals" id="movie_${p.phim.maPhim}"
			data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header custom-modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">Chi tiết
							phim</h5>
						<button type="button" class="custom-close-btn"
							data-bs-dismiss="modal" aria-label="Close">&times;</button>
					</div>
					<div class="modal-body">
						<form class="form_film" method="POST"
							action="admin/updatePhim.htm"
							enctype="application/x-www-form-urlencoded">
							<div class="row mb-3">
								<div class="col-md-6">
									<label for="maPhim" class="form-label">Mã Phim:</label> <input
										type="text" class="form-control" name="maPhim"
										value="${p.phim.maPhim}" readonly>
								</div>
								<div class="col-md-6">
									<label for="tenPhim" class="form-label">Tên Phim:</label> <input
										type="text" class="form-control" id="tenPhim" name="tenPhim"
										value="${p.phim.tenPhim}" readonly>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-6">
									<label for="thoiLuong" class="form-label">Thời
										Lượng(Phút):</label> <input type="text" class="form-control"
										id="thoiLuong" name="thoiLuong" value="${p.phim.thoiLuong}"
										readonly>
								</div>
							</div>
							<div class="mb-3">
								<label for="moTa" class="form-label">Mô Tả:</label>
								<textarea class="form-control" id="moTa" rows="3" name="moTa"
									readonly>${p.phim.moTa}</textarea>
							</div>
							<div class="row mb-3">
								<div class="col-md-6">
									<label for="luotXem" class="form-label">Lượt Xem:</label> <input
										type="text" class="form-control" id="luotXem" name="luotXem"
										value="${p.phim.luotXem}" readonly>
								</div>
								<div class="col-md-6">
									<label for="luotThich" class="form-label">Lượt Thích:</label> <input
										type="text" class="form-control" id="luotThich"
										name="luotThich" value="${p.phim.luotThich}" readonly>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-6">
									<label for="trangThai" class="form-label">Trạng Thái:</label> <select
										class="form-select" id="trangThai" name="trangThai" disabled
										style="width: 370px; height: 40px">
										<option value="Đang Chiếu"
											${p.phim.trangThai == 'Đang Chiếu' ? 'selected' : ''}>Đang
											Chiếu</option>
										<option value="Sắp Chiếu"
											${p.phim.trangThai == 'Sắp Chiếu' ? 'selected' : ''}>Sắp
											Chiếu</option>
										<option value="Đã Chiếu"
											${p.phim.trangThai == 'Đã Chiếu' ? 'selected' : ''}>Đã
											Chiếu</option>
									</select>
								</div>
								<div class="col-md-6">
									<label for="ngonNgu" class="form-label">Ngôn Ngữ:</label> <input
										type="text" class="form-control" id="ngonNgu" name="ngonNgu"
										value="${p.phim.ngonNgu}" readonly>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-6">
									<label for="phuDe" class="form-label">Phụ Đề:</label> <input
										type="text" class="form-control" id="phuDe" name="phuDe"
										value="${p.phim.phuDe}" readonly>
								</div>
								<div class="col-md-6">
									<label for="gioiHanTuoi" class="form-label">Giới Hạn
										Tuổi:</label> <input type="text" class="form-control" id="gioiHanTuoi"
										name="gioiHanTuoi" value="${p.phim.gioiHanTuoi}" readonly>
								</div>
							</div>


						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Thoát</button>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<!--End Phần Model  -->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {

		});
		var itemsPerPage = 3; // Số lượng phim trên mỗi trang
		var currentPage = 1; // Trang hiện tại
		var movies = document.querySelectorAll('.movie-card');
		var totalPages = Math.ceil(movies.length / itemsPerPage);

		function showPage(page) {
			currentPage = page;
			var startIndex = (page - 1) * itemsPerPage;
			var endIndex = startIndex + itemsPerPage;

			// Ẩn tất cả các phim
			movies.forEach(function(movie, index) {
				movie.style.display = 'none';
			});

			// Hiển thị các phim trong khoảng startIndex và endIndex
			for (var i = startIndex; i < endIndex && i < movies.length; i++) {
				movies[i].style.display = 'block';
			}

			// Cập nhật nút phân trang

		}
		function bookTicket(maPhim) {
	        window.location.href = "user/datve.htm?maPhim=" + maPhim;
	    }

		// Hiển thị trang đầu tiên khi tải trang
		showPage(1);
	</script>
</body>
</html>
