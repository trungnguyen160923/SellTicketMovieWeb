<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<base href="${pageContext.servletContext.contextPath}/*">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #b1d1d9; /* Light background color */
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
<script>
        function showTable(selection) {
            document.getElementById('phongTable').style.display = 'none';

            if (selection === 'phong') {
                document.getElementById('phongTable').style.display = 'block';
            }
        }
    </script>
</head>
<body>
	<div class="container-sm">
		<!--Header  -->
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
							href="user/index.htm">Trang chủ</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="user/phong.htm">Đặt vé</a></li>
						<li class="nav-item"><a class="nav-link"
							href="user/caChieuUser.htm">Lịch chiếu</a></li>
						<li class="nav-item"><a class="nav-link" href="user/thanhToan.htm">Thanh
								toán</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Khác</a></li>
					</ul>
				</div>
			</div>
			<button class="btn btn-info"
				style="width: 150px; height: 50px; border-radius: 15px; color: aliceblue">Đăng
				Xuất</button>
		</header>
		<!--End Header  -->
		<!--Main  -->
		<div class="main container-fluid flex-grow-1 d-flex">
			<div class="row flex-grow-1 w-100">
				<div class="content col-12">
					<div id="phongTable" style="display: block;">
						<div class="row mb-2">
							<div class="col">
								<h3>Phòng</h3>
							</div>
						</div>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>Mã phòng</th>
									<th>Tên phòng</th>
									<th>Loại</th>
									<th>Mô Tả</th>
									<th>Đặt Vé</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="p" items="${phongs}">
									<tr>
										<td>${p.maPhong}</td>
										<td>${p.tenPhong }</td>
										<td>${p.loaiPhong.tenLoaiPhong}</td>
										<td><c:choose>
												<c:when test="${p.tinhTrang}">
									            Đang sử dụng
									        </c:when>
												<c:otherwise>
									            Không sử dụng
									        </c:otherwise>
											</c:choose></td>
										<td><button class="btn btn-info chitietPhong_btn"
												data-ma-phong="${p.maPhong}">Đặt Vé</button></td>
									</tr>
								</c:forEach>
								<!-- More rows as needed -->
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	<!--End Main  -->
	</div>
	<!--Phần script  -->
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
    document.addEventListener('DOMContentLoaded', function() {   
        
        const modals = document.querySelectorAll('.getmodals');   
        const modalLoaiPhongs = document.querySelectorAll('.getmodalsLoaiPhong');
        console.log(modalLoaiPhongs);
         const modalLoaiGhes = document.querySelectorAll('.getmodalsLoaiGhe');
        // Chi tiết Phòng:
        	var buttons = document.querySelectorAll('.chitietPhong_btn');
			
        	buttons.forEach((button) => {
        		button.addEventListener('click', function() {
        			var maPhong = button.getAttribute('data-ma-phong');
        			var url = 'user/DatVe.htm?maPhong=' + maPhong;
    		
    		        // Chuyển hướng người dùng đến đường dẫn mới
    		        window.location.href = url;
    		    });
        	});
		    
        //end
    });  
	// Thêm Loại Ghế
	const addLoaiGhebtn = document.querySelector('.btn_saveadd_LoaiGhe');
	addLoaiGhebtn.addEventListener('click', function() {
        // Thiết lập hành động của form để đến trang xử lý cập nhật
        const formLoaiGhe = document.querySelector('#addLoaiGheForm');
        formLoaiGhe.action = "admin/addLoaiGhe.htm";
        // Gửi form
      	formLoaiGhe.submit();
    });
	
    </script>
</body>
</html>
