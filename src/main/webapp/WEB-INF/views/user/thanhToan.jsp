<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thanh Toán</title>
<base href="${pageContext.servletContext.contextPath}/*">
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #b1d1d9; /* Light background color */
	font-family: 'Poppins', sans-serif;
}

.navbar-brand img {
	height: 40px;
	margin-right: 10px;
}

.header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px;
	background-color: #e9ecef; /* Light background color for header */
	border-bottom: 1px solid #dee2e6;
}

.main {
	background-color: #e3f2fd;
	flex: 1;
	display: flex;
}

.sidebar {
	display: flex;
	flex-direction: column;
	justify-content: center; /* Centering buttons vertically */
	padding: 20px;
	border-right: 1px solid #dee2e6;
}

.content {
	flex-grow: 1;
	padding: 20px;
	overflow-y: auto;
	max-height: calc(100vh - 100px);
	/* Adjust based on header height and padding */
}

.table th, .table td {
	vertical-align: middle;
	text-align: center;
}

.table th {
	font-size: 0.85rem; /* Adjust font size of table headers */
}

.table td {
	font-size: 0.9rem; /* Adjust font size of table data */
}

.table {
	margin-top: 20px;
	background-color: #ffffff;
	border: 1px solid #dee2e6;
	border-radius: 8px;
}

.custom-modal-header {
	background-color: #007bff;
	color: white;
	position: relative;
	padding: 1rem;
}

.custom-close-btn {
	background: none;
	border: none;
	color: white;
	font-size: 1.5rem;
	position: absolute;
	top: 1rem;
	right: 1rem;
}

.custom-close-btn:hover {
	color: #ff4d4d;
}

.form-label {
	font-weight: bold;
}

.form-control:focus {
	box-shadow: none;
	border-color: #007bff;
}
</style>
</head>
<body>
	<div class="container">
		<!--Header  -->
		<header class="navbar navbar-expand-lg navbar-light col"
			style="margin-bottom: 4.5rem;">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"> <img
					src="assets/images/logo/logo.png" alt="Logo"> Pengu
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="user/home.htm">Trang chủ</a></li>
						<li class="nav-item"><a class="nav-link"
							href="user/caChieuUser.htm">Lịch chiếu</a></li>
						<li class="nav-item"><a class="nav-link"
							href="user/thanhToan.htm">Thanh toán</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.servletContext.contextPath}/user/infor.htm">Thông
								tin cá nhân</a></li>
					</ul>
				</div>
				<form action="<c:url value='/logout.htm'/>" method="post">
					<button type="submit" class="btn btn-info"
						style="width: 150px; height: 50px; border-radius: 15px; color: aliceblue">Đăng
						Xuất</button>
				</form>
			</div>
		</header>

		<!-- Main content -->
		<div class="main">
			<div class="sidebar">
				<!-- Sidebar content if needed -->
			</div>
			<div class="content">
				<h2 class="mt-5">Thanh Toán</h2>
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>Mã hóa đơn</th>
							<th>Số lượng ghế</th>
							<th>Tổng giá</th>
							<th>Ngày mua</th>
							<th>Trạng thái</th>
							<th>Mã vé</th>
							<th>Mã ghế</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="hoaDon" items="${danhSachHoaDon}">
							<tr>
								<td>${hoaDon.maHoaDon}</td>
								<td>${hoaDon.soLuong}</td>
								<td>${hoaDon.tongGia}VND</td>
								<td><fmt:formatDate value="${hoaDon.ngayMua}"
										pattern="dd-MM-yyyy" /></td>
								<td><c:choose>
										<c:when test="${hoaDon.trangThai == true}">
                    Đã thanh toán
                </c:when>
										<c:otherwise>
                    Chưa thanh toán
                </c:otherwise>
									</c:choose></td>
								<td>${hoaDon.ve.maVe}</td>
								<td>${hoaDon.ghe.maGhe}</td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
				<div class="mt-3">
					<c:if test="${not empty message}">
						<div class="alert alert-info">${message}</div>
					</c:if>
				</div>
				<form id="thanhToanForm" method="POST" action="thanhToan">
					<button type="button" class="btn btn-primary btn_thongtinCK"
						data-bs-toggle="modal" data-bs-target="#ThongTinCK">Xác
						Nhận Thanh Toán</button>
				</form>
			</div>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="ThongTinCK" tabindex="-1" role="dialog"
		aria-labelledby="chuyenKhoanModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="chuyenKhoanModalLabel">Thông tin
						chuyển khoản</h5>
					<button type="button" class="close" data-bs-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- Đặt các thông tin chuyển khoản ở đây -->
					<p>
						Chủ tài khoản: <strong>Nguyễn Văn Thông</strong>
					</p>
					<p>
						Số tài khoản: <strong>123456789000</strong>
					</p>
					<p>
						Tên ngân hàng: <strong>BIDV</strong>
					</p>
					<p>
						Số tiền cần chuyển: <strong>(Check Mục Thanh Toán)</strong>
					</p>
					<p>
						Nội dung: <strong>Thanh toán vé xem phim + Mã Hóa Đơn</strong>
					</p>
					<p>
						Chú ý: <strong>Việc xác nhận thanh toán thường mất khoảng
							30s và có thể lâu hơn từ 3-5'.</strong>
					</p>
					<p>Ghi sai nội dung vui lòng liên hệ Zalo:0987654321 (A Thông)
						để được giải quyết kịp thời.</p>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>



