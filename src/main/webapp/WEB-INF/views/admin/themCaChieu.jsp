<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Ca Chiếu</title>
<base href="${pageContext.servletContext.contextPath}/*">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #b1d1d9; /* Light background color */
        }
        .main {
            background-color: #ffffff; /* White background color */
            padding: 2rem;
            border-radius: 15px;
        }
        .form-section {
            margin-bottom: 2rem;
        }
        .tooltip-info {
            position: relative;
            display: inline-block;
        }
        .tooltip-info .tooltip-text {
            visibility: hidden;
            width: 200px;
            background-color: black;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            padding: 5px;
            position: absolute;
            z-index: 1;
            bottom: 125%;
            left: 50%;
            margin-left: -100px;
            opacity: 0;
            transition: opacity 0.3s;
        }
        .tooltip-info:hover .tooltip-text {
            visibility: visible;
            opacity: 1;
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
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="admin/index.htm">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="admin/phong.htm">Phòng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Sắp Lịch</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Khác</a>
                    </li>
                </ul>
            </div>
        </div>
        <button class="btn btn-info" style="width: 150px; height: 50px; border-radius: 15px; color: aliceblue">Đăng Xuất</button>
    </header>
    <div class="main">
        <div class="form-section row">
            <div class="col-md-6">
                <!-- Chọn phim section -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="selectPhim" class="form-label">Chọn phim: </label>
                        <select id="selectPhim" name="maPhim" class="form-select">
                            <option selected>Chọn Phim</option>
                            <c:forEach var="p" items="${phims}">
                            <option value="${p.maPhim}">${p.tenPhim}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-6 d-flex align-items-center">
                        <button class="btn btn-primary w-80">Xem Thông Tin Phim</button>
                    </div>
                </div>
                <!-- Chọn phòng section -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="selectPhong" class="form-label">Chọn phòng: </label>
                        <select id="selectPhong" name="maPhong" class="form-select">
                            <option selected>Chọn Phòng</option>
                            <c:forEach var="p" items="${phongs}">
                            	<option value="${p.maPhong}">${p.tenPhong}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-6 d-flex align-items-center">
                        <button class="btn btn-primary w-80">Xem Thông Tin Phòng</button>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="chonNgayChieu" class="form-label">Chọn ngày chiếu</label>
                    <input type="date" id="chonNgayChieu" name="ngayChieu" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="gioBatDau" class="form-label">Giờ bắt đầu</label>
                    <input type="time" id="gioBatDau" name="gioBatDau" class="form-control">
                </div>
                <div class="mb-3">
                    <label for="gioKetThuc" class="form-label">Giờ kết thúc</label>
                    <input type="time" id="gioKetThuc" name="gioKetThuc" class="form-control">
                </div>
            </div>

            <div class="col-md-6">
                <h5>Ca Chiếu của phòng trong ngày</h5>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Tên phim</th>
                            <th>Giờ bắt đầu</th>
                            <th>Giờ kết thúc</th>
                        </tr>
                    </thead>
                    <tbody id="caChieuTableBody">
                    </tbody>
                </table>
            </div>
        </div>
        <div class="form-section row">
            <div class="col-md-6">
                <button type="button" class="btn btn-primary w-100">Đặt Giá Vé</button>
            </div>
            <div class="col-md-6">
                <button type="button" class="btn btn-primary w-100">Lưu</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script>
		
		var caChieus = [
			<c:forEach items="${caChieus}" var="cc" varStatus="loop">
			{
				"maCaChieu": ${cc.maCaChieu},
				"maPhim" : ${cc.phim.maPhim},
				"tenPhim" : "${cc.phim.tenPhim}",
				"trangThai": "${cc.trangThai}",
				"maPhong": ${cc.phong.maPhong},
				"ngayChieu":"${cc.ngayChieu}",
				"gioBatDau": "${cc.gioBatDau}",
				"gioKetThuc": "${cc.gioKetThuc}"
			}<c:if test="${!loop.last}">,</c:if>
			</c:forEach>
		];
        document.getElementById('chonNgayChieu').addEventListener('change', updateCaChieu);
        document.getElementById('selectPhong').addEventListener('change', updateCaChieu);

        function updateCaChieu() {
            const ngayChieu = document.getElementById('chonNgayChieu').value;
            const maPhong = document.getElementById('selectPhong').value;

            if (ngayChieu && maPhong) {
                const filteredCaChieus = caChieus.filter(ca => {
                    return ca.ngayChieu == ngayChieu && ca.maPhong == maPhong;
                });
                console.log(filteredCaChieus);

                const tbody = document.getElementById('caChieuTableBody');
                tbody.innerHTML = '';
			
                filteredCaChieus.forEach(ca => {
                	const row = document.createElement('tr');

                    const movieCell = document.createElement('td');
                    movieCell.textContent = ca.tenPhim; // Sử dụng biến ca để lấy tên phim và gán vào ô

                    const startTimeCell = document.createElement('td');
                    startTimeCell.textContent = ca.gioBatDau; // Sử dụng biến ca để lấy giờ bắt đầu và gán vào ô

                    const endTimeCell = document.createElement('td');
                    endTimeCell.textContent = ca.gioKetThuc; // Sử dụng biến ca để lấy giờ kết thúc và gán vào ô

                    row.appendChild(movieCell);
                    row.appendChild(startTimeCell);
                    row.appendChild(endTimeCell);

                    tbody.appendChild(row);
                });
            }
        }
		
    </script>
</body>
</html>