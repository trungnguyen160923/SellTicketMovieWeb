<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pengu Admin</title>
<base href="${pageContext.servletContext.contextPath}/*">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
        <header class="navbar navbar-expand-lg navbar-light col" style="margin-bottom: 4.5rem;">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"><img src="assets\images\logo\logo.png" alt="" class="mr-2">Pengu</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                  <ul class="navbar-nav">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="admin/index.htm">Trang chủ</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="admin/phong.htm">Phòng</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="admin/caChieu.htm">Sắp Lịch</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="admin/thongKe.htm">Thống Kê</a>
                    </li>
                  </ul>
                </div>
              </div>
            <button class="btn btn-info" style="width: 150px; height:50px;border-radius: 15px; color:aliceblue">Đăng Xuất</button>
        </header>
        
        <main class="table col listPhim_table" id="customers_table" phims = "${phims}">
            <section class="table__header">
                <h2>Danh Sách Phim</h2>
                 
                <div class="input-group">
                    <input type="search" style="height:40px; border-radius:20px" placeholder="Tìm Kiếm...">
                    
                </div>
                <button class="btn btn-primary" style="width:135px; height:40px; border-radius:20px" data-bs-toggle="modal" data-bs-target="#addPhimModel">Thêm bộ phim</button>
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
                            <td> ${p.maPhim } </td>
                            <td> <img src="${p.anhBia}" alt="">${p.tenPhim}</td>
                            <td> ${p.luotXem }</td>
                            <td> ${p.luotThich}</td>
                            <td>
	                            <c:choose>
								    <c:when test="${p.trangThai eq 'Đang Chiếu'}">
								        <p class="status delivered">${p.trangThai}</p>
								    </c:when>
								    <c:when test="${p.trangThai eq 'Sắp Chiếu'}">
								       <p class="status pending">${p.trangThai}</p>
								    </c:when>
								    <c:otherwise>
								        <p class="status cancelled">${p.trangThai}</p>
								    </c:otherwise>
								</c:choose>
                                
                            </td>
