<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ca Chiếu</title>
<base href="${pageContext.servletContext.contextPath}/*">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #b1d1d9; /* Màu nền nhạt */
    }
    .main {
        background-color: #ffffff; /* Màu nền trắng */
        padding: 2rem;
        border-radius: 15px;
    }
    .form-section {
        margin-bottom: 2rem;
    }
    .table-section {
        margin-top: 2rem;
    }
</style>
</head>
<body>
<div class="container">
    <header class="navbar navbar-expand-lg navbar-light col" style="margin-bottom: 4.5rem;">
        <div class="container-fluid">
            <a class="navbar-brand" href="#"><img src="assets/images/logo/logo.png" alt="" class="mr-2">Pengu</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" aria-current="page"
							href="user/home.htm">Trang chủ</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="user/phong.htm">Đặt vé</a></li>
						<li class="nav-item"><a class="nav-link"
							href="user/caChieuUser.htm">Lịch chiếu</a></li>
                    <li class="nav-item">
                      <a class="nav-link" href="user/thanhToan.htm">Thanh toán</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="lienHe.htm">Thông tin cá nhân</a>
                    </li>
                </ul>
            </div>
        </div>
        <button class="btn btn-info" style="width: 150px; height: 50px; border-radius: 15px; color: aliceblue;">Đăng Xuất</button>
    </header>
    <div class="main">
        <!-- Phần chọn ngày -->
        <div class="form-section row">
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="chonNgay" class="form-label">Chọn ngày</label>
                    <input type="date" id="chonNgay" class="form-control">
                </div>
                <div class="">
                    <button type="button" class="btn btn-primary" onclick="filterCaChieu()">Tìm kiếm</button>
                </div>
            </div>
        </div>

        <!-- Phần bảng -->
        <div class="table-section row">
            <div class="col-12">
                <h5>Ca Chiếu</h5>
                <table class="table table-striped" id="caChieuTable">
                    <thead>
                        <tr>
                            <th>Mã ca chiếu</th>
                            <th>Tên phim</th>
                            <th>Phòng</th>
                            <th>Ngày chiếu</th>
                            <th>Giờ bắt đầu</th>
                            <th>Giờ kết thúc</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="cc" items="${caChieus}">
                        <tr>
                            <td>${cc.maCaChieu}</td>
                            <td>${cc.phim.tenPhim}</td>
                            <td>${cc.phong.tenPhong}</td>
                            <td>${cc.ngayChieu}</td>
                            <td>${cc.gioBatDau}</td>
                            <td>${cc.gioKetThuc}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script>
	function filterCaChieu() {
	    const ngayChieu = document.getElementById('chonNgay').value;
	    const rows = document.querySelectorAll('#caChieuTable tbody tr');
	    rows.forEach(row => {
	        const cell = row.querySelector('td:nth-child(4)').innerText;
	        if (cell === ngayChieu) {
	            row.style.display = '';
	        } else {
	            row.style.display = 'none';
	        }
	    });
	}
</script>
</body>
</html>
