<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chọn Ghế</title>
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
	background-color: #b1d1d9;
	width: 100%;
	height: 100vh;
	margin: 0;
	padding: 0;
}

.center {
	width: 100%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	background: linear-gradient(to right, rgb(162, 216, 162),
		rgb(102, 194, 102));
}

.tickets {
	width: 550px;
	height: fit-content;
	border: 0.4mm solid rgba(0, 0, 0, 0.08);
	border-radius: 3mm;
	box-sizing: border-box;
	padding: 10px;
	font-family: poppins;
	max-height: 96vh;
	overflow: auto;
	background: white;
	box-shadow: 0px 25px 50px -12px rgba(0, 0, 0, 0.25);
}

.ticket-selector {
	background: rgb(243, 243, 243);
	display: flex;
	align-items: center;
	justify-content: space-between;
	flex-direction: column;
	box-sizing: border-box;
	padding: 20px;
}

.head {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-bottom: 30px;
}

.title {
	font-size: 16px;
	font-weight: 600;
}

.seats {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	min-height: 150px;
	position: relative;
}

.status {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-evenly;
}

.seats::before {
	content: "";
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translate(-50%, 0);
	width: 220px;
	height: 7px;
	background: rgb(141, 198, 255);
	border-radius: 0 0 3mm 3mm;
	border-top: 0.3mm solid rgb(180, 180, 180);
}

.item {
	font-size: 12px;
	position: relative;
}

.item::before {
	content: "";
	position: absolute;
	top: 50%;
	left: -12px;
	transform: translate(0, -50%);
	width: 10px;
	height: 10px;
	background: rgb(255, 255, 255);
	outline: 0.2mm solid rgb(120, 120, 120);
	border-radius: 0.3mm;
}

.item:nth-child(2)::before {
	background: rgb(180, 180, 180);
	outline: none;
}

.item:nth-child(3)::before {
	background: rgb(28, 185, 120);
	outline: none;
}

.item:nth-child(4)::before {
	background: rgb(255, 0, 0);
	outline: none;
}

.all-seats {
	display: grid;
	grid-template-columns: repeat(10, 1fr);
	grid-gap: 15px;
	margin: 60px 0;
	margin-top: 20px;
	position: relative;
}

.seat {
	width: 20px;
	height: 20px;
	background: white;
	border-radius: 0.5mm;
	outline: 0.3mm solid rgb(180, 180, 180);
	cursor: pointer;
}

.all-seats input:checked+label {
	background: rgb(28, 185, 120);
	outline: none;
}

.seat.booked {
	background: rgb(180, 180, 180);
	outline: none;
}

.seat.unavailable {
	background: rgb(255, 0, 0);
	outline: none;
}

input {
	display: none;
}

.timings {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin-top: 30px;
}

.dates {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.dates-item {
	width: 50px;
	height: 40px;
	background: rgb(233, 233, 233);
	text-align: center;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	padding: 10px 0;
	border-radius: 2mm;
	cursor: pointer;
}

.day {
	font-size: 12px;
}

.times {
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-top: 10px;
}

.time {
	font-size: 14px;
	width: fit-content;
	padding: 7px 14px;
	background: rgb(233, 233, 233);
	border-radius: 2mm;
	cursor: pointer;
}

.timings input:checked+label {
	background: rgb(28, 185, 120);
	color: white;
}

.price {
	width: 100%;
	box-sizing: border-box;
	padding: 10px 20px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.total {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	justify-content: center;
	font-size: 16px;
	font-weight: 500;
}

.total span {
	font-size: 11px;
	font-weight: 400;
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
.seat-checked {
    background: rgb(180, 180, 180); /* Màu xám cho ghế đã đặt */
    outline: none;
}
</style>
</head>
<body>
	<div class="container">
		<header class="navbar navbar-expand-lg navbar-light col"
			style="margin-bottom: 4.5rem;">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"><img
					src="assets/images/logo/logo.png" alt="" class="mr-2">Pengu</a>
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
							href="user/thanhToan.htm">Thanh toán</a></li>
					</ul>
				</div>
			</div>
			<form action="<c:url value='/logout.htm'/>" method="post">
				<button type="submit" class="btn btn-info"
					style="width: 150px; height: 50px; border-radius: 15px; color: aliceblue">Đăng
					Xuất</button>
			</form>
		</header>
		<div class="col-12">
			<div class="center">
				<div class="tickets">
					<div class="ticket-selector">
						<div class="head">
							<div class="title">Sơ đồ phòng</div>
						</div>
						<div class="seats">
							<div class="status">
								<div class="item">Available</div>
								<div class="item">Booked</div>
								<div class="item">Selected</div>
								<div class="item">Unavailable</div>
							</div>
							<div class="all-seats">
								<c:forEach var="ghe" items="${ghes}">
									<input type="checkbox" name="tickets" id="s${ghe.maGhe}"
										value="${ghe.maGhe}"
										<c:if test="${ghe.trangThai != 0}">disabled</c:if> />
									<label for="s${ghe.maGhe}"
										class="seat 
                                <c:choose>
                                    <c:when test='${ghe.trangThai == 1}'>booked</c:when>
                                    <c:when test='${ghe.trangThai == -1}'>unavailable</c:when>
                                </c:choose>"
										data-bs-toggle="tooltip" title="${ghe.loaiGhe.tenLoaiGhe}">
										${ghe.hang}${ghe.cot} </label>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="price">
						<div class="total">
							<span>Ghế được chọn</span>
							<div class="count">0</div>
						</div>
						<div>
							<form id="xacnhan" method="POST" action="xacnhandat">
								<button type="button" class="btn btn-primary bookTicketBtn"
									disabled data-bs-toggle="modal" data-bs-target="#successModal">Xác
									Nhận Đặt</button>
							</form>
						</div>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="successModal" tabindex="-1"
						aria-labelledby="successModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="successModalLabel">Đặt vé
										thành công!</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">Quá trình đặt vé đã được hoàn
									thành thành công!</div>
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
					<script
						src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
						integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
						crossorigin="anonymous"></script>
					<script
						src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
						integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
						crossorigin="anonymous"></script>

					<script>
    function updateSelectedSeatCount() {
        const selectedSeatsCount = document.querySelectorAll(".all-seats input:checked").length;
        document.querySelector(".count").textContent = selectedSeatsCount;

        const bookBtn = document.querySelector(".bookTicketBtn");
        bookBtn.disabled = selectedSeatsCount === 0;
    }

    document.querySelectorAll(".all-seats input").forEach(seat => {
        seat.addEventListener("change", updateSelectedSeatCount);
    });

    document.querySelector(".bookTicketBtn").addEventListener("click", () => {
        // Hiển thị modal thông báo đặt vé thành công
        var myModal = new bootstrap.Modal(document.getElementById('successModal'));
        myModal.show();
    });

    // Khởi tạo trạng thái ban đầu của nút "Xác nhận đặt"
    updateSelectedSeatCount();
</script>