<%--                             <td>${p.ngayHieuLucTu } - ${p.ngayHieuLucDen }</td> --%>
                            <td><button class="btn btn-primary" style="width:65px; height:40px; border-radius:20px" data-bs-toggle="modal" data-bs-target="#model_youtube_${p.maPhim}">Trailer</button></td>
                            <td><button class="btn btn-primary" style="width:85px; height:40px; border-radius:20px" data-bs-toggle="modal" data-bs-target="#movie_${p.maPhim}">Xem/Sửa</button></td>
                            <td><button type="submit" action="/admin/delete?${p.maPhim}" class="btn btn-danger deleteButton" style="width:55px; height:40px; border-radius:20px" onclick="prepareDelete(${p.maPhim})" >Xóa</button></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </section>
        </main>
    </div>
    <!--Form ảo để xóa  -->
    <form id="deleteForm" method="POST" action="admin/delete.htm">
    	<input type="hidden" name="maPhim" id="maPhimInput">
	</form>
    <!--End form ảo để xóa  -->
    <!--Phần Model  -->
    <c:forEach var="p" items="${phims}">
    <div class="modal fade getmodals" id="movie_${p.maPhim}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Chi tiết phim</h5>
                <button type="button" class="custom-close-btn" data-bs-dismiss="modal" aria-label="Close">&times;</button>
            </div>
            <div class="modal-body">
            <form class="form_film" method="POST" action="admin/updatePhim.htm" enctype="application/x-www-form-urlencoded" onsubmit="return validateForm()">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="maPhim" class="form-label">Mã Phim:</label>
                            <input type="text" class="form-control" name="maPhim" value="${p.maPhim}" readonly>
                        </div>
                        <div class="col-md-6">
                            <label for="tenPhim" class="form-label">Tên Phim:</label>
                            <input type="text" class="form-control" id="tenPhim" name="tenPhim" value="${p.tenPhim}" readonly required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="trailer" class="form-label">Trailer:</label>
                            <input type="text" class="form-control" id="trailer" name="trailer" value="${p.trailer}" readonly required>
                        </div>
                        <div class="col-md-6">
                            <label for="thoiLuong" class="form-label">Thời Lượng(Phút):</label>
                            <input type="number" class="form-control" id="thoiLuong" name="thoiLuong" value="${p.thoiLuong}" readonly required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="moTa" class="form-label">Mô Tả:</label>
                        <textarea class="form-control" id="moTa" rows="3" name="moTa" required readonly>${p.moTa}</textarea>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="luotXem" class="form-label">Lượt Xem:</label>
                            <input type="text" class="form-control" id="luotXem" name="luotXem" value="${p.luotXem}"readonly required>
                        </div>
                        <div class="col-md-6">
                            <label for="luotThich" class="form-label">Lượt Thích:</label>
                            <input type="text" class="form-control" id="luotThich" name="luotThich" value="${p.luotThich}"readonly required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="trangThai" class="form-label">Trạng Thái:</label>
                            <select class="form-select" id="trangThai" name="trangThai" disabled style="width:370px; height:40px">
                                <option value="Đang Chiếu" ${p.trangThai == 'Đang Chiếu' ? 'selected' : ''}>Đang Chiếu</option>
                                <option value="Sắp Chiếu" ${p.trangThai == 'Sắp Chiếu' ? 'selected' : ''}>Sắp Chiếu</option>
                                <option value="Đã Chiếu" ${p.trangThai == 'Đã Chiếu' ? 'selected' : ''}>Đã Chiếu</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="ngonNgu" class="form-label">Ngôn Ngữ:</label>
                            <input type="text" class="form-control" id="ngonNgu" name="ngonNgu" value="${p.ngonNgu}" required readonly>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="phuDe" class="form-label">Phụ Đề:</label>
                            <input type="text" class="form-control" id="phuDe" name="phuDe" value="${p.phuDe}" required readonly>
                        </div>
                        <div class="col-md-6">
                            <label for="gioiHanTuoi" class="form-label">Giới Hạn Tuổi:</label>
                            <input type="text" class="form-control" id="gioiHanTuoi" name="gioiHanTuoi" value="${p.gioiHanTuoi}" required readonly>
                        </div>
                    </div>
                    <div class="row mb-3">
					    <div class="col-md-6">
					        <label for="ngayHieuLucTu" class="form-label">Ngày Hiệu Lực Từ:</label>
					        <input type="date" class="form-control" id="ngayHieuLucTu" name="ngayHieuLucTu" placeholder="mm/dd/yyyy"  value="${p.ngayHieuLucTu}" required readonly>
					    </div>
					    <div class="col-md-6">
					        <label for="ngayHieuLucDen" class="form-label">Ngày Hiệu Lực Đến:</label>
					        <input type="date" class="form-control" id="ngayHieuLucDen" name ="ngayHieuLucDen" placeholder="mm/dd/yyyy" value="${p.ngayHieuLucDen}" required readonly>
					    </div>
					</div>
					 <div class="mb-3" >
					    <label for="anhBia" class="form-label">Ảnh Bìa:</label>
					    <img src="${p.anhBia}" style="height:1000px" alt="Ảnh Bìa" class="img-fluid mb-2" id="currentAnhBia">
					    <input type="text" class="form-control" id="anhBia" name ="anhBia" accept="image/*" style="display: none; " value="${p.anhBia}">
					</div>
					
					
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-warning" id="changeButton">Chỉnh Sửa</button>
                <button type="submit" class="btn btn-primary" id="saveButton" style="display: none;">Lưu</button>
                
            </div>
        </div>
    </div>
</div>
	</c:forEach>
	<!--End Phần Model  -->
	<!--Model Thêm Phim  -->
	
	<div class="modal fade" id="addPhimModel" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header custom-modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Thêm Bộ Phim</h5>
                <button type="button" class="custom-close-btn btn_exit_addphim" data-bs-dismiss="modal" aria-label="Close">&times;</button>
            </div>
            <div class="modal-body">
                <form id="addPhimForm" method="POST" action="admin/addPhim.htm" enctype="application/x-www-form-urlencoded">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="tenPhim" class="form-label">Tên Phim:</label>
                            <input type="text" class="form-control" id="tenPhim" name="tenPhim" required>
                        </div>
                        <div class="col-md-6">
                            <label for="trailer" class="form-label">Trailer:</label>
                            <input type="url" class="form-control" id="trailer" name="trailer" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="thoiLuong" class="form-label">Thời Lượng (phút):</label>
                            <input type="number" class="form-control" id="thoiLuong" name="thoiLuong" required>
                        </div>
                        <div class="col-md-6">
                            <label for="ngonNgu" class="form-label">Ngôn Ngữ:</label>
                            <input type="text" class="form-control" id="ngonNgu" name="ngonNgu" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="phuDe" class="form-label">Phụ Đề:</label>
                            <input type="text" class="form-control" id="phuDe" name="phuDe" required>
                        </div>
                        <div class="col-md-6">
                            <label for="gioiHanTuoi" class="form-label">Giới Hạn Tuổi:</label>
                            <input type="number" class="form-control" id="gioiHanTuoi" name="gioiHanTuoi" required>
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="ngayHieuLucTu" class="form-label">Ngày Hiệu Lực Từ:</label>
                            <input type="date" class="form-control" id="ngayHieuLucTu" name="ngayHieuLucTu" required>
                        </div>
                        <div class="col-md-6">
                            <label for="ngayHieuLucDen" class="form-label">Ngày Hiệu Lực Đến:</label>
                            <input type="date" class="form-control" id="ngayHieuLucDen" name="ngayHieuLucDen" required>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="moTa" class="form-label">Mô Tả:</label>
                        <textarea class="form-control" id="moTa" rows="3" name="moTa" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label for="anhBia" class="form-label">Ảnh Bìa:</label>
                        <input type="text" class="form-control" id="anhBia" name="anhBia" required>
                    </div>
                    <div class="mb-3">
                        <label for="trangThai" class="form-label">Trạng Thái:</label>
                        <select class="form-control" id="trangThai" name="trangThai" required>
                            <option value="Đang Chiếu">Đang Chiếu</option>
                            <option value="Sắp Chiếu">Sắp Chiếu</option>
                            <option value="Đã Chiếu">Đã Chiếu</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn_canceladd_phim" data-bs-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-primary btn_saveadd_phim" form="addPhimForm">Lưu</button>
            </div>
        </div>
    </div>
