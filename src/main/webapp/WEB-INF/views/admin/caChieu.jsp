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
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="admin/index.htm">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin/phong.htm">Phòng</a>
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
        <button class="btn btn-info" style="width: 150px; height: 50px; border-radius: 15px; color: aliceblue;">Đăng Xuất</button>
    </header>
    <div class="main">
        <!-- Form Section -->
        <div class="form-section row">
            <div class="col-md-6">
                <div class="mb-3">
                    <label for="chonNgay" class="form-label">Chọn ngày</label>
                    <input type="date" id="chonNgay" class="form-control">
                </div>
                <div class="">
                    <button type="button" class="btn btn-primary" onclick="filterCaChieu()">Tìm kiếm</button>
                    <button type="button" class="btn btn-primary addCaChieu_btn">Thêm Ca Chiếu</button>
                </div>
            </div>
        </div>

        <!-- Table Section -->
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
                            <th>Start</th>
                            <th>End</th>
                            <th>Hành Động</th>
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
                            <td>  
                            	<button type="button" class="btn btn-success btn_update_caChieu" onclick="prepareUpdate(${cc.maCaChieu})">Sửa</button>
                                <button type="button" class="btn btn-danger" onclick="prepareDelete(${cc.maCaChieu})">Xóa</button>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!--Form ảo để sửa -->
<form id="updateCaChieuForm" method="GET" action="admin/updateCaChieu.htm">
    	<input type="hidden" name="maCaChieu" id="maCaChieuInput">
	</form>
<!--End form ảo để sửa  -->
<!--Form ảo để xóa  -->
<form id="deleteCaChieuForm" method="POST" action="admin/deleteCaChieu.htm">
    	<input type="hidden" name="maCaChieu" id="maCaChieuInputDelete">
</form>
<!--End form ảo để xóa  -->
<!--Thông báo  -->
        <c:if test="${not empty message}">
                    <script>
                        alert("${message}");
                    </script>
         		</c:if>
        <!--End Thông báo  -->
        <!--footer  -->
        <jsp:include page="/WEB-INF/views/footer.jsp" />
        <!--End Footer  -->
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
	// Chuyển trang thêm Ca Chiếu
	var button_addCaChieu = document.querySelector('.addCaChieu_btn');
	
	button_addCaChieu.addEventListener('click', function() {
		var url = 'admin/themCaChieu.htm';

        // Chuyển hướng người dùng đến đường dẫn mới
        window.location.href = url;
    });
	// chuyển sang trang updateCaChieu
	function prepareUpdate(maCaChieu) {
	    // Đặt giá trị cho trường ẩn trong form
	    document.getElementById('maCaChieuInput').value = maCaChieu;
	    // Gửi yêu cầu POST bằng cách gửi form
	    document.getElementById('updateCaChieuForm').submit();
	}
	// end chuyển sang trang updateCaChieu
	// Xóa ca Chiếu
	function prepareDelete(maCaChieu) {
	    // Đặt giá trị cho trường ẩn trong form
	    document.getElementById('maCaChieuInputDelete').value = maCaChieu;
	    // Gửi yêu cầu POST bằng cách gửi form
	    document.getElementById('deleteCaChieuForm').submit();
	}
	// Xóa ca chiếu
</script>
</body>
</html>
