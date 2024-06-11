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
                        <a class="nav-link " href="admin/phong.htm">Phòng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="admin/caChieu.htm">Sắp Lịch</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin/thongKe.htm">Thống Kê</a>
                    </li>
                </ul>
            </div>
        </div>
        <button class="btn btn-info" style="width: 150px; height: 50px; border-radius: 15px; color: aliceblue">Đăng Xuất</button>
    </header>
    <div class="main">
        <div class="form-section row">
            <form class="col-md-6 form_themCaChieu" method="POST" action="admin/taoCaChieu.htm" enctype="application/x-www-form-urlencoded" onsubmit="return validateSchedule()">
                <!-- Chọn phim section -->
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="selectPhim" class="form-label">Chọn phim: </label>
                        <select id="selectPhim" name="maPhim" class="form-select" >
                            <option selected value="">Chọn Phim</option>
                            <c:forEach var="p" items="${phims}">
                            <option value="${p.maPhim}" data-thoiLuong="${p.thoiLuong}">${p.tenPhim}</option>
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
                        <select id="selectPhong" name="maPhong" class="form-select" disabled>
                            <option selected value="">Chọn Phòng</option>
                            <c:forEach var="p" items="${phongs}">
                            	<option value="${p.maPhong}">${p.tenPhong}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-6 d-flex align-items-center">
                        <button class="btn btn-primary w-80 btn_disable" disabled>Xem Thông Tin Phòng</button>
                    </div>
                </div>
                <div class="mb-3">
                    <label for="chonNgayChieu" class="form-label">Chọn ngày chiếu</label>
                    <input type="date" id="chonNgayChieu" name="ngayChieu" class="form-control" disabled>
                </div>
                <div class="mb-3">
                    <label for="gioBatDau" class="form-label">Giờ bắt đầu</label>
                    <input type="time" id="gioBatDau" name="gioBatDau" class="form-control" disabled>
                </div>
                <div class="mb-3">
                    <label for="gioKetThuc" class="form-label">Giờ kết thúc</label>
                    <input type="time" id="gioKetThuc" name="gioKetThuc" class="form-control" disabled>
                </div>
                <button type="submit" class="btn btn-primary w-100 btn_disable" disabled >Lưu</button>
            </form>

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
    </div>
</div>
<!--Thông báo  -->
        <c:if test="${not empty message}">
                    <script>
                        alert("${message}");
                    </script>
         		</c:if>
        <!--End Thông báo  -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script>
		// chuyển kiểu dữ liệu ca chiếu
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

        
        // Cập nhật bảng ca Chiếu với ngày chiếu và mã phòng
        function updateCaChieu() {
            const ngayChieu = document.getElementById('chonNgayChieu').value;
            const maPhong = document.getElementById('selectPhong').value;

            if (ngayChieu && maPhong) {
                const filteredCaChieus = caChieus.filter(ca => {
                    return ca.ngayChieu == ngayChieu && ca.maPhong == maPhong;
                });

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
        
        // Set disable và undisable cho button
        document.getElementById('selectPhim').addEventListener('change', function() {
            const isPhimSelected = this.value !== "";
            
            document.getElementById('selectPhong').disabled = !isPhimSelected;
            document.getElementById('chonNgayChieu').disabled = !isPhimSelected;
            document.getElementById('gioBatDau').disabled = !isPhimSelected;
            document.getElementById('gioKetThuc').disabled = !isPhimSelected;

            const buttons = document.querySelectorAll('.btn_disable');
            buttons.forEach(button => {
                button.disabled = !isPhimSelected;
            });
        });
        // Cập nhật giờ kết thúc theo giờ bắt đầu và thời lượng phim
        document.getElementById('gioBatDau').addEventListener('change', updateGioKetThuc);
        function updateGioKetThuc() {
            const selectedPhim = document.getElementById('selectPhim');
            const thoiLuong = parseInt(selectedPhim.options[selectedPhim.selectedIndex].getAttribute('data-thoiLuong'));
            const gioBatDau = document.getElementById('gioBatDau').value;

            if (gioBatDau && !isNaN(thoiLuong)) {
                const [hour, minute] = gioBatDau.split(':').map(Number);
                const startTime = new Date();
                startTime.setHours(hour, minute);

                const endTime = new Date(startTime.getTime() + thoiLuong * 60000);

                const endHour = String(endTime.getHours()).padStart(2, '0');
                const endMinute = String(endTime.getMinutes()).padStart(2, '0');

                document.getElementById('gioKetThuc').value = endHour+":" +endMinute;
            }
        }
     // Hàm validateSchedule để kiểm tra sự chồng chéo của lịch chiếu
        function validateSchedule() {
            const ngayChieu = document.getElementById('chonNgayChieu').value;
            const maPhong = document.getElementById('selectPhong').value;
            const gioBatDau = document.getElementById('gioBatDau').value;
            const gioKetThuc = document.getElementById('gioKetThuc').value;

            if (ngayChieu && maPhong && gioBatDau && gioKetThuc) {
                // Chuyển đổi giờ bắt đầu và giờ kết thúc của lịch mới thành phút
                const [newStartHour, newStartMinute] = gioBatDau.split(':').map(Number);
                const newStartTime = newStartHour * 60 + newStartMinute;

                const [newEndHour, newEndMinute] = gioKetThuc.split(':').map(Number);
                const newEndTime = newEndHour * 60 + newEndMinute;

                // Lọc các ca chiếu cùng ngày và cùng phòng
                const filteredCaChieus = caChieus.filter(ca => ca.ngayChieu == ngayChieu && ca.maPhong == maPhong);

                for (const ca of filteredCaChieus) {
                    // Chuyển đổi giờ bắt đầu và giờ kết thúc của ca chiếu hiện tại thành phút
                    const [existingStartHour, existingStartMinute] = ca.gioBatDau.split(':').map(Number);
                    const existingStartTime = existingStartHour * 60 + existingStartMinute;
                    
                    const [existingEndHour, existingEndMinute] = ca.gioKetThuc.split(':').map(Number);
                    const existingEndTime = existingEndHour * 60 + existingEndMinute;

                    // Kiểm tra sự chồng chéo
                    if ((newStartTime >= existingStartTime && newStartTime < existingEndTime) ||
                        (newEndTime > existingStartTime && newEndTime <= existingEndTime) ||
                        (newStartTime <= existingStartTime && newEndTime >= existingEndTime)) {
                        alert('Lịch chiếu bị trùng! Vui lòng chọn giờ khác.');
                        return false;
                    }
                }
            }
            return true;
        }
    </script>
</body>
</html>