</div>


    <!--End Model Thêm bộ phim  -->
    <!--Model youtube  -->
    <c:forEach var="p" items="${phims}">
    <div class="modal fade" id="model_youtube_${p.maPhim}" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="youtubeModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-lg">
		        <div class="modal-content">
		            <div class="modal-header custom-modal-header">
		                <h5 class="modal-title" id="youtubeModalLabel">Trailer Film</h5>
		                <button type="button" class="custom-close-btn" data-bs-dismiss="modal" aria-label="Close">&times;</button>
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
          
     <!--Thông báo  -->
        <c:if test="${not empty message}">
                    <script>
                        alert("${message}");
                    </script>
         		</c:if>
        <!--End Thông báo  -->    
    <!--End Model Youtube  -->
    <!--Phần script  -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
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
        // Chỉnh sửa Phim
        modals.forEach((modal) => {
            const formControls = modal.querySelectorAll('.form-control');
            const changeButton = modal.querySelector('.btn-warning');
            const saveButton = modal.querySelector('.btn-primary');
            const anhBiaInput = modal.querySelector('#anhBia');
            const cancelButton = modal.querySelector('.modal-footer .btn-secondary');
            const closeButton = modal.querySelector('.modal-header .custom-close-btn');
            const trangThai = modal.querySelector('#trangThai');
            const updateFormPhim = modal.querySelector('.form_film');
            updateFormPhim.addEventListener('submit', function(event) {
    	        // Perform form validation or other actions before submitting
    	        if (!updateFormPhim.checkValidity()) {
    	            event.preventDefault();
    	            event.stopPropagation();
    	        }
    	        updateFormPhim.classList.add('was-validated');
    	    }, false);
            

            function resetFormState() {
                // Thêm thuộc tính readonly cho các trường dữ liệu
                formControls.forEach(input => {
                    input.setAttribute('readonly', true);
                });
                
                trangThai.setAttribute('disabled', true);

                // Ẩn nút "Lưu" và hiển thị nút "Chỉnh Sửa"
                changeButton.style.display = 'block';
                saveButton.style.display = 'none';
                if (anhBiaInput) {
                    anhBiaInput.style.display = 'none';
                }
            }

            changeButton.addEventListener('click', function() {
                // Ẩn nút "Chỉnh Sửa" và hiển thị nút "Lưu"
                changeButton.style.display = 'none';
                saveButton.style.display = 'block';
                if (anhBiaInput) {
                    anhBiaInput.style.display = 'block';
                }

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
                // Thiết lập hành động của form để đến trang xử lý cập nhật
                const formFilm = modal.querySelector('.form_film');
                formFilm.action = "admin/updatePhim.htm";
                
                // Gửi form
                formFilm.submit();
            });
        });  
        // End Chỉnh sửa phim
        // Thêm Phim
        const addPhimForm = document.getElementById('addPhimForm');
	    const cancelButtonAddPhim = document.querySelector('.btn_canceladd_phim');
	    const closeButtonAddPhim = document.querySelector('.btn_exit_addphim');
	    cancelButtonAddPhim.addEventListener('click', function() {
	        // Reset form fields
	        addPhimForm.reset();
	    });

	    closeButtonAddPhim.addEventListener('click', function() {
	        // Reset form fields
	        addPhimForm.reset();
	    });

	    addPhimForm.addEventListener('submit', function(event) {
	        // Perform form validation or other actions before submitting
	        if (!addPhimForm.checkValidity()) {
	            event.preventDefault();
	            event.stopPropagation();
	        }
	        addPhimForm.classList.add('was-validated');
	    }, false);
        // End Thêm Phim
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