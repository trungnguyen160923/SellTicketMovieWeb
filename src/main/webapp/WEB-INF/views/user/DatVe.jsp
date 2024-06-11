<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
.table-striped tbody tr:nth-child(odd) {
	background-color: #f2f2f2; /* Màu nền cho hàng lẻ */
}

.table-striped tbody tr:nth-child(even) {
	background-color: #ffffff; /* Màu nền cho hàng chẵn */
}

.giochieu-item {
	border: 1px solid #8B4513; /* Đặt viền nâu cho mỗi ca chiếu */
	padding: 5px;
	/* Đặt phần đệm để tạo khoảng cách xung quanh mỗi ca chiếu */
	margin-bottom: 5px; /* Tạo khoảng cách giữa các ca chiếu */
	max-width: 100px; /* Đặt chiều rộng tối đa cho mỗi ca chiếu */
	word-wrap: break-word;
	/* Cho phép từ ngắt trong trường hợp nội dung quá dài */
	cursor: pointer;
	/* Thêm con trỏ chuột để biểu thị rằng các mục có thể nhấp được */
}

.giochieu-item:hover {
	background-color: #f0e68c; /* Thêm màu nền khi di chuột qua */
}
</style>
</head>
<body>
	<div class="container">
		<h3>Lịch chiếu</h3>
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Ngày chiếu</th>
					<th>Ca chiếu</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="nc" items="${danhSachCaChieu}">
					<tr>
						<td>${nc.ngayChieu}</td>
						<td>
							<ul>
								<c:forEach var="gc" items="${danhSachCaChieu}">
									<c:if test="${nc.ngayChieu == gc.ngayChieu}">
										<li class="giochieu-item" onclick="chonCaChieu(${gc.phong.maPhong})">
											${gc.gioBatDau}-${gc.gioKetThuc}</li>
									</c:if>
								</c:forEach>
							</ul>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- Bootstrap JS and jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
        function chonCaChieu(maPhong) {
        	window.location.href = "/web_SellTicket/user/chonghe.htm?maPhong=" + maPhong
        }
    </script>
</body>
</html>



