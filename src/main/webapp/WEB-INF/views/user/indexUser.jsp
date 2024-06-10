<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pengu Admin</title>
<base href="${pageContext.servletContext.contextPath}/*">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="assets\css\admin\index.css">
<style>
body {
	background-color: #b1d1d9; /* Light background color */
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
	<div class="container-sm">
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
							href="user/index.htm">Trang chủ</a></li>
						<li class="nav-item"><a class="nav-link active"
							href="user/phong.htm">Đặt vé</a></li>
						<li class="nav-item"><a class="nav-link"
							href="user/caChieuUser.htm">Lịch chiếu</a></li>
						<li class="nav-item"><a class="nav-link" href="user/thanhToan.htm">Thanh
								toán</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Thông
								tin cá nhân</a></li>
					</ul>
				</div>
			</div>
			<button class="btn btn-info"
				style="width: 150px; height: 50px; border-radius: 15px; color: aliceblue">Đăng
				Xuất</button>
		</header>
		<main class="table col listPhim_table" id="customers_table"
			phims="${phims}">
			<section class="table__header">
				<h2>Danh Sách Phim</h2>
				<div class="input-group">
					<input type="search" style="height: 40px; border-radius: 20px"
						placeholder="Tìm Kiếm...">
				</div>
			</section>
			<section class="table__body">
				<table>
					<thead>
						<tr>
							<th>Id<span class="icon-arrow">&UpArrow;</span></th>
							<th>Tên Phim<span class="icon-arrow">&UpArrow;</span></th>
							<th>Lượt Xem<span class="icon-arrow">&UpArrow;</span></th>
							<th>Lượt Thích<span class="icon-arrow">&UpArrow;</span></th>
							<th>Trạng thái<span class="icon-arrow">&UpArrow;</span></th>
							<!--                             <th>Ngày hiệu lực</th> -->
							<th>Trailer</th>
							<th>Chi tiết</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${phims}">
							<tr>
								<td>${p.maPhim }</td>
								<td><img src="${p.anhBia}" alt="">${p.tenPhim}</td>
								<td>${p.luotXem }</td>
								<td>${p.luotThich}</td>
								<td><c:choose>
										<c:when test="${p.trangThai eq 'Đang Chiếu'}">
											<p class="status delivered">${p.trangThai}</p>
										</c:when>
										<c:when test="${p.trangThai eq 'Sắp Chiếu'}">
											<p class="status pending">${p.trangThai}</p>
										</c:when>
										<c:otherwise>
											<p class="status cancelled">${p.trangThai}</p>
										</c:otherwise>
									</c:choose></td>
								<%--                             <td>${p.ngayHieuLucTu } - ${p.ngayHieuLucDen }</td> --%>
								<td><button class="btn btn-primary"
										style="width: 65px; height: 40px; border-radius: 20px"
										data-bs-toggle="modal"
										data-bs-target="#model_youtube_${p.maPhim}">Trailer</button></td>
								<td><button class="btn btn-primary"
										style="width: 85px; height: 40px; border-radius: 20px"
										data-bs-toggle="modal" data-bs-target="#movie_${p.maPhim}">Xem</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</section>
		</main>
	</div>
	<!--Phần Model  -->
	<c:forEach var="p" items="${phims}">
		<div class="modal fade getmodals" id="movie_${p.maPhim}"
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
										value="${p.maPhim}" readonly>
								</div>
								<div class="col-md-6">
									<label for="tenPhim" class="form-label">Tên Phim:</label> <input
										type="text" class="form-control" id="tenPhim" name="tenPhim"
										value="${p.tenPhim}" readonly>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-6">
									<label for="trailer" class="form-label">Trailer:</label> <input
										type="text" class="form-control" id="trailer" name="trailer"
										value="${p.trailer}" readonly>
								</div>
								<div class="col-md-6">
									<label for="thoiLuong" class="form-label">Thời Lượng:</label> <input
										type="text" class="form-control" id="thoiLuong"
										name="thoiLuong" value="${p.thoiLuong}" readonly>
								</div>
							</div>
							<div class="mb-3">
								<label for="moTa" class="form-label">Mô Tả:</label>
								<textarea class="form-control" id="moTa" rows="3" name="moTa"
									readonly>${p.moTa}</textarea>
							</div>
							<div class="row mb-3">
								<div class="col-md-6">
									<label for="luotXem" class="form-label">Lượt Xem:</label> <input
										type="text" class="form-control" id="luotXem" name="luotXem"
										value="${p.luotXem}" readonly>
								</div>
								<div class="col-md-6">
									<label for="luotThich" class="form-label">Lượt Thích:</label> <input
										type="text" class="form-control" id="luotThich"
										name="luotThich" value="${p.luotThich}" readonly>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-6">
									<label for="trangThai" class="form-label">Trạng Thái:</label> <select
										class="form-select" id="trangThai" name="trangThai" disabled
										style="width: 370px; height: 40px">
										<option value="Đang Chiếu"
											${p.trangThai == 'Đang Chiếu' ? 'selected' : ''}>Đang
											Chiếu</option>
										<option value="Sắp Chiếu"
											${p.trangThai == 'Sắp Chiếu' ? 'selected' : ''}>Sắp
											Chiếu</option>
										<option value="Đã Chiếu"
											${p.trangThai == 'Đã Chiếu' ? 'selected' : ''}>Đã
											Chiếu</option>
									</select>
								</div>
								<div class="col-md-6">
									<label for="ngonNgu" class="form-label">Ngôn Ngữ:</label> <input
										type="text" class="form-control" id="ngonNgu" name="ngonNgu"
										value="${p.ngonNgu}" readonly>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-6">
									<label for="phuDe" class="form-label">Phụ Đề:</label> <input
										type="text" class="form-control" id="phuDe" name="phuDe"
										value="${p.phuDe}" readonly>
								</div>
								<div class="col-md-6">
									<label for="gioiHanTuoi" class="form-label">Giới Hạn
										Tuổi:</label> <input type="text" class="form-control" id="gioiHanTuoi"
										name="gioiHanTuoi" value="${p.gioiHanTuoi}" readonly>
								</div>
							</div>
							<div class="row mb-3">
								<div class="col-md-6">
									<label for="ngayHieuLucTu" class="form-label">Ngày Hiệu
										Lực Từ:</label> <input type="date" class="form-control"
										id="ngayHieuLucTu" name="ngayHieuLucTu"
										placeholder="mm/dd/yyyy" value="${p.ngayHieuLucTu}" readonly>
								</div>
								<div class="col-md-6">
									<label for="ngayHieuLucDen" class="form-label">Ngày
										Hiệu Lực Đến:</label> <input type="date" class="form-control"
										id="ngayHieuLucDen" name="ngayHieuLucDen"
										placeholder="mm/dd/yyyy" value="${p.ngayHieuLucDen}" readonly>
								</div>
							</div>
							<div class="mb-3">
								<label for="anhBia" class="form-label">Ảnh Bìa:</label> <img
									src="${p.anhBia}" style="height: 1000px" alt="Ảnh Bìa"
									class="img-fluid mb-2" id="currentAnhBia"> <input
									type="file" class="form-control" id="anhBia" name="anhBia"
									accept="image/*" style="display: none;">
							</div>


						</form>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<!--End Phần Model  -->
	<!--Model youtube  -->
	<c:forEach var="p" items="${phims}">
		<div class="modal fade" id="model_youtube_${p.maPhim}"
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
							<%-- <iframe id="cartoonVideo" class="embed-responsive-item" width="560" height="315" src="${p.trailer}" allowfullscreen></iframe> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<!--End Model Youtube  -->
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
    /* function showMovies(movie){
       console.log(movie);
        
    } */
    document.addEventListener('DOMContentLoaded', function() {   
        var phims = [
            <c:forEach items="${phims}" var="phim" varStatus="loop">
                {
                    "id": ${phim.maPhim},
                    "tenPhim": "${phim.tenPhim}",
                    "moTa": "${phim.moTa}",
                    "trailer": "${phim.trailer}",
                    "thoiLuong": "${phim.thoiLuong}",
                    "luotXem": ${phim.luotXem},
                    "luotThich": ${phim.luotThich},
                    "trangThai": "${phim.trangThai}",
                    "ngonNgu": "${phim.ngonNgu}",
                    "phuDe": "${phim.phuDe}",
                    "gioiHanTuoi": ${phim.gioiHanTuoi},
                    "ngayHieuLucTu": "${phim.ngayHieuLucTu}",
                    "ngayHieuLucDen": "${phim.ngayHieuLucDen}",
                    "anhBia": "${phim.anhBia}"
                }<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];
        const modals = document.querySelectorAll('.getmodals');
         
                // Bỏ thuộc tính readonly từ các trường dữ liệu
                formControls.forEach(input => {
                    if (input.id !== 'maPhim') {
                        input.removeAttribute('readonly');
                    }
                });
                trangThai.removeAttribute('disabled');
            });

            cancelButton.addEventListener('click', resetFormState);
            closeButton.addEventListener('click', resetFormState);

            saveButton.addEventListener('click', function() {
        // Modal youtube
		
        // End Modal youtube
        //end
    });
    
    function prepareDelete(maPhim) {
	    // Đặt giá trị cho trường ẩn trong form
	    document.getElementById('maPhimInput').value = maPhim;
	    // Gửi yêu cầu POST bằng cách gửi form
	    document.getElementById('deleteForm').submit();
	}
    const search = document.querySelector('.input-group input'),
        table_rows = document.querySelectorAll('tbody tr'),
        table_headings = document.querySelectorAll('thead th');

    // 1. Searching for specific data of HTML table
    search.addEventListener('input', searchTable);

    function searchTable() {
        table_rows.forEach((row, i) => {
            let table_data = row.textContent.toLowerCase(),
                search_data = search.value.toLowerCase();

            row.classList.toggle('hide', table_data.indexOf(search_data) < 0);
            row.style.setProperty('--delay', i / 25 + 's');
        })

        document.querySelectorAll('tbody tr:not(.hide)').forEach((visible_row, i) => {
            visible_row.style.backgroundColor = (i % 2 == 0) ? 'transparent' : '#0000000b';
        });
    }

    // 2. Sorting | Ordering data of HTML table

    table_headings.forEach((head, i) => {
        let sort_asc = true;
        head.onclick = () => {
            table_headings.forEach(head => head.classList.remove('active'));
            head.classList.add('active');

            document.querySelectorAll('td').forEach(td => td.classList.remove('active'));
            table_rows.forEach(row => {
                row.querySelectorAll('td')[i].classList.add('active');
            })

            head.classList.toggle('asc', sort_asc);
            sort_asc = head.classList.contains('asc') ? false : true;

            sortTable(i, sort_asc);
        }
    })
	const search = document.querySelector('.input-group input');
const table_rows = document.querySelectorAll('tbody tr');
const table_headings = document.querySelectorAll('thead th');

search.addEventListener('input', function() {
    const search_text = search.value.trim().toLowerCase(); // Lấy giá trị tìm kiếm và chuyển thành chữ thường
    
    table_rows.forEach(row => {
        const row_text = row.textContent.trim().toLowerCase(); // Lấy nội dung của từng dòng và chuyển thành chữ thường
        const isVisible = row_text.includes(search_text); // Kiểm tra xem nội dung của dòng có chứa chuỗi tìm kiếm không
        
        // Nếu dòng chứa chuỗi tìm kiếm, hiển thị dòng đó, ngược lại ẩn đi
        row.style.display = isVisible ? 'table-row' : 'none';
    });
});



    function sortTable(column, sort_asc) {
        [...table_rows].sort((a, b) => {
            let first_row = a.querySelectorAll('td')[column].textContent.toLowerCase(),
                second_row = b.querySelectorAll('td')[column].textContent.toLowerCase();

            return sort_asc ? (first_row < second_row ? 1 : -1) : (first_row < second_row ? -1 : 1);
        })
            .map(sorted_row => document.querySelector('tbody').appendChild(sorted_row));
    }
    </script>
</body>
</html>